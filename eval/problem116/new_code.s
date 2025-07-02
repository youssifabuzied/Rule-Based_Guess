```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_12
; %bb.1:
	mov	x8, x0
	mov	x9, #0
	mov	w0, #0
	sub	w10, w3, #1
	mov	w11, w2
	and	x12, x11, #0xfffffff0
	add	x13, x8, #32
	movi.2d	v0, #0000000000000000
	mov	x14, x12
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x9, x9, #1
	cmp	x9, x11
	b.eq	LBB0_11
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_7 Depth 2
                                        ;     Child Loop BB0_10 Depth 2
	cmp	w2, #1
	b.lt	LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	ldr	x15, [x8, x9, lsl #3]
	cmp	w2, #16
	b.hs	LBB0_6
; %bb.5:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	x17, #0
	mov	w16, #0
	b	LBB0_9
LBB0_6:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x16, x15, #32
	movi.2d	v0, #0000000000000000
	mov	x17, x12
	movi.2d	v1, #0000000000000000
	movi.2d	v2, #0000000000000000
	movi.2d	v3, #0000000000000000
LBB0_7:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldp	q4, q5, [x16, #-32]
	ldp	q6, q7, [x16], #64
	add.4s	v0, v4, v0
	add.4s	v1, v5, v1
	add.4s	v2, v6, v2
	add.4s	v3, v7, v3
	subs	x17, x17, #16
	b.ne	LBB0_7
; %bb.8:                                ;   in Loop: Header=BB0_3 Depth=1
	add.4s	v0, v1, v4
	add.4s	v4, v2, v5
	add.4s	v1, v3, v6
	add.4s	v1, v1, v4
	add.4s	v0, v0, v2
	add.4s	v0, v1, v3
	addv.4s	s1, v0
	fmov	w16, s1
	mov	x17, x12
	cmp	x12, x11
	b.eq	LBB0_10
LBB0_9:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x15, x15, x17, lsl #2
	sub	x17, x11, x17
LBB0_10:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w1, [x15], #4
	add	w16, w1, w16
	subs	x17, x17, #1
	b.ne	LBB0_11
LBB0_12:                                ;   in Loop: Header=BB0_3 Depth=1
	cmp	w16, #1
	b.lt	LBB0_2
; %bb.13:                               ;   in Loop: Header=BB0_3 Depth=1
	add	w16, w10, w16
	sdiv	w16, w16, w3
	add	w0, w16, w0
	b	LBB0_2
LBB0_14:                                ;   in Loop: Header=BB0_11 Depth=1
	add	w16, w10, w16
	sdiv	w16, w16, w3
	add	w0, w16, w0
LBB0_15:                                ;   in Loop: Header=BB0_3 Depth=1
	add	x9, x9, #1
	cmp	x9, x11
	b.eq	LBB0_11
LBB0_16:                                ;   in Loop: Header=BB0_3 Depth=1
	cmp	w16, #1
	b.lt	LBB0_2
; %bb.17:                               ;   in Loop: Header=BB0_3 Depth=1
	add	w16, w10, w16
	sdiv	w16, w16, w3
	add	w0, w16, w0
	b	LBB0_2
LBB0_18:                                ;   in Loop: Header=BB0_3 Depth=1
	add	w16, w10, w16
	sdiv	w16, w16, w3
	add	w0, w16, w0
	b	LBB0_2
LBB0_19:                                ;   in Loop: Header=BB0_3 Depth=1
	add	w16, w10, w16
	sdiv	w16, w16, w3
	add	w0, w16, w0
	b	LBB0_2
LBB0_20:                                ;   in Loop: Header=BB0_3 Depth=1
	add	w16, w10, w16
	sdiv	w16, w16, w3
	add	w0, w16, w0
	b	LBB0_2
LBB0_21:                                ;   in Loop: Header=BB0_3 Depth=1
	add	w16, w10, w16
	sdiv	w16, w16, w3
	add	w0, w16, w0
	b	LBB0_2
LBB0_22:
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
