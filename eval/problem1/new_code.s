```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_8
; %bb.1:
	mov	x11, #0
	mov	w8, w1
	lsl	x9, x8, #2
	mov	w10, #4
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x10, x10, #4
	add	x0, x0, #4
	mov	x11, x12
	cmp	x12, x8
	b.eq	LBB0_8
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_5 Depth 2
	add	x12, x11, #1
	cmp	x12, x8
	b.hs	LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	ldr	s1, [x0]
	mov	x13, x9
	mov	x14, x0
LBB0_5:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	s2, [x14]
	fabd	s2, s1, s2
	fcmp	s2, s0
	b.mi	LBB0_7
; %bb.6:                                ;   in Loop: Header=BB0_5 Depth=2
	add	x14, x14, #4
	subs	x13, x13, #1
	b.ne	LBB0_5
	b	LBB0_2
LBB0_7:
	mov	w0, #1
	ret
LBB0_8:
	mov	w0, #10
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
