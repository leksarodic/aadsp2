/*
 * mixerNxM_c_impl.c
 *
 * This file defines the actual implementation of the functions for 
 * mixerNxM_c.
 */
#include <mixerNxM_c_impl.h>
#include "mixerNxM.h"

/*
 * It is a good practice to make MCV shadow. That way host changes
 * are less likely to produce inconsistent state
 */
__memY mcv_t mixerNxM_c_mcv_HOST = MCV_INITIAL_VALUES;
__memY mcv_t mixerNxM_c_mcv;

void __fg_call mixerNxM_c_preKickstart(__memY void * mif_ptr)
{
	// <your code here>
}

void __fg_call mixerNxM_c_postKickstart(void)
{
	mixerNxM_init();
}

void __fg_call mixerNxM_c_timer(void)
{
	// <your code here>
}

void __fg_call mixerNxM_c_frame(void)
{
	// <your code here>
}

void __fg_call mixerNxM_c_brick(void)
{
	mixerNxM_processing(__X_BY_IOBUFFER_PTRS, __X_BY_IOBUFFER_PTRS);
}

void __bg_call mixerNxM_c_background(void)
{
	// make a shadow copy of the MCV so that changes won't affect this function
	mixerNxM_c_mcv = mixerNxM_c_mcv_HOST;

	// <your code here>
}

void __fg_call mixerNxM_c_preMallocInit(void)
{
	// <your code here>
}

void __fg_call mixerNxM_c_postMallocInit(void)
{
	// <your code here>
}
