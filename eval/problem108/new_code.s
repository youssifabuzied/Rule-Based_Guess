```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x20, x19, [sp, #-32]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 32
	stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
	add	x29, sp, #16
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x19, x0
	mov	w0, #8
	bl	_malloc
	str	xzr, [x0]
	cmp	w19, #1
	b.lt	LBB0_9
; %bb.1:
	mov	w8, #0
	mov	w9, #0
	mov	w10, #1
	mov	w11, #26215
	movk	w11, #26214, lsl #16
	mov	w12, #10
	b	LBB0_4
LBB0_2:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	w9, w9, #1
	str	w9, [x0, #4]
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	w13, w10, #1
	cmp	w10, w19
	mov	x10, x13
	b.eq	LBB0_9
LBB0_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_5 Depth 2
	mov	w13, #0
	mov	x14, x10
LBB0_5:                                 ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	smull	x15, w14, w11
	lsr	x16, x15, #63
	asr	x15, x15, #34
	add	w15, w15, w16
	msub	w16, w15, w12, w14
	madd	w13, w13, w12, w16
	add	w16, w14, #9
	mov	x14, x15
	cmp	w16, #18
	b.hi	LBB0_5
; %bb.6:                                ;   in Loop: Header=BB0_4 Depth=1
	cmp	w10, w13
	b.ne	LBB0_3
; %bb.7:                                ;   in Loop: Header=BB0_4 Depth=1
	tbnz	w10, #0, LBB0_2
; %bb.8:                                ;   in Loop: Header=BB0_4 Depth=1
	add	w8, w8, #1
	str	w8, [x0]
	b	LBB0_3
LBB0_9:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
