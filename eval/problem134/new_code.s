```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_3
; %bb.1:
	mov	w9, w1
	cmp	w1, #16
	b.hs	LBB0_4
; %bb.2:
	mov	x10, #0
	mov	w8, #0
	b	LBB0_7
LBB0_3:
	mov	w0, #0
	ret
LBB0_4:
	and	x10, x9, #0xfffffff0
	add	x8, x0, #32
	movi.2d	v0, #0000000000000000
	mov	x11, x10
	movi.2d	v1, #0000000000000000
	movi.2d	v2, #0000000000000000
	movi.2d	v3, #0000000000000000
LBB0_5:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q4, q5, [x8, #-32]
	ldp	q6, q7, [x8], #64
	frintz.4s	v4, v4
	frintz.4s	v5, v5
	frintz.4s	v6, v6
	frintz.4s	v7, v7
	fcvtzs.4s	v4, v4
	fcvtzs.4s	v5, v5
	fcvtzs.4s	v6, v6
	fcvtzs.4s	v7, v7
	fmul.4s	v4, v4, v4
	fmul.4s	v5, v5, v5
	fmul.4s	v6, v6, v6
	fmul.4s	v7, v7, v7
	add.4s	v0, v4, v0
	add.4s	v1, v5, v1
	add.4s	v2, v6, v2
	add.4s	v3, v7, v3
	subs	x11, x11, #16
	b.ne	LBB0_5
; %bb.6:
	add.4s	v0, v1, v0
	add.4s	v0, v2, v0
	add.4s	v0, v3, v0
	addv.4s	s0, v0
	fmov	w8, s0
	cmp	x10, x9
	b.eq	LBB0_9
LBB0_7:
	add	x11, x0, x10, lsl #2
	sub	x9, x9, x10
LBB0_8:                                 ; =>This Inner Loop Header: Depth=1
	ldr	s0, [x11], #4
	frintz	s0, s0
	fcvtzs	w10, s0
	madd	w8, w10, w10, w8
	subs	x9, x9, #1
	b.ne	LBB0_8
LBB0_9:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
