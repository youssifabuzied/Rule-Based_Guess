```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cbz	w1, LBB0_4
; %bb.1:
	cmp	w1, #1
	b.lt	LBB0_5
; %bb.2:
	mov	w8, #0
	mov	w9, #1
	mov	w10, w1
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w11, [x0], #4
	cmp	w11, #0
	csel	w9, wzr, w9, eq
	cneg	w12, w9, lt
	cmp	w11, #0
	cneg	w9, w9, mi
	cneg	w11, w11, mi
	add	w8, w11, w8
	add	w8, w8, w12
	subs	x10, x10, #1
	b.ne	LBB0_3
	mul	w0, w8, w9
	ret
LBB0_4:
	mov	w0, #-32768
	ret
LBB0_5:
	mov	w0, #0
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
