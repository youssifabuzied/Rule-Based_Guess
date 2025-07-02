```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_17
; %bb.1:
	mov	x10, #0
	mov	w8, w1
	mov	w9, #1
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x9, x9, #1
	mov	x10, x12
	cmp	x12, x8
	b.eq	LBB0_17
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_7 Depth 2
                                        ;       Child Loop BB0_9 Depth 3
                                        ;       Child Loop BB0_12 Depth 3
	add	x12, x10, #1
	cmp	x12, x8
	b.hs	LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	x10, x9
	b	LBB0_7
LBB0_5:                                 ;   in Loop: Header=BB0_7 Depth=2
	str	w14, [x0, x13, lsl #2]
	str	w15, [x0, x10, lsl #2]
LBB0_6:                                 ;   in Loop: Header=BB0_7 Depth=2
	add	x10, x10, #1
	cmp	x10, x8
	b.eq	LBB0_2
LBB0_7:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_9 Depth 3
                                        ;       Child Loop BB0_12 Depth 3
	ldr	w15, [x0, x11, lsl #2]
	cmp	w15, #1
	b.lt	LBB0_10
; %bb.8:                                ;   in Loop: Header=BB0_7 Depth=2
	mov	w13, #0
	mov	x16, x15
LBB0_9:                                 ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	and	w14, w16, #0x1
	add	w13, w14, w13
	lsr	w14, w16, #1
	cmp	w6, #2
	mov	x6, x14
	b.hs	LBB0_9
	b	LBB0_111
LBB0_10:                                ;   in Loop: Header=BB0_7 Depth=2
	mov	w13, #0
LBB0_11:                                ;   in Loop: Header=BB0_7 Depth=2
	ldr	w14, [x0, x10, lsl #2]
	cmp	w14, #1
	b.lt	LBB0_14
; %bb.12:                               ;   in Loop: Header=BB0_7 Depth=2
	mov	w16, #0
	mov	x17, x14
LBB0_13:                                ;   Parent Loop BB0_3 Depth=1
                                        ;     Parent Loop BB0_7 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	and	w1, w17, #0x1
	add	w16, w1, w16
	lsr	w1, w17, #1
	cmp	w17, #1
	mov	x17, x1
	b.hi	LBB0_13
	b	LBB0_15
LBB0_13:                                ;   in Loop: Header=BB0_7 Depth=2
	mov	w16, #0
LBB0_14:                                ;   in Loop: Header=BB0_7 Depth=2
	cmp	w16, w13
	b.lo	LBB0_5
LBB0_15:                                ;   in Loop: Header=BB0_7 Depth=2
	b.ne	LBB0_6
; %bb.16:                               ;   in Loop: Header=BB0_7 Depth=2
	cmp	w14, w15
	b.lt	LBB0_5
	b	LBB0_6
LBB0_17:
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
