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
	.public _mixerNxM_c_mcv
	.public _mixerNxM_c_mcv_HOST
	.extern _mixerNxM_c_mif
	.public _mixerNxM_c_background
	.public _mixerNxM_c_brick
	.public _mixerNxM_c_frame
	.public _mixerNxM_c_postKickstart
	.public _mixerNxM_c_postMallocInit
	.public _mixerNxM_c_preKickstart
	.public _mixerNxM_c_preMallocInit
	.public _mixerNxM_c_timer
	.extern _mixerNxM_init
	.extern _mixerNxM_processing
	.extern cl_clearNM0_7
Y_mixerNxM_c_mcv_HOST	.ydata_ovly
S_mixerNxM_c_mcv_HOST_0	.struct
_enable	.dw (0x0)
_defaultOutputMode	.dw (0x0)
_knob	.dw (0x0)
_output_gain	.dw (0x0)
_knob_0	.dw (0x0)
_knob_1	.dw (0x0)
_knob_2	.dw (0x0)
_knob_3	.dw (0x0)
_knob_4	.dw (0x0)
_knob_5	.dw (0x0)
_knob_6	.dw (0x0)
_knob_7	.dw (0x0)
_knob_8	.dw (0x0)
	.endstruct

Y_mixerNxM_c_mcv	.ydata_ovly
_mixerNxM_c_mcv S_mixerNxM_c_mcv_HOST_0

Y_mixerNxM_c_mcv_HOST	.ydata_ovly
_mixerNxM_c_mcv_HOST S_mixerNxM_c_mcv_HOST_0 (
 0x1,
 0x1,
 0x50c335d3,
 0x50c335d3,
 0x50c335d3,
 0x50c335d3,
 0x50c335d3,
 0x50c335d3,
 0x50c335d3,
 0x50c335d3,
 0x50c335d3,
 0x50c335d3,
 0x50c335d3
)

	.code_ovly



_mixerNxM_c_background:			/* LN: 42 | CYCLE: 0 | RULES: () */ 
	call (cl_clearNM0_7)			# LN: 42 | 
	i7 = (0) + (___C_STACK_BG)			# LN: 42 | 
	i0 = (0) + (_mixerNxM_c_mcv_HOST)			# LN: 45 | 
	i1 = (0) + (_mixerNxM_c_mcv)			# LN: 45 | 
	do (0xd), label_end_11_0			# LN: 45 | 
label_begin_11_0:			/* LN: 45 | CYCLE: 0 | RULES: (CLowerMoveStructOrArrayFromMemToMem32to32) */ 
	x0 = ymem[i0]; i0 += 1			# LN: 45, 45 | 
label_end_11_0:			# LN: 45 | CYCLE: 1 | RULES: (CLowerMoveStructOrArrayFromMemToMem32to32)
	ymem[i1] = x0; i1 += 1			# LN: 45, 45 | 
	ret			# LN: 48 | 



_mixerNxM_c_brick:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
	call (cl_clearNM0_7)			# LN: 37 | 
	i7 = (0) + (___C_STACK_FG)			# LN: 37 | 
	i0 = (0) + (___X_BY_IOBUFFER_PTRS)			# LN: 39 | 
	i1 = (0) + (___X_BY_IOBUFFER_PTRS)			# LN: 39 | 
	call (_mixerNxM_processing)			# LN: 39 | 
	ret			# LN: 40 | 



_mixerNxM_c_frame:			/* LN: 32 | CYCLE: 0 | RULES: () */ 
	call (cl_clearNM0_7)			# LN: 32 | 
	i7 = (0) + (___C_STACK_FG)			# LN: 32 | 
	ret			# LN: 35 | 



_mixerNxM_c_postKickstart:			/* LN: 22 | CYCLE: 0 | RULES: () */ 
	call (cl_clearNM0_7)			# LN: 22 | 
	i7 = (0) + (___C_STACK_FG)			# LN: 22 | 
	call (_mixerNxM_init)			# LN: 24 | 
	ret			# LN: 25 | 



_mixerNxM_c_postMallocInit:			/* LN: 55 | CYCLE: 0 | RULES: () */ 
	call (cl_clearNM0_7)			# LN: 55 | 
	i7 = (0) + (___C_STACK_FG)			# LN: 55 | 
	ret			# LN: 58 | 



_mixerNxM_c_preKickstart:			/* LN: 17 | CYCLE: 0 | RULES: () */ 
	call (cl_clearNM0_7)			# LN: 17 | 
	i7 = (0) + (___C_STACK_FG)			# LN: 17 | 
	ret			# LN: 20 | 



_mixerNxM_c_preMallocInit:			/* LN: 50 | CYCLE: 0 | RULES: () */ 
	call (cl_clearNM0_7)			# LN: 50 | 
	i7 = (0) + (___C_STACK_FG)			# LN: 50 | 
	ret			# LN: 53 | 



_mixerNxM_c_timer:			/* LN: 27 | CYCLE: 0 | RULES: () */ 
	call (cl_clearNM0_7)			# LN: 27 | 
	i7 = (0) + (___C_STACK_FG)			# LN: 27 | 
	ret			# LN: 30 | 
