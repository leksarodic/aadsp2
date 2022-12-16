#include <stdio.h>
#include <dsplib\wavefile.h>
#include <stdfix.h>
#include <string.h>
#include "common.h"
#include <circbuff.h>
#include <dsplib/cl_os.h>
#include <mixerNxM_c_mcv.h>

#include "mixerNxM.h"

/* Konstante, izlazni mod */
const DSPint numberOfOutputChannels[5] = { 2, 4, 5, 5, 6 };  // om_2_0_0, om_2_2_0, om_2_2_1, om_3_2_0, om_3_2_1
const DSPint defaultOutputMode = om_2_2_0;  // podrazumevani, ako se ne navede

/* Globalne promenjive */
mixerNxM_data mixerData;

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
			for (i = 0; i < BRICK_SIZE; i++)
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
			for (i = 0; i < BRICK_SIZE; i++)
			{
				(*brick_out++) = 0;
			}

			for (in = 0; in < mixerData.n_input_channels; in++)
			{
				brick_out = *(output + out);
				brick_in = *(input + in);

				for (i = 0; i < BRICK_SIZE; i++)
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
			for (i = 0; i < BRICK_SIZE; i++)
			{
				(*brick_out) = (*brick_out) * mixerData.output_gain;
				brick_out++;
			}
		}
	}
}
