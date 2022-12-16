	.extern ___C_STACK_BG
	.extern ___C_STACK_FG
	.extern ___X_BL_TEMPBUFF
	.extern ___X_BL_TEMPBUFF0
	.extern ___X_BL_TEMPBUFF1
	.extern ___X_BL_TEMPBUFF10
	.extern ___X_BL_TEMPBUFF11
	.extern ___X_BL_TEMPBUFF12
	.extern ___X_BL_TEMPBUFF13
	.extern ___X_BL_TEMPBUFF14
	.extern ___X_BL_TEMPBUFF15
	.extern ___X_BL_TEMPBUFF2
	.extern ___X_BL_TEMPBUFF3
	.extern ___X_BL_TEMPBUFF4
	.extern ___X_BL_TEMPBUFF5
	.extern ___X_BL_TEMPBUFF6
	.extern ___X_BL_TEMPBUFF7
	.extern ___X_BL_TEMPBUFF8
	.extern ___X_BL_TEMPBUFF9
	.extern ___X_BX_TEMPBUFF
	.extern ___X_BX_TEMPBUFF0
	.extern ___X_BX_TEMPBUFF1
	.extern ___X_BX_TEMPBUFF10
	.extern ___X_BX_TEMPBUFF11
	.extern ___X_BX_TEMPBUFF12
	.extern ___X_BX_TEMPBUFF13
	.extern ___X_BX_TEMPBUFF14
	.extern ___X_BX_TEMPBUFF15
	.extern ___X_BX_TEMPBUFF2
	.extern ___X_BX_TEMPBUFF3
	.extern ___X_BX_TEMPBUFF4
	.extern ___X_BX_TEMPBUFF5
	.extern ___X_BX_TEMPBUFF6
	.extern ___X_BX_TEMPBUFF7
	.extern ___X_BX_TEMPBUFF8
	.extern ___X_BX_TEMPBUFF9
	.extern ___X_BY_IOBUFFER_PTRS
	.extern ___X_BY_TEMPBUFF
	.extern ___X_BY_TEMPBUFF0
	.extern ___X_BY_TEMPBUFF1
	.extern ___X_BY_TEMPBUFF10
	.extern ___X_BY_TEMPBUFF11
	.extern ___X_BY_TEMPBUFF12
	.extern ___X_BY_TEMPBUFF13
	.extern ___X_BY_TEMPBUFF14
	.extern ___X_BY_TEMPBUFF15
	.extern ___X_BY_TEMPBUFF2
	.extern ___X_BY_TEMPBUFF3
	.extern ___X_BY_TEMPBUFF4
	.extern ___X_BY_TEMPBUFF5
	.extern ___X_BY_TEMPBUFF6
	.extern ___X_BY_TEMPBUFF7
	.extern ___X_BY_TEMPBUFF8
	.extern ___X_BY_TEMPBUFF9
	.extern ___X_VX_NEXTFRM_REINIT_REQ
	.extern ___X_VX_PPM_INPUTMODE
	.extern ___X_VX_PPM_INPUT_CHANNELS
	.extern ___X_VX_PPM_OUTPUTMODE
	.extern ___X_VX_PPM_OUTPUT_CHANNELS
	.extern ___X_VX_PPM_SAMPLERATE
	.extern ___X_VX_PPM_VALID_CHANNELS
	.extern ___X_VX_REINIT
	.extern ___X_VX_UNDERFLOW
	.extern _mixerNxM_c_mcv
	.extern _mixerNxM_c_mcv_HOST
	.public _mixerNxM_c_mif
	.extern _mixerNxM_c_background
	.extern _mixerNxM_c_brick
	.extern _mixerNxM_c_frame
	.extern _mixerNxM_c_postKickstart
	.extern _mixerNxM_c_postMallocInit
	.extern _mixerNxM_c_preKickstart
	.extern _mixerNxM_c_preMallocInit
	.extern _mixerNxM_c_timer
Y_mixerNxM_c_mif	.ydata_ovly
S_mixerNxM_c_mif_0	.struct
_mcv_ptr	.dw (0x0)
_mct_ptr	.dw (0x0)
_reserved1	.dw (0x0)
_reserved2	.dw (0x0)
_reserved3	.dw (0x0)
_reserved4	.dw (0x0)
_reserved5	.dw (0x0)
_reserved6	.dw (0x0)
	.endstruct

Y_mixerNxM_c_mct	.ydata_ovly
S_mixerNxM_c_mct_0	.struct
_prekick_func_ptr	.dw (0x0)
_postkick_func_ptr	.dw (0x0)
_timer_func_ptr	.dw (0x0)
_frame_func_ptr	.dw (0x0)
_block_func_ptr	.dw (0x0)
_reserved1	.dw (0x0)
_background_func_ptr	.dw (0x0)
_postmalloc_func_ptr	.dw (0x0)
_premalloc_func_ptr	.dw (0x0)
	.endstruct

Y_mixerNxM_c_mct	.ydata_ovly
_mixerNxM_c_mct S_mixerNxM_c_mct_0 (
 _mixerNxM_c_preKickstart,
 _mixerNxM_c_postKickstart,
 _mixerNxM_c_timer,
 _mixerNxM_c_frame,
 _mixerNxM_c_brick,
 0x0,
 _mixerNxM_c_background,
 _mixerNxM_c_postMallocInit,
 _mixerNxM_c_preMallocInit
)

Y_mixerNxM_c_mif	.ydata_ovly
_mixerNxM_c_mif S_mixerNxM_c_mif_0 (
 _mixerNxM_c_mcv_HOST,
 _mixerNxM_c_mct,
 0x0,
 0x0,
 0x0,
 0x0,
 0x0,
 0x0
)

	.code_ovly
