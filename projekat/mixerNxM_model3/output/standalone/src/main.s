	.extern ___TIMER0_COUNT
	.extern ___TIMER1_COUNT
	.extern ___TIMER1_ENABLE
	.public _defaultOutputMode
	.public _matricaIzlaza
	.public _matricaUlaza
	.public _mixerData
	.public _numberOfOutputChannels
	.public _sampleBufferInput
	.public _sampleBufferOutput
	.extern _cl_get_cycle_count
	.extern _cl_wavread_bits_per_sample
	.extern _cl_wavread_close
	.extern _cl_wavread_frame_rate
	.extern _cl_wavread_getnchannels
	.extern _cl_wavread_number_of_frames
	.extern _cl_wavread_open
	.extern _cl_wavread_recvsample
	.extern _cl_wavwrite_close
	.extern _cl_wavwrite_open
	.extern _cl_wavwrite_sendsample
	.public _main
	.public _mixerNxM_init
	.public _mixerNxM_processing
	.extern _printf
	.extern _strcpy
	.extern __div
	.xdata_ovly
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

	.xdata_ovly
__extractedConst_0_2
	.dw  (0x50c33574)
	.xdata_ovly
_defaultOutputMode
	.dw  (0x1)
	.xdata_ovly
_matricaIzlaza
	.bss (0x8)
	.xdata_ovly
_matricaUlaza
	.bss (0x2)
	.xdata_ovly
_mixerData S_mixerData_0

	.xdata_ovly
_numberOfOutputChannels
	.dw  (0x2)
	.dw  (0x4)
	.dw  (0x5)
	.dw  (0x5)
	.dw  (0x6)
	.xdata_ovly
_sampleBufferInput
	.bss (0x20)
	.ydata_ovly
_sampleBufferOutput
	.bss (0x80)
	.xdata_ovly
_string_const_0
	.dw  (0x2e)
	.dw  (0x2e)
	.dw  (0x2f)
	.dw  (0x2f)
	.dw  (0x2e)
	.dw  (0x2e)
	.dw  (0x2f)
	.dw  (0x2f)
	.dw  (0x2e)
	.dw  (0x2e)
	.dw  (0x2f)
	.dw  (0x2f)
	.dw  (0x54)
	.dw  (0x65)
	.dw  (0x73)
	.dw  (0x74)
	.dw  (0x53)
	.dw  (0x74)
	.dw  (0x72)
	.dw  (0x65)
	.dw  (0x61)
	.dw  (0x6d)
	.dw  (0x73)
	.dw  (0x2f)
	.dw  (0x2f)
	.dw  (0x57)
	.dw  (0x68)
	.dw  (0x69)
	.dw  (0x74)
	.dw  (0x65)
	.dw  (0x4e)
	.dw  (0x6f)
	.dw  (0x69)
	.dw  (0x73)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x0)
	.xdata_ovly
_string_const_1
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x69)
	.dw  (0x6e)
	.dw  (0x70)
	.dw  (0x75)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.xdata_ovly
_string_const_2
	.dw  (0x2e)
	.dw  (0x2e)
	.dw  (0x2f)
	.dw  (0x2f)
	.dw  (0x4f)
	.dw  (0x75)
	.dw  (0x74)
	.dw  (0x53)
	.dw  (0x74)
	.dw  (0x72)
	.dw  (0x65)
	.dw  (0x61)
	.dw  (0x6d)
	.dw  (0x2f)
	.dw  (0x2f)
	.dw  (0x57)
	.dw  (0x68)
	.dw  (0x69)
	.dw  (0x74)
	.dw  (0x65)
	.dw  (0x4e)
	.dw  (0x6f)
	.dw  (0x69)
	.dw  (0x73)
	.dw  (0x65)
	.dw  (0x5f)
	.dw  (0x6d)
	.dw  (0x6f)
	.dw  (0x64)
	.dw  (0x65)
	.dw  (0x6c)
	.dw  (0x33)
	.dw  (0x5f)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x74)
	.dw  (0x2e)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x0)
	.xdata_ovly
_string_const_3
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x74)
	.dw  (0x70)
	.dw  (0x75)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.code_ovly



	# This construction should ensure linking of crt0 in case when target is a standalone program without the OS
	.if defined(_OVLY_)
		.if .strcmp('standalone',_OVLY_)=0
		.if .strcmp('crystal32',_TARGET_FAMILY_)=0
			.extern __start         # dummy use of __start to force linkage of crt0
dummy		.equ(__start)
		.else
			.extern __intvec         # dummy use of __intvec to force linkage of intvec
dummy		.equ(__intvec)
		.endif
		.endif
	.endif

_main:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = a2g; i7 += 1			# LN: 149, 149 | 
	xmem[i7] = a2h; i7 += 1			# LN: 149, 149 | 
	xmem[i7] = a2l; i7 += 1			# LN: 149, 149 | 
	xmem[i7] = i2; i7 += 1			# LN: 149, 149 | 
	xmem[i7] = a3g; i7 += 1			# LN: 149, 149 | 
	xmem[i7] = a3h; i7 += 1			# LN: 149, 149 | 
	xmem[i7] = a3l; i7 += 1			# LN: 149, 149 | 
	xmem[i7] = b2g; i7 += 1			# LN: 149, 149 | 
	xmem[i7] = b2h; i7 += 1			# LN: 149, 149 | 
	xmem[i7] = b2l; i7 += 1			# LN: 149, 149 | 
	xmem[i7] = b3g; i7 += 1			# LN: 149, 149 | 
	xmem[i7] = b3h; i7 += 1			# LN: 149, 149 | 
	xmem[i7] = b3l; i7 += 1			# LN: 149, 149 | 
	xmem[i7] = i3; i7 += 1			# LN: 149, 149 | 
	i7 = i7 + (0x201)			# LN: 149 | 
	a0 = 0			# LN: 169 | 
	do (0x2), label_end_104			# LN: 169 | 
label_begin_104:			/* LN: 169 | CYCLE: 0 | RULES: () */ 
	a1 = 0			# LN: 171 | 
	do (0x10), label_end_103			# LN: 171 | 
label_begin_103:			/* LN: 171 | CYCLE: 0 | RULES: () */ 
	b0 =+ a0			# LN: 173 | 
	b0 = b0 << 4			# LN: 173 | 
	i0 = b0; b0 = 0			# LN: 173, 173 | 
	uhalfword(b1) = (0x1)			# LN: 171 | 
	i0 = i0 + (_sampleBufferInput + 0)			# LN: 173 | 
	a2 = i0			# LN: 173 | 
	a2 = a2 + a1			# LN: 173 | 
	AnyReg(i0, a2h)			# LN: 173 | 
	a1 = a1 + b1			# LN: 171 | 
label_end_103:			# LN: 171 | CYCLE: 9 | RULES: ()
	xmem[i0] = b0h			# LN: 173 | 
init_latch_label_12:			/* LN: 175 | CYCLE: 0 | RULES: () */ 
for_end_12:			/* LN: 171 | CYCLE: 0 | RULES: () */ 
	uhalfword(a1) = (0x1)			# LN: 169 | 
label_end_104:			# LN: 169 | CYCLE: 1 | RULES: ()
	a0 = a0 + a1			# LN: 169 | 
for_end_11:			/* LN: 169 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 177 | 
	do (0x8), label_end_106			# LN: 177 | 
label_begin_106:			/* LN: 177 | CYCLE: 0 | RULES: () */ 
	a1 = 0			# LN: 179 | 
	do (0x10), label_end_105			# LN: 179 | 
label_begin_105:			/* LN: 179 | CYCLE: 0 | RULES: () */ 
	b0 =+ a0			# LN: 181 | 
	b0 = b0 << 4			# LN: 181 | 
	i0 = b0; b0 = 0			# LN: 181, 181 | 
	uhalfword(b1) = (0x1)			# LN: 179 | 
	i0 = i0 + (_sampleBufferOutput + 0)			# LN: 181 | 
	a2 = i0			# LN: 181 | 
	a2 = a2 + a1			# LN: 181 | 
	AnyReg(i0, a2h)			# LN: 181 | 
	a1 = a1 + b1			# LN: 179 | 
label_end_105:			# LN: 179 | CYCLE: 9 | RULES: ()
	ymem[i0] = b0h			# LN: 181 | 
init_latch_label_14:			/* LN: 183 | CYCLE: 0 | RULES: () */ 
for_end_14:			/* LN: 179 | CYCLE: 0 | RULES: () */ 
	uhalfword(a1) = (0x1)			# LN: 177 | 
label_end_106:			# LN: 177 | CYCLE: 1 | RULES: ()
	a0 = a0 + a1			# LN: 177 | 
for_end_13:			/* LN: 177 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (256 - 0)			# LN: 186 | 
	i1 = (0) + (_string_const_0)			# LN: 186 | 
	call (_strcpy)			# LN: 186 | 
	i0 = i7 - (256 - 0)			# LN: 187 | 
	call (_cl_wavread_open)			# LN: 187 | 
	AnyReg(i2, a0h)			# LN: 187 | 
	a0 = i2			# LN: 188 | 
	a0 & a0			# LN: 188 | 
	if (a != 0) jmp (else_2)			# LN: 188 | 
	i0 = (0) + (_string_const_1)			# LN: 190 | 
	call (_printf)			# LN: 190 | 
	halfword(a0) = (0xffff)			# LN: 191 | 
	jmp (__epilogue_240)			# LN: 191 | 
endif_2:			/* LN: 188 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 188 | CYCLE: 0 | RULES: () */ 
	i0 = i2			# LN: 195 | 
	call (_cl_wavread_getnchannels)			# LN: 195 | 
	i0 = i2			# LN: 196 | 
	i1 = i7 - (0x201)			# LN: 195 | 
	xmem[i1] = a0h			# LN: 195 | 
	call (_cl_wavread_bits_per_sample)			# LN: 196 | 
	i0 = i2			# LN: 197 | 
	a2 =+ a0			# LN: 196 | 
	call (_cl_wavread_frame_rate)			# LN: 197 | 
	i0 = i2			# LN: 198 | 
	a3 =+ a0			# LN: 197 | 
	call (_cl_wavread_number_of_frames)			# LN: 198 | 
	b2 =+ a0			# LN: 198 | 
	call (_cl_get_cycle_count)			# LN: 201 | 
	call (_mixerNxM_init)			# LN: 202 | 
	call (_cl_get_cycle_count)			# LN: 203 | 
	i0 = i7 - (512 - 0)			# LN: 210 | 
	i1 = (0) + (_string_const_2)			# LN: 210 | 
	b3 = xmem[_mixerData + 2]			# LN: 207 | 
	call (_strcpy)			# LN: 210 | 
	a0 =+ a2			# LN: 211 | 
	a1 =+ b3			# LN: 211 | 
	b0 =+ a3			# LN: 211 | 
	i0 = i7 - (512 - 0)			# LN: 211 | 
	call (_cl_wavwrite_open)			# LN: 211 | 
	AnyReg(i3, a0h)			# LN: 211 | 
	a0 = i3			# LN: 212 | 
	a0 & a0			# LN: 212 | 
	if (a != 0) jmp (else_3)			# LN: 212 | 
	i0 = (0) + (_string_const_3)			# LN: 214 | 
	call (_printf)			# LN: 214 | 
	halfword(a0) = (0xffff)			# LN: 215 | 
	jmp (__epilogue_240)			# LN: 215 | 
endif_3:			/* LN: 212 | CYCLE: 0 | RULES: () */ 
else_3:			/* LN: 212 | CYCLE: 0 | RULES: () */ 
	uhalfword(a1) = (0x10)			# LN: 224 | 
	a0 =+ b2			# LN: 224 | 
	call (__div)			# LN: 224 | 
	AnyReg(i0, a0h)			# LN: 226 | 
	nop #empty cycle
	do (i0), label_end_111			# LN: 226 | 
label_begin_111:			/* LN: 226 | CYCLE: 0 | RULES: () */ 
	a2 = 0			# LN: 228 | 
	do (0x10), label_end_108			# LN: 228 | 
label_begin_108:			/* LN: 228 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x201)			# LN: 230 | 
	a0 = xmem[i0]; a3 = 0			# LN: 230, 230 | 
	AnyReg(i0, a0h)			# LN: 230 | 
	nop #empty cycle
	do (i0), label_end_107			# LN: 230 | 
label_begin_107:			/* LN: 230 | CYCLE: 0 | RULES: () */ 
	i0 = i2			# LN: 232 | 
	call (_cl_wavread_recvsample)			# LN: 232 | 
	a1 =+ a3			# LN: 233 | 
	a1 = a1 << 4			# LN: 233 | 
	i0 = a1			# LN: 233 | 
	nop #empty cycle
	i0 = i0 + (_sampleBufferInput + 0)			# LN: 233 | 
	a1 = i0			# LN: 233 | 
	a1 = a1 + a2			# LN: 233 | 
	AnyReg(i0, a1h)			# LN: 233 | 
	uhalfword(a1) = (0x1)			# LN: 230 | 
	xmem[i0] = a0h			# LN: 233 | 
label_end_107:			# LN: 230 | CYCLE: 12 | RULES: ()
	a3 = a3 + a1			# LN: 230 | 
init_latch_label_16:			/* LN: 235 | CYCLE: 0 | RULES: () */ 
for_end_17:			/* LN: 230 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x1)			# LN: 228 | 
label_end_108:			# LN: 228 | CYCLE: 1 | RULES: ()
	a2 = a2 + a0			# LN: 228 | 
for_end_16:			/* LN: 228 | CYCLE: 0 | RULES: () */ 
	call (_cl_get_cycle_count)			# LN: 238 | 
	i0 = (0) + (_matricaUlaza)			# LN: 239 | 
	i1 = (0) + (_matricaIzlaza)			# LN: 239 | 
	call (_mixerNxM_processing)			# LN: 239 | 
	call (_cl_get_cycle_count)			# LN: 240 | 
	a2 = 0			# LN: 243 | 
	do (0x10), label_end_110			# LN: 243 | 
label_begin_110:			/* LN: 243 | CYCLE: 0 | RULES: () */ 
	AnyReg(i0, b3h)			# LN: 245 | 
	a3 = 0			# LN: 245 | 
	do (i0), label_end_109			# LN: 245 | 
label_begin_109:			/* LN: 245 | CYCLE: 0 | RULES: () */ 
	a0 =+ a3			# LN: 247 | 
	a0 = a0 << 4			# LN: 247 | 
	i1 = a0			# LN: 247 | 
	i0 = i3			# LN: 248 | 
	i1 = i1 + (_sampleBufferOutput + 0)			# LN: 247 | 
	a0 = i1			# LN: 247 | 
	a0 = a0 + a2			# LN: 247 | 
	AnyReg(i1, a0h)			# LN: 247 | 
	uhalfword(a0) = (0x1)			# LN: 245 | 
	a1 = ymem[i1]; a3 = a3 + a0			# LN: 247, 245 | 
	a0 =+ a1			# LN: 247 | 
label_end_109:			# LN: 245 | CYCLE: 11 | RULES: ()
	call (_cl_wavwrite_sendsample)			# LN: 248 | 
init_latch_label_18:			/* LN: 250 | CYCLE: 0 | RULES: () */ 
for_end_19:			/* LN: 245 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x1)			# LN: 243 | 
label_end_110:			# LN: 243 | CYCLE: 1 | RULES: ()
	a2 = a2 + a0			# LN: 243 | 
init_latch_label_19:			/* LN: 251 | CYCLE: 0 | RULES: () */ 
for_end_18:			/* LN: 243 | CYCLE: 0 | RULES: () */ 
label_end_111:			# LN: 226 | CYCLE: 0 | RULES: ()
	nop #empty cycle
for_end_15:			/* LN: 226 | CYCLE: 0 | RULES: () */ 
	i0 = i2			# LN: 255 | 
	call (_cl_wavread_close)			# LN: 255 | 
	i0 = i3			# LN: 256 | 
	call (_cl_wavwrite_close)			# LN: 256 | 
	a0 = 0			# LN: 258 | 
__epilogue_240:			/* LN: 259 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x201)			# LN: 259 | 
	i7 -= 1			# LN: 259 | 
	i3 = xmem[i7]; i7 -= 1			# LN: 259, 259 | 
	b3l = xmem[i7]; i7 -= 1			# LN: 259, 259 | 
	b3h = xmem[i7]; i7 -= 1			# LN: 259, 259 | 
	b3g = xmem[i7]; i7 -= 1			# LN: 259, 259 | 
	b2l = xmem[i7]; i7 -= 1			# LN: 259, 259 | 
	b2h = xmem[i7]; i7 -= 1			# LN: 259, 259 | 
	b2g = xmem[i7]; i7 -= 1			# LN: 259, 259 | 
	a3l = xmem[i7]; i7 -= 1			# LN: 259, 259 | 
	a3h = xmem[i7]; i7 -= 1			# LN: 259, 259 | 
	a3g = xmem[i7]; i7 -= 1			# LN: 259, 259 | 
	i2 = xmem[i7]; i7 -= 1			# LN: 259, 259 | 
	a2l = xmem[i7]; i7 -= 1			# LN: 259, 259 | 
	a2h = xmem[i7]; i7 -= 1			# LN: 259, 259 | 
	a2g = xmem[i7]			# LN: 259 | 
	ret			# LN: 259 | 



_mixerNxM_init:			/* LN: 39 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x1)			# LN: 46 | 
	xmem[_mixerData + 0] = a0h			# LN: 46 | 
	uhalfword(a0) = (0x2)			# LN: 48 | 
	xmem[_mixerData + 1] = a0h			# LN: 48 | 
	a0 = xmem[_mixerData + 0]			# LN: 49 | 
	a0 & a0			# LN: 49 | 
	if (a != 0) jmp (elsecondition_0)			# LN: 49 | 
	uhalfword(a0) = (0x2)			# LN: 49 | 
	jmp (endcondition_0)			# LN: 49 | 
elsecondition_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_numberOfOutputChannels + 1]			# LN: 49 | 
endcondition_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	xmem[_mixerData + 2] = a0h			# LN: 49 | 
	a0 = xmem[__extractedConst_0_2 + 0]			# LN: 50 | 
	xmem[_mixerData + 3] = a0h			# LN: 50 | 
	i0 = (0) + (_mixerData + 4)			# LN: 52 | 
	do (0x2), label_end_100			# LN: 54 | 
label_begin_100:			/* LN: 54 | CYCLE: 0 | RULES: () */ 
	do (0x8), label_end_99			# LN: 56 | 
label_begin_99:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_0_2 + 0]			# LN: 58 | 
label_end_99:			# LN: 56 | CYCLE: 1 | RULES: ()
	xmem[i0] = a0h; i0 += 1			# LN: 58, 58 | 
init_latch_label_1:			/* LN: 60 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
label_end_100:			# LN: 54 | CYCLE: 0 | RULES: ()
	nop #empty cycle
for_end_0:			/* LN: 54 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 63 | 
	i0 = (0) + (_matricaUlaza + 0)			# LN: 63 | 
	do (0x2), label_end_101			# LN: 63 | 
label_begin_101:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
	a1 =+ a0			# LN: 65 | 
	a1 = a1 << 4			# LN: 65 | 
	i1 = a1			# LN: 65 | 
	uhalfword(a1) = (0x1)			# LN: 63 | 
	i1 = i1 + (_sampleBufferInput + 0)			# LN: 65 | 
	xmem[i0] = i1; i0 += 1			# LN: 65, 63 | 
label_end_101:			# LN: 63 | CYCLE: 6 | RULES: ()
	a0 = a0 + a1			# LN: 63 | 
for_end_2:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 68 | 
	i0 = (0) + (_matricaIzlaza + 0)			# LN: 68 | 
	do (0x8), label_end_102			# LN: 68 | 
label_begin_102:			/* LN: 68 | CYCLE: 0 | RULES: () */ 
	a1 =+ a0			# LN: 70 | 
	a1 = a1 << 4			# LN: 70 | 
	i1 = a1			# LN: 70 | 
	uhalfword(a1) = (0x1)			# LN: 68 | 
	i1 = i1 + (_sampleBufferOutput + 0)			# LN: 70 | 
	xmem[i0] = i1; i0 += 1			# LN: 70, 68 | 
label_end_102:			# LN: 68 | CYCLE: 6 | RULES: ()
	a0 = a0 + a1			# LN: 68 | 
for_end_3:			/* LN: 68 | CYCLE: 0 | RULES: () */ 
	ret			# LN: 72 | 



_mixerNxM_processing:			/* LN: 74 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i2			# LN: 74 | 
	a0 = xmem[_mixerData + 0]			# LN: 86 | 
	a0 & a0			# LN: 86 | 
	if (a != 0) jmp (else_0)			# LN: 86 | 
	i1 = xmem[i1]			# LN: 88 | 
	i0 = xmem[i0]			# LN: 89 | 
	a0 = xmem[_mixerData + 2]			# LN: 91 | 
	AnyReg(i4, a0h)			# LN: 91 | 
	a0 = 0			# LN: 91 | 
	do (i4), label_end_93			# LN: 91 | 
label_begin_93:			/* LN: 91 | CYCLE: 0 | RULES: () */ 
	do (0x10), label_end_92			# LN: 93 | 
label_begin_92:			/* LN: 93 | CYCLE: 0 | RULES: () */ 
	a1 = xmem[_mixerData + 1]			# LN: 96 | 
	a1 = a0 - a1			# LN: 96 | 
	if (a < 0) jmp (else_1)			# LN: 96 | 
	a1 = 0			# LN: 98 | 
	ymem[i1] = a1h; i1 += 1			# LN: 98, 98 | 
	jmp (endif_1)			# LN: 98 | 
else_1:			/* LN: 96 | CYCLE: 0 | RULES: () */ 
	a1 = xmem[i0]; i0 += 1			# LN: 102, 102 | 
	ymem[i1] = a1h; i1 += 1			# LN: 102, 102 | 
init_latch_label_4:			/* LN: 104 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 96 | CYCLE: 0 | RULES: () */ 
label_end_92:			# LN: 93 | CYCLE: 0 | RULES: ()
	nop #empty cycle
for_end_5:			/* LN: 93 | CYCLE: 0 | RULES: () */ 
	i1 += 1			# LN: 106 | 
	uhalfword(a1) = (0x1)			# LN: 91 | 
label_end_93:			# LN: 91 | CYCLE: 2 | RULES: ()
	i0 += 1; a0 = a0 + a1			# LN: 107, 91 | 
for_end_4:			/* LN: 91 | CYCLE: 0 | RULES: () */ 
	jmp (endif_0)			# LN: 91 | 
else_0:			/* LN: 86 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_mixerData + 2]			# LN: 113 | 
	AnyReg(i4, a0h)			# LN: 113 | 
	a0 = 0			# LN: 113 | 
	do (i4), label_end_98			# LN: 113 | 
label_begin_98:			/* LN: 113 | CYCLE: 0 | RULES: () */ 
	a1 = i1			# LN: 115 | 
	a1 = a1 + a0			# LN: 115 | 
	AnyReg(i4, a1h)			# LN: 115 | 
	nop #empty cycle
	i4 = xmem[i4]			# LN: 115 | 
	do (0x10), label_end_94			# LN: 117 | 
label_begin_94:			/* LN: 117 | CYCLE: 0 | RULES: () */ 
	a1 = 0			# LN: 119 | 
label_end_94:			# LN: 117 | CYCLE: 1 | RULES: ()
	ymem[i4] = a1h; i4 += 1			# LN: 119, 119 | 
for_end_7:			/* LN: 117 | CYCLE: 0 | RULES: () */ 
	a1 = xmem[_mixerData + 1]			# LN: 122 | 
	AnyReg(i4, a1h)			# LN: 122 | 
	a1 = 0			# LN: 122 | 
	do (i4), label_end_96			# LN: 122 | 
label_begin_96:			/* LN: 122 | CYCLE: 0 | RULES: () */ 
	b0 = i1			# LN: 124 | 
	b1 = i0; b0 = b0 + a0			# LN: 125, 124 | 
	AnyReg(i4, b0h)			# LN: 124 | 
	b0 = b1 + a1			# LN: 125 | 
	AnyReg(i5, b0h)			# LN: 125 | 
	i4 = xmem[i4]			# LN: 124 | 
	i5 = xmem[i5]			# LN: 125 | 
	do (0x10), label_end_95			# LN: 127 | 
label_begin_95:			/* LN: 127 | CYCLE: 0 | RULES: () */ 
	x0 = xmem[_mixerData + 1]			# LN: 130 | 
	x1 = a1h			# LN: 130 | 
	b1 = ymem[i4]; b0 = x1 * x0			# LN: 132, 130 | 
	x0 = xmem[i5]; i5 += 1; b0 = b0 >> 1			# LN: 132, 135, 130 | 
	AnyReg(b0h, b0l)			# LN: 130 | 
	b0l = (0x0)			# LN: 130 | 
	b0 = b0 + a0			# LN: 130 | 
	i2 = b0; b0 =+ b1			# LN: 131, 132 | 
	nop #empty cycle
	i2 = i2 + (_mixerData + 4)			# LN: 131 | 
	x1 = xmem[i2]			# LN: 132 | 
	b0 += x1 * x0			# LN: 132 | 
label_end_95:			# LN: 127 | CYCLE: 12 | RULES: ()
	ymem[i4] = b0; i4 += 1			# LN: 132, 134 | 
init_latch_label_8:			/* LN: 137 | CYCLE: 0 | RULES: () */ 
for_end_9:			/* LN: 127 | CYCLE: 0 | RULES: () */ 
	uhalfword(b0) = (0x1)			# LN: 122 | 
label_end_96:			# LN: 122 | CYCLE: 1 | RULES: ()
	a1 = a1 + b0			# LN: 122 | 
for_end_8:			/* LN: 122 | CYCLE: 0 | RULES: () */ 
	a1 = i1			# LN: 139 | 
	a1 = a1 + a0			# LN: 139 | 
	AnyReg(i4, a1h)			# LN: 139 | 
	nop #empty cycle
	i4 = xmem[i4]			# LN: 139 | 
	do (0x10), label_end_97			# LN: 140 | 
label_begin_97:			/* LN: 140 | CYCLE: 0 | RULES: () */ 
	x0 = ymem[i4]			# LN: 142 | 
	x1 = xmem[_mixerData + 3]			# LN: 142 | 
	a1 = x0 * x1			# LN: 142 | 
label_end_97:			# LN: 140 | CYCLE: 3 | RULES: ()
	ymem[i4] = a1; i4 += 1			# LN: 142, 143 | 
init_latch_label_10:			/* LN: 145 | CYCLE: 0 | RULES: () */ 
for_end_10:			/* LN: 140 | CYCLE: 0 | RULES: () */ 
	uhalfword(a1) = (0x1)			# LN: 113 | 
label_end_98:			# LN: 113 | CYCLE: 1 | RULES: ()
	a0 = a0 + a1			# LN: 113 | 
endif_0:			/* LN: 86 | CYCLE: 0 | RULES: () */ 
for_end_6:			/* LN: 113 | CYCLE: 0 | RULES: () */ 
	i2 = xmem[i7]			# LN: 147 | 
	ret			# LN: 147 | 
