```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w0, #1
	b.lt	LBB0_4
; %bb.1:
	mov	w8, #0
	mov	w9, #1
	mov	w10, #52429
	movk	w10, #52428, lsl #16
	mov	w11, #10
	mov	w12, #1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	umull	x13, w0, w10
	lsr	x13, x13, #35
	msub	w14, w13, w11, w0
	tst	w14, #0x1
	csinc	w14, w14, wzr, ne
	csel	w8, w8, w9, eq
	mul	w12, w14, w12
	cmp	w0, #9
	mov	x0, x13
	b.hi	LBB0_2
; %bb.3:
	cmp	w8, #0
	csel	w0, wzr, w12, eq
	ret
LBB0_4:
	mov	w0, #0
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
