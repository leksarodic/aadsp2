#include <stdio.h>
#include <dsplib\wavefile.h>
#include <stdfix.h>
#include <string.h>
#include <circbuff.h>
#include <dsplib\timers.h>
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
__memX DSPfract sampleBufferInput[N][BLOCK_SIZE];
__memY DSPfract sampleBufferOutput[M][BLOCK_SIZE];

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
__memX DSPfract *matricaUlaza[N];
__memY DSPfract *matricaIzlaza[M];

void mixerNxM_init()
{
	DSPint i;
	DSPint j;

	__memX DSPfract *mixerData_gain_matrix;

	mixerData.enable = 1;

	mixerData.n_input_channels = N;
	mixerData.m_output_channels = (mixerData.enable == 0) ? N : numberOfOutputChannels[defaultOutputMode];
	mixerData.output_gain = DEFAULT_MIXER_GAIN;

	mixerData_gain_matrix = &(mixerData.gain_matrix[0][0]);

	for (i = 0; i < N; i++)
	{
		for (j = 0; j < M; j++)
		{
			(*mixerData_gain_matrix++) = DEFAULT_CHANNEL_GAIN;
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

void mixerNxM_processing(__memX DSPfract* __memX* input, __memY DSPfract* __memX* output)
{
	DSPint i = 0;
	DSPint in = 0;
	DSPint out = 0;
	__memX DSPfract* brick_in;
	__memY DSPfract* brick_out;

	__memX DSPfract *mixerData_gain_matrix;
	mixerData_gain_matrix = &(mixerData.gain_matrix[0][0]);

	/* bypass */
	if (mixerData.enable == 0)
	{
		brick_out = output[0];
		brick_in = input[0];

		for (out = 0; out < mixerData.m_output_channels; out++)
		{
			for (i = 0; i < BLOCK_SIZE; i++)
			{
				/* if N < M, bypass N channels to output, other outputs set to zero */
				if (out - mixerData.n_input_channels >= 0)
				{
					(*brick_out++) = 0;
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
				(*brick_out++) = 0;
			}

			for (in = 0; in < mixerData.n_input_channels; in++)
			{
				brick_out = *(output + out);
				brick_in = *(input + in);

				for (i = 0; i < BLOCK_SIZE; i++)
				{
					/* Potencijalno zameniti sa inline asemblerom */
					DSPint temp = (in * mixerData.n_input_channels) + out;
					__memX DSPfract *gain_matrix = mixerData_gain_matrix + temp;
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

int main(int argc, char *argv[])
 {
	int i;
	int j;

    WAVREAD_HANDLE *wav_in;
    WAVWRITE_HANDLE *wav_out;

	char WavInputName[256];
	char WavOutputName[256];

    int nInputChannels;
    int nOutputChannels;
	int bitsPerSample;
    int sampleRate;
    int iNumSamples;

    unsigned long long countPocetak, countKraj, countInicijalizacija, countProcessing;

    /* Inicijalizacija bafera */
    for (i = 0; i < N; i++)
    {
    	for (j = 0; j < BLOCK_SIZE; j++)
    	{
    		sampleBufferInput[i][j] = 0;
    	}
    }

    for (i = 0; i < M; i++)
    {
    	for (j = 0; j < BLOCK_SIZE; j++)
    	{
    		sampleBufferOutput[i][j] = 0;
    	}
    }

	/* Open input wav file */
	strcpy(WavInputName,"..//..//..//TestStreams//WhiteNoise.wav");
	wav_in = cl_wavread_open(WavInputName);
	if(wav_in == NULL)
    {
        printf("Error: Could not open input wavefile.\n");
        return -1;
    }

	/* Read input wav header */
	nInputChannels = cl_wavread_getnchannels(wav_in);
    bitsPerSample = cl_wavread_bits_per_sample(wav_in);
    sampleRate = cl_wavread_frame_rate(wav_in);
    iNumSamples =  cl_wavread_number_of_frames(wav_in);

    /* Inicijalizija funkcije za obradu */
    countPocetak = cl_get_cycle_count();
    mixerNxM_init();
    countKraj = cl_get_cycle_count();
    countInicijalizacija = countKraj - countPocetak;

    /* Output wav header */
    nOutputChannels = mixerData.m_output_channels;

	/* Open output wav file */
	strcpy(WavOutputName,"..//OutStream//WhiteNoise_model3_out.wav");
	wav_out = cl_wavwrite_open(WavOutputName, bitsPerSample, nOutputChannels, sampleRate);
	if(!wav_out)
    {
        printf("Error: Could not open output wavefile.\n");
        return -1;
    }
	
	/* Processing loop */
    {
		int i;
		int j;
		int k;
		int sample;
		int bound = iNumSamples/BLOCK_SIZE;

		for(i=0; i< bound; i++)
		{
			for(j=0; j<BLOCK_SIZE; j++)
			{
				for(k=0; k<nInputChannels; k++)
				{
					sample = cl_wavread_recvsample(wav_in);
					sampleBufferInput[k][j] = rbits(sample);
				}
			}

			/* Pozivamo funkciju obrade */
			countPocetak = cl_get_cycle_count();
			mixerNxM_processing(matricaUlaza, matricaIzlaza);
			countKraj = cl_get_cycle_count();
			countProcessing = countKraj - countPocetak;

			for(j=0; j<BLOCK_SIZE; j++)
			{
				for(k=0; k<nOutputChannels; k++)
				{
					sample = bitsr(sampleBufferOutput[k][j]);
					cl_wavwrite_sendsample(wav_out, sample);
				}
			}
		}
	}

	/* Close files */
    cl_wavread_close(wav_in);
    cl_wavwrite_close(wav_out);

    return 0;
 }
