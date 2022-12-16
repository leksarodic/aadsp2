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
	.public _defaultOutputMode
	.public _mixerData
	.public _numberOfOutputChannels
	.public _mixerNxM_init
	.public _mixerNxM_processing
X_mixerData	.xdata_ovly
S_mixerData_0	.struct
_enable	.dw (0x0)
_n_input_channels	.dw (0x0)
_m_output_channels	.dw (0x0)
_output_gain	.dw (0x0)
_gain_matrix	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.endstruct

X__extractedConst_0_2	.xdata_ovly
__extractedConst_0_2
	.dw  (0x50c33574)
X_defaultOutputMode	.xdata_ovly
_defaultOutputMode
	.dw  (0x1)
X_mixerData	.xdata_ovly
_mixerData S_mixerData_0

X_numberOfOutputChannels	.xdata_ovly
_numberOfOutputChannels
	.dw  (0x2)
	.dw  (0x4)
	.dw  (0x5)
	.dw  (0x5)
	.dw  (0x6)
	.code_ovly



_mixerNxM_init:			/* LN: 19 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x1)			# LN: 26 | 
	xmem[_mixerData + 0] = a0h			# LN: 26 | 
	uhalfword(a0) = (0x2)			# LN: 28 | 
	xmem[_mixerData + 1] = a0h			# LN: 28 | 
	a0 = xmem[_mixerData + 0]			# LN: 29 | 
	a0 & a0			# LN: 29 | 
	if (a != 0) jmp (elsecondition_0)			# LN: 29 | 
	uhalfword(a0) = (0x2)			# LN: 29 | 
	jmp (endcondition_0)			# LN: 29 | 
elsecondition_0:			/* LN: 29 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_numberOfOutputChannels + 1]			# LN: 29 | 
endcondition_0:			/* LN: 29 | CYCLE: 0 | RULES: () */ 
	xmem[_mixerData + 2] = a0h			# LN: 29 | 
	a0 = xmem[__extractedConst_0_2 + 0]			# LN: 30 | 
	xmem[_mixerData + 3] = a0h			# LN: 30 | 
	i0 = (0) + (_mixerData + 4)			# LN: 32 | 
	do (0x2), label_end_100			# LN: 34 | 
label_begin_100:			/* LN: 34 | CYCLE: 0 | RULES: () */ 
	do (0x8), label_end_99			# LN: 36 | 
label_begin_99:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_0_2 + 0]			# LN: 38 | 
label_end_99:			# LN: 36 | CYCLE: 1 | RULES: ()
	xmem[i0] = a0h; i0 += 1			# LN: 38, 38 | 
init_latch_label_1:			/* LN: 40 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
label_end_100:			# LN: 34 | CYCLE: 0 | RULES: ()
	nop #empty cycle
for_end_0:			/* LN: 34 | CYCLE: 0 | RULES: () */ 
	ret			# LN: 41 | 



_mixerNxM_processing:			/* LN: 43 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i2			# LN: 43 | 
	a0 = xmem[_mixerData + 0]			# LN: 55 | 
	a0 & a0			# LN: 55 | 
	if (a != 0) jmp (else_0)			# LN: 55 | 
	i1 = xmem[i1]			# LN: 57 | 
	i0 = xmem[i0]			# LN: 58 | 
	a0 = xmem[_mixerData + 2]			# LN: 60 | 
	AnyReg(i4, a0h)			# LN: 60 | 
	a0 = 0			# LN: 60 | 
	do (i4), label_end_93			# LN: 60 | 
label_begin_93:			/* LN: 60 | CYCLE: 0 | RULES: () */ 
	do (0x10), label_end_92			# LN: 62 | 
label_begin_92:			/* LN: 62 | CYCLE: 0 | RULES: () */ 
	a1 = xmem[_mixerData + 1]			# LN: 65 | 
	a1 = a0 - a1			# LN: 65 | 
	if (a < 0) jmp (else_1)			# LN: 65 | 
	a1 = 0			# LN: 67 | 
	ymem[i1] = a1h; i1 += 1			# LN: 67, 67 | 
	jmp (endif_1)			# LN: 67 | 
else_1:			/* LN: 65 | CYCLE: 0 | RULES: () */ 
	a1 = xmem[i0]; i0 += 1			# LN: 71, 71 | 
	ymem[i1] = a1h; i1 += 1			# LN: 71, 71 | 
init_latch_label_2:			/* LN: 73 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 65 | CYCLE: 0 | RULES: () */ 
label_end_92:			# LN: 62 | CYCLE: 0 | RULES: ()
	nop #empty cycle
for_end_3:			/* LN: 62 | CYCLE: 0 | RULES: () */ 
	i1 += 1			# LN: 75 | 
	uhalfword(a1) = (0x1)			# LN: 60 | 
label_end_93:			# LN: 60 | CYCLE: 2 | RULES: ()
	i0 += 1; a0 = a0 + a1			# LN: 76, 60 | 
for_end_2:			/* LN: 60 | CYCLE: 0 | RULES: () */ 
	jmp (endif_0)			# LN: 60 | 
else_0:			/* LN: 55 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_mixerData + 2]			# LN: 82 | 
	AnyReg(i4, a0h)			# LN: 82 | 
	a0 = 0			# LN: 82 | 
	do (i4), label_end_98			# LN: 82 | 
label_begin_98:			/* LN: 82 | CYCLE: 0 | RULES: () */ 
	a1 = i1			# LN: 84 | 
	a1 = a1 + a0			# LN: 84 | 
	AnyReg(i4, a1h)			# LN: 84 | 
	nop #empty cycle
	i4 = xmem[i4]			# LN: 84 | 
	do (0x10), label_end_94			# LN: 86 | 
label_begin_94:			/* LN: 86 | CYCLE: 0 | RULES: () */ 
	a1 = 0			# LN: 88 | 
label_end_94:			# LN: 86 | CYCLE: 1 | RULES: ()
	ymem[i4] = a1h; i4 += 1			# LN: 88, 88 | 
for_end_5:			/* LN: 86 | CYCLE: 0 | RULES: () */ 
	a1 = xmem[_mixerData + 1]			# LN: 91 | 
	AnyReg(i4, a1h)			# LN: 91 | 
	a1 = 0			# LN: 91 | 
	do (i4), label_end_96			# LN: 91 | 
label_begin_96:			/* LN: 91 | CYCLE: 0 | RULES: () */ 
	b0 = i1			# LN: 93 | 
	b1 = i0; b0 = b0 + a0			# LN: 94, 93 | 
	AnyReg(i4, b0h)			# LN: 93 | 
	b0 = b1 + a1			# LN: 94 | 
	AnyReg(i5, b0h)			# LN: 94 | 
	i4 = xmem[i4]			# LN: 93 | 
	i5 = xmem[i5]			# LN: 94 | 
	do (0x10), label_end_95			# LN: 96 | 
label_begin_95:			/* LN: 96 | CYCLE: 0 | RULES: () */ 
	x0 = xmem[_mixerData + 1]			# LN: 99 | 
	x1 = a1h			# LN: 99 | 
	b1 = ymem[i4]; b0 = x1 * x0			# LN: 101, 99 | 
	x0 = xmem[i5]; i5 += 1; b0 = b0 >> 1			# LN: 101, 104, 99 | 
	AnyReg(b0h, b0l)			# LN: 99 | 
	b0l = (0x0)			# LN: 99 | 
	b0 = b0 + a0			# LN: 99 | 
	i2 = b0; b0 =+ b1			# LN: 100, 101 | 
	nop #empty cycle
	i2 = i2 + (_mixerData + 4)			# LN: 100 | 
	x1 = xmem[i2]			# LN: 101 | 
	b0 += x1 * x0			# LN: 101 | 
label_end_95:			# LN: 96 | CYCLE: 12 | RULES: ()
	ymem[i4] = b0; i4 += 1			# LN: 101, 103 | 
init_latch_label_6:			/* LN: 106 | CYCLE: 0 | RULES: () */ 
for_end_7:			/* LN: 96 | CYCLE: 0 | RULES: () */ 
	uhalfword(b0) = (0x1)			# LN: 91 | 
label_end_96:			# LN: 91 | CYCLE: 1 | RULES: ()
	a1 = a1 + b0			# LN: 91 | 
for_end_6:			/* LN: 91 | CYCLE: 0 | RULES: () */ 
	a1 = i1			# LN: 108 | 
	a1 = a1 + a0			# LN: 108 | 
	AnyReg(i4, a1h)			# LN: 108 | 
	nop #empty cycle
	i4 = xmem[i4]			# LN: 108 | 
	do (0x10), label_end_97			# LN: 109 | 
label_begin_97:			/* LN: 109 | CYCLE: 0 | RULES: () */ 
	x0 = ymem[i4]			# LN: 111 | 
	x1 = xmem[_mixerData + 3]			# LN: 111 | 
	a1 = x0 * x1			# LN: 111 | 
label_end_97:			# LN: 109 | CYCLE: 3 | RULES: ()
	ymem[i4] = a1; i4 += 1			# LN: 111, 112 | 
init_latch_label_8:			/* LN: 114 | CYCLE: 0 | RULES: () */ 
for_end_8:			/* LN: 109 | CYCLE: 0 | RULES: () */ 
	uhalfword(a1) = (0x1)			# LN: 82 | 
label_end_98:			# LN: 82 | CYCLE: 1 | RULES: ()
	a0 = a0 + a1			# LN: 82 | 
endif_0:			/* LN: 55 | CYCLE: 0 | RULES: () */ 
for_end_4:			/* LN: 82 | CYCLE: 0 | RULES: () */ 
	i2 = xmem[i7]			# LN: 116 | 
	ret			# LN: 116 | 
