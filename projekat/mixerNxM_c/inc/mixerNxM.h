#include <stdio.h>
#include "common.h"

/* Definicije */
typedef struct {
	DSPint enable;  // non-zero to enable this function
	DSPint n_input_channels;
	DSPint m_output_channels;
	DSPfract output_gain;  // amount of gain to apply to all output channels
	DSPfract gain_matrix[N][M];  // gain_controls
} mixerNxM_data;

/* Modovi izlaza */
enum outputMode { om_2_0_0, om_2_2_0, om_2_2_1, om_3_2_0, om_3_2_1 };

/* Funkcije */
void mixerNxM_init();
void mixerNxM_processing(__memX DSPfract* __memX* input, __memY DSPfract* __memX* output);
