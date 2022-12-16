#ifndef COMMON_H
#define COMMON_H

/* Konstante */
#define BLOCK_SIZE 16
#define N 2  // max number of input channels
#define M 8  // max number of output channels

#define DEFAULT_MIXER_GAIN 0.6309573  // -4dB
#define DEFAULT_CHANNEL_GAIN 0.6309573  // -4dB

const double SAMPLE_SCALE = -(double)(1 << 31);  // 2^31

/* Definicije DSP tipova */
typedef short DSPshort;  /* DSP integer */
typedef unsigned short DSPushort;  /* DSP unsigned integer */
typedef int DSPint;  /* native integer */
typedef double DSPfract;  /* DSP fixed-point fractional */
typedef double DSPaccum;  /* DSP fixed-point fractional */

/* Modovi izlaza */
enum outputMode { om_2_0_0, om_2_2_0, om_2_2_1, om_3_2_0, om_3_2_1 };

#endif
