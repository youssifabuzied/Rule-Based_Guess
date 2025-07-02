```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w0, #1
	b.lt	LBB0_3
; %bb.1:
	add	w8, w0, #1
	sub	x10, x8, #1
	cmp	x10, #4
	b.hs	LBB0_4
; %bb.2:
	mov	w9, #1
	mov	w0, #1
	mov	w11, #1
	b	LBB0_7
LBB0_3:
	mov	w0, #1
	ret
LBB0_4:
	mov	x16, #0
	and	x11, x10, #0xfffffffffffffffc
	orr	x9, x11, #0x1
	mov	w12, #1
	mov	w13, #1
	mov	w14, #1
	mov	w15, #1
	mov	w17, #1
	mov	w1, #1
	mov	w2, #1
	mov	w3, #1
	mov	w4, #1
	mov	w5, #1
	mov	w6, #1
	mov	w7, #1
	mov	w20, #1
	mov	w21, #1
	mov	w22, #1
	mov	w23, #1
	mov	w24, #1
	mov	w25, #1
	mov	w26, #1
	mov	w27, #1
	mov	w28, #1
	mov	w29, #1
	mov	w20, #1
	mov	w21, #1
	mov	w22, #1
	mov	w23, #1
	mov	w24, #1
	mov	w25, #1
	mov	w26, #1
	mov	w27, #1
	mov	w28, #1
	mov	w29, #1
	mov	w20, #1
	mov	w21, #1
	mov	w22, #1
	mov	w23, #1
	mov	w24, #1
	mov	w25, #1
	mov	w26, #1
	mov	w27, #1
	mov	w28, #1
	mov	w29, #1
	mov	w20, #1
	mov	w21, #1
	mov	w22, #1
	mov	w23, #1
	mov	w24, #1
	mov	w25, #1
	mov	w26, #1
	mov	w27, #1
	mov	w28, #1
	mov	w29, #1
	mov	w20, #1
	mov	w21, #1
	mov	w22, #1
	mov	w23, #1
	mov	w24, #1
	mov	w25, #1
	mov	w26, #1
	mov	w27, #1
	mov	w28, #1
	mov	w29, #1
	mov	w20, #1
	mov	w21, #1
	mov	w22, #1
	mov	w23, #1
	mov	w24, #1
	mov	w25, #1
	mov	w26, #1
	mov	w27, #1
	mov	w28, #1
	mov	w29, #1
	mov	w20, #1
	mov	w21, #1
	mov	w22, #1
	mov	w23, #1
	mov	w24, #1
	mov	w25, #1
	mov	w26, #1
	mov	w27, #1
	mov	w28, #1
	madd	w28, w28, w28, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w20, w28
	mul	w20, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w22, w22, w22
	mul	w0, w22, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w0, w22
	mul	w0, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2, w2
	mul	w2, w2
