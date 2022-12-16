#include <stdlib.h>
#include <string.h>
#include "WAVheader.h"
#include "stdfix_emu.h"
#include "fixed_point_math.h"
#include "common.h"

/*
	U zavisnosti od izlaznog moda koje ste izabrali, matrica pojacanja izgleda:
	(0) om_2_0_0 -> L[0], R[1]
	(1) om_2_2_0 -> L[0], R[1], Ls[2], Rs[3]
	(2) om_2_2_1 -> L[0], R[1], Ls[2], Rs[3], LFE[4]
	(3) om_3_2_0 -> L[0], R[1], C[2], Ls[3], Rs[4]
	(4) om_3_2_1 -> L[0], R[1], C[2], Ls[3], Rs[4], LFE[5]
*/

const DSPint numberOfOutputChannels[5] = { 2, 4, 5, 5, 6 };  // om_2_0_0, om_2_2_0, om_2_2_1, om_3_2_0, om_3_2_1
const DSPint defaultOutputMode = om_2_2_0;  // podrazumevani, ako se ne navede

/* IO bafer */
DSPfract sampleBufferInput[N][BLOCK_SIZE];
DSPfract sampleBufferOutput[M][BLOCK_SIZE];

/* Definicije */
typedef struct {
	DSPint enable;  // non-zero to enable this function
	DSPint n_input_channels;
	DSPint m_output_channels;
	DSPfract output_gain;  // amount of gain to apply to all output channels
	DSPfract gain_matrix[N][M];  // gain_controls
} mixerNxM_data;

/* Globalne promenjive */
mixerNxM_data mixerData;
DSPfract *matricaUlaza[N];
DSPfract *matricaIzlaza[M];

void mixerNxM_init()
{
	DSPint i;
	DSPint j;

	mixerData.enable = 1;

	mixerData.n_input_channels = N;
	mixerData.m_output_channels = (mixerData.enable == 0) ? N : numberOfOutputChannels[defaultOutputMode];
	mixerData.output_gain = FRACT_NUM(DEFAULT_MIXER_GAIN);

	DSPfract *mixerData_gain_matrix;
	mixerData_gain_matrix = &(mixerData.gain_matrix[0][0]);

	/* Pojacanja kanala; Ls[0], L[1], C[2], LFE[3], R[4], Rs[5] */
	for (i = 0; i < N; i++)
	{
		for (j = 0; j < M; j++)
		{
			(*mixerData_gain_matrix++) = FRACT_NUM(DEFAULT_CHANNEL_GAIN);
		}
	}

	/* Povezivanje ulaza i izlaza */
	for (j = 0; j < N; j++)
	{
		matricaUlaza[j] = sampleBufferInput[j];
	}

	for (j = 0; j < M; j++)
	{
		matricaIzlaza[j] = sampleBufferOutput[j];
	}
}

void mixerNxM_processing(DSPfract** input, DSPfract** output)
{
	DSPint i = 0;
	DSPint in = 0;
	DSPint out = 0;
	DSPint gain_index = 0;
	DSPfract temp = 0;
	DSPfract current_gain = FRACT_NUM(0.0);
	DSPfract* brick_in;
	DSPfract* brick_out;

	DSPfract *mixerData_gain_matrix;
	mixerData_gain_matrix = &(mixerData.gain_matrix[0][0]);

	/* bypass */
	if (!(mixerData.enable))
	{
		brick_out = output[0];
		brick_in = input[0];

		for (out = 0; out < mixerData.m_output_channels; out++)
		{
			for (i = 0; i < BLOCK_SIZE; i++)
			{
				/* if N < M, bypass N channels to output, other outputs set to zero */
				if (out >= mixerData.n_input_channels)
				{
					(*brick_out++) = FRACT_NUM(0.0);
				}
				else
				{
					(*brick_out++) = (*brick_in++);
				}
			}

			brick_out++;
			brick_in++;
		}
	}
	/* processing */
	else
	{
		for (out = 0; out < mixerData.m_output_channels; out++)
		{
			brick_out = *(output + out);
			/* clear old out values */
			for (i = 0; i < BLOCK_SIZE; i++)
			{
				(*brick_out++) = FRACT_NUM(0.0);
			}

			for (in = 0; in < mixerData.n_input_channels; in++)
			{
				brick_out = *(output + out);
				brick_in = *(input + in);

				for (i = 0; i < BLOCK_SIZE; i++)
				{
					DSPfract *gain_matrix = mixerData_gain_matrix + (in * mixerData.n_input_channels) + out;
					(*brick_out) += (*gain_matrix) * (*brick_in);

					brick_out++;
					brick_in++;
				}
			}

			brick_out = *(output + out);
			for (i = 0; i < BLOCK_SIZE; i++)
			{
				(*brick_out) = (*brick_out) * mixerData.output_gain;
				brick_out++;
			}
		}
	}
}

DSPint main(DSPint argc, char* argv[])
{
	FILE *wav_in = NULL;
	FILE *wav_out = NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr, outputWAVhdr;

	char citajBinarno[] = "rb";
	char pisiBinarno[] = "wb";

	/* Inicijalizacija bafera */
	for (DSPint i = 0; i < N; i++)
	{
		for (DSPint j = 0; j < BLOCK_SIZE; j++)
		{
			sampleBufferInput[i][j] = FRACT_NUM(0.0);
		}
	}

	for (DSPint i = 0; i < M; i++)
	{
		for (DSPint j = 0; j < BLOCK_SIZE; j++)
		{
			sampleBufferOutput[i][j] = FRACT_NUM(0.0);
		}
	}

	/* Open input and output wav files */
	strcpy(WavInputName, argv[1]);
	wav_in = OpenWavFileForRead(WavInputName, citajBinarno);
	strcpy(WavOutputName, argv[2]);
	wav_out = OpenWavFileForRead(WavOutputName, pisiBinarno);

	/* Inicijalizija funkcije za obradu */
	mixerNxM_init();

	/* Ukoliko postoji treci parametar, promeni izlazni mod (broj kanala) */
	if (argc > 3) {
		DSPint thirdParameter = atoi(argv[3]);
		if (thirdParameter >= 0 && thirdParameter <= 4)
		{
			mixerData.m_output_channels = numberOfOutputChannels[thirdParameter];
		}
	}

	/* Read input wav header */
	ReadWavHeader(wav_in, inputWAVhdr);

	/* Set up output WAV header */
	outputWAVhdr = inputWAVhdr;
	outputWAVhdr.fmt.NumChannels = mixerData.m_output_channels;  // change number of channels

	DSPint oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size / inputWAVhdr.fmt.NumChannels;
	DSPint oneChannelByteRate = inputWAVhdr.fmt.ByteRate / inputWAVhdr.fmt.NumChannels;
	DSPint oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign / inputWAVhdr.fmt.NumChannels;

	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size * outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate * outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign * outputWAVhdr.fmt.NumChannels;

	/* Write output WAV header to file */
	WriteWavHeader(wav_out, outputWAVhdr);

	/* Processing */
	{
		DSPint i;
		DSPint j;
		DSPint k;

		DSPint sample;
		DSPint BytesPerSample = inputWAVhdr.fmt.BitsPerSample / 8;
		DSPint iNumSamples = inputWAVhdr.data.SubChunk2Size / (inputWAVhdr.fmt.NumChannels*inputWAVhdr.fmt.BitsPerSample / 8);

		/* exact file length should be handled correctly... */
		for (i = 0; i<iNumSamples / BLOCK_SIZE; i++)
		{
			for (j = 0; j<BLOCK_SIZE; j++)
			{
				for (k = 0; k<inputWAVhdr.fmt.NumChannels; k++)
				{
					sample = 0;  // debug
					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample);  // force signextend
					sampleBufferInput[k][j] = sample / SAMPLE_SCALE;  // scale sample to 1.0/-1.0 range		
				}
			}

			/* Pozivamo funkciju obrade */
			mixerNxM_processing(matricaUlaza, matricaIzlaza);

			for (j = 0; j<BLOCK_SIZE; j++)
			{
				for (k = 0; k<outputWAVhdr.fmt.NumChannels; k++)
				{
					sample = sampleBufferOutput[k][j].toLong();
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample / 8, 1, wav_out);
				}
			}
		}
	}

	/* Close files */
	fclose(wav_in);
	fclose(wav_out);

	return 0;
}
