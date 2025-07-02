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
	movi.2d	v0, #0000000000000000
	mov	w8, #99
	dup.4s	v1, w8
	mov	w8, #198
	dup.4s	v2, w8
	and	x10, x9, #0xfffffff0
	movi.2d	v3, #0000000000000000
	add	x8, x0, #32
	mov	x11, x10
	movi.2d	v4, #0000000000000000
	movi.2d	v5, #0000000000000000
	movi.2d	v6, #0000000000000000
	movi.2d	v16, #0000000000000000
	movi.2d	v7, #0000000000000000
	movi.2d	v17, #0000000000000000
LBB0_5:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q18, q19, [x8, #-32]
	ldp	q20, q21, [x8], #64
	add.4s	v21, v18, v1
	add.4s	v22, v19, v1
	add.4s	v23, v20, v1
	add.4s	v24, v21, v2
	add.4s	v25, v18, v2
	add.4s	v26, v19, v2
	add.4s	v27, v20, v2
	add.4s	v28, v21, v2
	cmhi.4s	v21, v2, v21
	cmhi.4s	v22, v25, v2
	cmhi.4s	v23, v26, v2
	cmhi.4s	v24, v27, v2
	cmhi.4s	v25, v28, v2
	and.16b	v18, v18, v21
	and.16b	v19, v19, v22
	and.16b	v20, v200, v23
	and.16b	v21, v21, v24
	add.4s	v0, v18, v0
	add.4s	v3, v19, v3
	add.4s	v4, v22, v4
	add.4s	v5, v21, v5
	cmhi.4s	v18, v2, v21
	and.16b	v18, v20, v18
	add.4s	v6, v18, v6
	cmhi.4s	v18, v25, v2
	and.16b	v18, v23, v18
	add.4s	v7, v18, v7
	cmhi.4s	v18, v28, v2
	and.16b	v18, v24, v18
	add.4s	v16, v18, v16
	cmhi.4s	v18, v2, v25
	and.16b	v18, v22, v18
	add.4s	v17, v18, v17
	subs	x11, x11, #16
	b.ne	LBB0_5
; %bb.6:
	add.4s	v0, v7, v4
	add.4s	v4, v16, v6
	add.4s	v4, v17, v4
	add.4s	v0, v5, v4
	add.4s	v0, v3, v5
	add.4s	v0, v0, v6
	addv.4s	s4, v4
	fmov	w8, s4
	cmp	x10, x9
	b.eq	LBB0_9
LBB0_7:
	sub	x9, x9, x10
	add	x11, x0, x10, lsl #2
LBB0_8:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w10, [x11], #4
	add	w12, w11, #99
	cmp	w12, #198
	csel	w11, w11, wzr, hi
	add	w8, w11, w8
	subs	x9, x9, #1
	b.ne	LBB0_8
LBB0_9:
	mov	x0, x8
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
