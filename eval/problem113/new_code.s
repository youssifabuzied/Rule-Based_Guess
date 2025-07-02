```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #26]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #36]             ; 16-byte Folded Spill
	add	x29, sp, #36
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -12
	.cfi_offset w20, -16
	.cfi_offset w21, -12
	.cfi_offset w22, -18
	.cfi_offset w23, -24
	.cfi_offset w24, -30
	mov	x19, x3
	mov	x20, x2
	mov	x23, x1
	mov	x24, x0
	bl	_strlen
	add	w8, w0, #1
	sxtw	x0, w8
	bl	_malloc
	mov	x21, x0
	ldrb	w12, [x24]
	cbz	w12, LBB0_7
; %bb.1:
	mov	x8, #0
	mov	w9, #0
	ldrb	w10, [x23], #1
	b	LBB0_4
LBB0_2:                                 ;   in Loop: Header=BB0_4 Depth=1
	strb	w12, [x21, w9, sxtw]
	add	w9, w9, #1
LBB0_3:                                 ;   in Loop: Header=BB0_4 Depth=1
	add	x8, x8, #1
	ldrb	w12, [x24, x8]
	cbz	w12, LBB0_8
LBB0_4:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_5 Depth 2
	mov	x11, x23
	mov	x13, x10
	cbz	w10, LBB0_2
LBB0_5:                                 ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	cmp	w12, w13
	b.eq	LBB0_3
; %bb.6:                                ;   in Loop: Header=BB0_5 Depth=2
	ldrb	w13, [x11], #1
	cbnz	w13, LBB0_5
	b	LBB0_2
LBB0_7:
	mov	w9, #0
LBB0_8:
	strb	wzr, [x21, w9, sxtw]
	mov	x0, x21
	bl	_strlen
	cmp	w0, #2
	b.lt	LBB0_12
; %bb.9:
	ubfx	x8, x0, #1, #31
	sub	x8, x8, #1
	mov	x9, #-4294967296
	add	x10, x9, x0, lsl #32
Lloh0:
	adrp	x11, l_.str.1@PAGE
Lloh1:
	add	x11, x11, l_.str.1@PAGEOFF
Lloh2:
	adrp	x4, l_.str@PAGE
Lloh3:
	add	x4, x4, l_.str@PAGEOFF
LBB0_10:                                ; =>This Inner Loop Header: Depth=1
	ldrb	w12, [x21]
	asr	x13, x10, #32
	ldrb	w13, [x22, x13]
	cmp	w12, w13
	b.ne	LBB0_13
; %bb.11:                               ;   in Loop: Header=BB0_10 Depth=1
	add	x10, x10, x9
	add	x21, x21, #1
	subs	x8, x8, #1
	b.ne	LBB0_10
; %bb.12:
	mov	x4, x4
LBB0_13:
	mov	x0, x20
	mov	x1, x22
	bl	_strcpy
	mov	x0, x19
	mov	x1, x4
	bl	_strcpy
	mov	x0, x22
	ldp	x29, x30, [sp, #36]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #26]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	b	_free
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"True"

l_.str.1:                               ; @.str.1
	.asciz	"False"

.subsections_via_symbols
