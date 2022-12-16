/*
 * mixerNxM_c.c
 *
 * This file defines the data structures necessary for a module that fits into
 * the Cirrus Logic OS Framework.
 */
#include <mixerNxM_c_impl.h>
 
/*
 * Define the MCT for mixerNxM_c
 */
static __memY mct_t mixerNxM_c_mct = {
	&mixerNxM_c_preKickstart,			// prekick function
	&mixerNxM_c_postKickstart,			// postkick function
	&mixerNxM_c_timer,					// timer function
	&mixerNxM_c_frame,					// frame function
	&mixerNxM_c_brick,					// block function
	0,										// reserved
	&mixerNxM_c_background,			// background function
	&mixerNxM_c_postMallocInit,		// post-malloc function
	&mixerNxM_c_preMallocInit			// pre-malloc function
};

/* 
 * Define the MIF for mixerNxM_c
 */
__memY mif_t mixerNxM_c_mif = {
	&mixerNxM_c_mcv_HOST,
	&mixerNxM_c_mct
};
