```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
;%bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -12
	.cfi_offset w21, -20
	.cfi_offset w22, -28
	mov	x19, x3
	mov	x22, x2
	mov	x21, x1
	mov	x20, x0
	sbfiz	x0, x21, #2, #32
	bl	_malloc
	str	x0, [x22]
	str	wzr, [x19]
	cmp	w21, #1
	b.lt	LBB0_18
;%bb.1:
	mov	w8, #0
	mov	w9, #0
	mov	w10, w21
	mov	w11, #52429
	movk	w11, #52428, lsl #16
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x9, x9, #1
	cmp	x9, x10
	b.eq	LBB0_9
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_5 Depth 2
	ldr	w12, [x20, x9, lsl #2]
	cmp	w12, #0
	cset	w13, ne
	b.le	LBB0_7
;%bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	cmp	w12, #0
	cset	w14, eq
	mov	x15, x12
LBB0_5:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	tst	w15, #0x1
	csinc	w14, w14, wzr, ne
	ands	w13, w14, #0x1
	cset	w13, eq
	cmp	w15, #10
	b.lo	LBB0_7
;%bb.6:                                ;   in Loop: Header=BB05 Depth=2
	umull	x15, w15, w11
	lsr	x15, x15, #35
	tbz	w13, #0, LBB0_5
LBB0_7:                                 ;   in Loop: Header=BB03 Depth=1
	cbz	w13, LBB0_2
;%bb.8:                                ;   in Loop: Header=BB03 Depth=1
	str	w12, [x0, w8, sxtw #2]
	add	w8, w8, #1
	str	w8, [x19]
	b	LBB0_2
LBB0_9:
	cmp	w8, #2
	b.lt	LBB0_18
;%bb.10:
	mov	w9, #0
	sub	w10, w8, #1
	add	x10, x0, #4
	mov	x12, x11
	b	LBB0_13
LBB0_12:                                ;   in Loop: Header=BB0_13 Depth=1
	add	w9, w9, #1
	sub	w12, w12, #1
	cmp	w9, w11
	b.ge	LBB0_18
LBB0_13:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_16 Depth 2
	mvn	w13, w9
	add	w13, w8, w13
	cmp	w13, #1
	b.lt	LBB0_12
;%bb.14:                               ;   in Loop: Header=BB0_13 Depth=1
	ldr	w13, [x0]
	mov	x14, x12
	mov	x15, x11
	mov	x16, x10
	b	LBB0_16
LBB0_15:                                ;   in Loop: Header=BB0_16 Depth=2
	add	x16, x16, #1
	add	x15, x15, #4
	subs	x14, x14, #1
	b.eq	LBB0_12
LBB0_16:                                ;   Parent Loop BB0_13 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w17, [x16, x11]
	cmp	w13, w17
	b.gt	LBB0_15
;%bb.17:                               ;   in Loop: Header=BB0_16 Depth=2
	mov	x13, x17
	b	LBB0_15
LBB0_18:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
