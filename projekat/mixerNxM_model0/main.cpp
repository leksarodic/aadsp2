#include <stdlib.h>
#include <string.h>
#include "WAVheader.h"

/* Konstante */
#define BLOCK_SIZE 16
#define N 2  // max number of input channels
#define M 8  // max number of output channels

#define DEFAULT_MIXER_GAIN 0.6309573  // -4dB
#define DEFAULT_CHANNEL_GAIN 0.6309573  // -4dB

/*
	U zavisnosti od izlaznog moda koje ste izabrali, matrica pojacanja izgleda:
	(0) om_2_0_0 -> L[0], R[1]
	(1) om_2_2_0 -> L[0], R[1], Ls[2], Rs[3]
	(2) om_2_2_1 -> L[0], R[1], Ls[2], Rs[3], LFE[4]
	(3) om_3_2_0 -> L[0], R[1], C[2], Ls[3], Rs[4]
	(4) om_3_2_1 -> L[0], R[1], C[2], Ls[3], Rs[4], LFE[5]
*/

enum outputMode { om_2_0_0, om_2_2_0, om_2_2_1, om_3_2_0, om_3_2_1 };

int numberOfOutputChannels[5] = { 2, 4, 5, 5, 6 };  // om_2_0_0, om_2_2_0, om_2_2_1, om_3_2_0, om_3_2_1

const int defaultOutputMode = om_2_2_0;  // podrazumevani, ako se ne navede

/* IO bafer */
float sampleBufferInput[N][BLOCK_SIZE];
float sampleBufferOutput[M][BLOCK_SIZE];

typedef struct {
	int enable;  // non-zero to enable this function
	int n_input_channels;
	int m_output_channels;
	float output_gain;  // amount of gain to apply to all output channels
	float gain_matrix[N][M];  // gain_controls
} mixerNxM_data;

void mixerNxM_init(mixerNxM_data *mixerData, float **matricaUlaza, float **matricaIzlaza)
{
	mixerData->enable = 1;

	mixerData->n_input_channels = N;
	mixerData->m_output_channels = numberOfOutputChannels[defaultOutputMode];
	mixerData->output_gain = DEFAULT_MIXER_GAIN;

	/* Pojacanja kanala */
	for (int i = 0; i < N; i++)
	{
		for (int j = 0; j < M; j++)
		{
			mixerData->gain_matrix[i][j] = DEFAULT_CHANNEL_GAIN;
		}
	}

	/* Povezivanje ulaza i izlaza */
	for (int i = 0; i < N; i++)
	{
		matricaUlaza[i] = sampleBufferInput[i];
	}

	for (int i = 0; i < M; i++)
	{
		matricaIzlaza[i] = sampleBufferOutput[i];
	}
}

void mixerNxM_processing(float** input, float** output, mixerNxM_data data)
{
	int i = 0;
	int in = 0;
	int out = 0;
	int gain_index = 0;
	float temp = 0;
	float current_gain;
	float* brick_in;
	float* brick_out;

	/* bypass */
	if (!(data.enable))
	{
		for (out = 0; out < data.m_output_channels; out++)
		{
			brick_out = output[out];
			brick_in = input[out];

			for (i = 0; i < BLOCK_SIZE; i++)
			{
				/* if N < M, bypass N channels to output, other outputs set to zero */
				if (out >= data.n_input_channels)
				{
					brick_out[i] = 0;
				}
				else
				{
					brick_out[i] = brick_in[i];
				}
			}
		}
	}
	/* processing */
	else
	{
		for (out = 0; out < data.m_output_channels; out++)
		{
			brick_out = output[out];
			/* clear old out values */
			for (i = 0; i < BLOCK_SIZE; i++)
			{
				brick_out[i] = 0;
			}

			for (in = 0; in < data.n_input_channels; in++)
			{
				brick_in = input[in];
				for (i = 0; i < BLOCK_SIZE; i++)
				{
					brick_out[i] += data.gain_matrix[in][out] * brick_in[i];
				}
			}

			for (i = 0; i < BLOCK_SIZE; i++)
			{
				brick_out[i] = brick_out[i] * data.output_gain;
			}
		}
	}
}

int main(int argc, char* argv[])
{
	FILE *wav_in = NULL;
	FILE *wav_out = NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr, outputWAVhdr;

	char citajBinarno[] = "rb";
	char pisiBinarno[] = "wb";

	/* Inicijalizacija bafera */
	for (int i = 0; i < N; i++)
	{
		memset(&sampleBufferInput[i], 0, BLOCK_SIZE);
	}

	for (int i = 0; i < M; i++)
	{
		memset(&sampleBufferOutput[i], 0, BLOCK_SIZE);
	}

	/* Open input and output wav files */
	strcpy(WavInputName, argv[1]);
	wav_in = OpenWavFileForRead(WavInputName, citajBinarno);
	strcpy(WavOutputName, argv[2]);
	wav_out = OpenWavFileForRead(WavOutputName, pisiBinarno);

	/* Inicijalizija podataka za obradu */
	float *matricaUlaza[N];
	float *matricaIzlaza[M];
	mixerNxM_data mixerData;

	mixerNxM_init(&mixerData, matricaUlaza, matricaIzlaza);

	/* Ukoliko postoji treci parametar, promeni izlazni mod (broj kanala) */
	if (argc > 3) {
		int thirdParameter = atoi(argv[3]);
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

	int oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size / inputWAVhdr.fmt.NumChannels;
	int oneChannelByteRate = inputWAVhdr.fmt.ByteRate / inputWAVhdr.fmt.NumChannels;
	int oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign / inputWAVhdr.fmt.NumChannels;

	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size * outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate * outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign * outputWAVhdr.fmt.NumChannels;

	/* Write output WAV header to file */
	WriteWavHeader(wav_out, outputWAVhdr);

	/* Processing */
	{
		int sample;
		int BytesPerSample = inputWAVhdr.fmt.BitsPerSample / 8;
		const double SAMPLE_SCALE = -(double)(1 << 31);  // 2^31
		int iNumSamples = inputWAVhdr.data.SubChunk2Size / (inputWAVhdr.fmt.NumChannels*inputWAVhdr.fmt.BitsPerSample / 8);

		/* exact file length should be handled correctly... */
		for (int i = 0; i<iNumSamples / BLOCK_SIZE; i++)
		{
			for (int j = 0; j<BLOCK_SIZE; j++)
			{
				for (int k = 0; k<inputWAVhdr.fmt.NumChannels; k++)
				{
					sample = 0;  // debug
					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample);  // force signextend
					sampleBufferInput[k][j] = sample / SAMPLE_SCALE;  // scale sample to 1.0/-1.0 range		
				}
			}

			/* Pozivamo funkciju obrade */
			mixerNxM_processing(matricaUlaza, matricaIzlaza, mixerData);

			for (int j = 0; j<BLOCK_SIZE; j++)
			{
				for (int k = 0; k<outputWAVhdr.fmt.NumChannels; k++)
				{
					/* Klipovanje */
					if (sampleBufferOutput[k][j] > 1.0)
					{
						sampleBufferOutput[k][j] = 1.0;
					}

					if (sampleBufferOutput[k][j] < -1.0)
					{
						sampleBufferOutput[k][j] = -1.0;
					}
 			
					sample = sampleBufferOutput[k][j] * (SAMPLE_SCALE - 1);
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
