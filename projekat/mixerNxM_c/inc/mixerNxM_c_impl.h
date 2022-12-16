/** @file mixerNxM_c_impl.h
 *
 *  This file declares implementation data types for 
 *  mixerNxM_c.
 */
 
#ifndef mixerNxM_c_IMPL_H_
#define mixerNxM_c_IMPL_H_ 

#include <stdfix.h>
#include <dsplib/cl_os.h>
#include <mixerNxM_c_mcv.h>
#include <mixerNxM_c_module.h>

extern __memY mcv_t mixerNxM_c_mcv_HOST;
extern __memY mcv_t mixerNxM_c_mcv;

extern void __fg_call mixerNxM_c_preKickstart(__memY void * mif_ptr);
extern void __fg_call mixerNxM_c_postKickstart(void);
extern void __fg_call mixerNxM_c_timer(void);
extern void __fg_call mixerNxM_c_frame(void);
extern void __fg_call mixerNxM_c_brick(void);
extern void __bg_call mixerNxM_c_background(void);
extern void __fg_call mixerNxM_c_postMallocInit(void);
extern void __fg_call mixerNxM_c_preMallocInit(void);

#endif
