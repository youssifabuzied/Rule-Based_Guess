```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
                                        ; kill: def $w1 killed $w1 def $x1
	cmp	w1, #2
	b.lt	LBB0_9
; %bb.1:
	mov	w8, #0
	sub	w9, w1, #1
	add	x10, x0, #4
	mov	x10, x9
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	w8, w8, #1
	sub	w11, w10, #1
	cmp	w8, w9
	b.eq	LBB0_9
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_7 Depth 2
	mov	w10, w11
	mvn	w12, w8
	add	w12, w12, w1
	cmp	w12, #1
	b.lt	LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	ldr	w12, [x0]
	mov	x13, x10
	mov	x14, x11
	mov	x15, x11
	mov	x16, x11
	b	LBB0_7
LBB0_5:                                 ;   in Loop: Header=BB0_7 Depth=2
	stp	w17, w12, [x11, #-4]
LBB0_6:                                 ;   in Loop: Header=BB2_7 Depth=2
	add	x11, x11, #4
	subs	x14, x14, #1
	b.eq	LBB0_2
LBB2_7:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w17, [x11, #4]
	cmp	w12, w17
	b.gt	LBB0_5
; %bb.8:                                ;   in Loop: Header=BB2_7 Depth=2
	mov	x12, x17
	b	LBB2_6
LBB0_9:
	cmp	w2, #1
	b.lt	LBB0_17
; %bb.10:
	sub	w8, w1, w2
	sxtw	x9, w8
	mov	w8, w2
	cmp	w2, #16
	b.lo	LBB0_15
; %bb.12:
	add	x10, x0, x9, lsl #2
	sub	x10, x3, x11
	cmp	x10, #64
	b.hs	LBB0_18
; %bb.13:
	mov	x10, #0
LBB2_14:
	lsl	x10, x11, #2
	add	x10, x10, x10, lsl #2
	add	x10, x10, #4
	add	x9, x11, x9
	add	x9, x0, x9, lsl #2
	add	x9, x9, #4
	sub	x8, x8, x11
LBB2_5:                                 ; =>This Inner Loop Header: Depth=1
	ldur	w11, [x9, #-4]
	str	w11, [x10], #4
	add	x9, x9, #4
	subs	x8, x8, #1
	b.ne	LBB2_5
LBB2_6:
	cmp	x11, x12
	b.eq	LBB0_17
LBB0_7:
	lsl	x11, x11, #2
	add	x10, x11, x0
	add	x10, x10, #4
	add	x9, x12, x9, lsl #2
	add	x9, x9, #4
	sub	x8, x8, x11
LBB2_8:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w11, [x10], #4
	str	w11, [x9], #4
	subs	x8, x8, #1
	b.ne	LBB2_8
	b	LBB0_17
LBB0_9:
                                        ; kill: def $w1 killed $w1 killed $x1 def $x1
	cmp	w2, #1
	b.lt	LBB0_17
; %bb.10:
	sub	w8, w1, w2
	sxtw	x9, w8
	mov	w8, w2
	cmp	w2, #16
	b.lo	LBB0_14
; %bb.11:
	add	x10, x0, x9, lsl #2
	sub	x11, x3, x10
	cmp	x11, #64
	b.hs	LBB0_13
LBB0_12:
	mov	x11, #0
	b	LBB0_15
LBB0_13:
	and	x11, x8, #0xfffffff0
	add	x12, x3, #32
	add	x13, x10, #32
	mov	x14, x11
LBB0_4:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q0, q1, [x13, #-32]
	ldp	q2, q3, [x13], #64
	stp	q0, q1, [x12, #-32]
	stp	q2, q3, [x12], #64
	subs	x14, x14, #16
	b.ne	LBB0_4
; %bb.5:
	cmp	x11, x8
	b.eq	LBB0_17
; %bb.6:
	tbnz	w8, #3, LBB0_12
; %bb.7:
	lsl	x13, x11, #2
	add	x10, x13, x0
	add	x10, x10, #4
	add	x12, x3, x13
	add	x12, x12, #4
	sub	x11, x8, x11
LBB0_8:                                 ; =>This Inner Loop Header: Depth=1
	ldur	w13, [x10, #-4]
	str	w13, [x12], #4
	add	x10, x10, #4
	subs	x11, x11, #1
	b.ne	LBB0_8
; %bb.9:
	cmp	x11, x8
	b.eq	LBB0_17
; %bb.10:
	tbnz	w8, #4, LBB0_12
; %bb.11:
	lsl	x13, x11, #2
	add	x10, x13, x0
	add	x10, x10, #4
	add	x12, x3, x13
	add	x12, x12, #4
	sub	x11, x8, x11
LBB0_12:                                ; =>This Inner Loop Header: Depth=1
	ldur	w13, [x10, #-4]
	str	w13, [x12], #4
	add	x10, x10, #4
	subs	x11, x11, #1
	b.ne	LBB0_12
	b	LBB0_17
LBB0_13:
	mov	x11, #0
LBB0_14:
	lsl	x10, x11, #2
	add	x12, x10, x0
	add	x12, x12, #4
	add	x10, x3, x10
	add	x10, x10, #4
	sub	x8, x8, x11
LBB2_15:                                ; =>This Inner Loop Header: Depth=1
	ldr	w11, [x12], #4
	str	w11, [x10], #4
	subs	x8, x8, #1
	b.ne	LBB2_15
LBB0_16:
	ret
LBB0_17:
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
