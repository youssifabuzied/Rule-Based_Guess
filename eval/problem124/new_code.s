```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x22, x21, [sp, #-48]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	stp	x20, x19, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -12
	.cfi_offset w20, -18
	.cfi_offset w21, -24
	.cfi_offset w22, -32
	mov	x19, x2
	mov	w8, #1
	str	w8, [x2]
	str	w8, [x1]
	cmp	w0, #1
	b.ne	LBB0_9
LBB0_1:
	ldr	w8, [x19]
	cmp	w8, #2
	b.lt	LBB0_8
; ; kill: def $w0 killed $w0 killed $x0 def $x0
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	sbfiz	x10, x10, #2, #32
	str	w8, [x0, x10]
	add	x0, x0, #4
	add	x8, x8, #1
	ldrsw	x9, [x19]
	cmp	x8, x9
	b.ge	LBB0_8
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_4 Depth 2
	ldr	w9, [x0, x8, lsl #2]
	mov	x10, x8
LBB0_4:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sub	x11, x10, #1
	ldr	w12, [x0, w11, uxtw #2]
	cmp	w12, w9
	b.le	LBB0_2
; ; kill: def $w11 killed $w11 killed $x11 def $x11
	str	w12, [x0, x10, lsl #2]
	add	x12, x11, #1
	mov	x10, x11
	cmp	x12, #1
	b.gt	LBB0_4
; ; kill: def $w10 killed $w10 killed $x10 def $x10
	b	LBB0_2
LBB0_5:                                 ;   in Loop: Header=BB0_9 Depth=1
	cmp	w0, #0
	cinc	w8, w0, lt
	asr	w0, w8, #1
LBB0_6:                                 ;   in Loop: Header=BB0_9 Depth=1
	cmp	w0, #1
	b.eq	LBB0_1
LBB0_7:                                 ;   in Loop: Header=BB0_9 Depth=1
	add	w0, w0, #1
	b	LBB0_9
LBB0_8:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB0_9:
	mov	w20, #10
	b	LBB0_12
LBB0_10:                                ;   in Loop: Header=BB0_12 Depth=1
	lsl	w8, w20, #1
	sbfiz	x1, x8, #2, #32
	bl	_realloc
	ldr	w8, [x19]
LBB0_11:                                ;   in Loop: Header=BB0_12 Depth=1
	add	w9, w8, #1
	str	w9, [x19]
	str	w0, [x0, w8, sxtw #2]
	add	w8, w0, w0, lsl #1
	add	w0, w8, #1
	cmp	w0, #1
	b.eq	LBB0_1
	b	LBB0_7
LBB0_12:                                ; =>This Inner Loop Header: Depth=1
	and	w8, w0, #0x80000001
	cmp	w8, #1
	b.ne	LBB0_5
; ; kill: def $w0 killed $w0 killed $x0 def $x0
	ldr	w8, [x19]
	cmp	w8, w20
	b.ge	LBB0_10
; ; kill: def $w0 killed $w0 killed $x0 def $x0
	b	LBB0_11
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
