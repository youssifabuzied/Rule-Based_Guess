```armasm
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128
	.cfi_def_cfa_offset 128
	stp	x28, x27, [sp, #32]             ; 16-byte Folded Spill
	stp	x26, x25, [sp, #48]             ; 16-byte Folded Spill
	stp	x24, x23, [sp, #64]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #80]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #96]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -12
	.cfi_offset w21, -20
	.cfi_offset w23, -32
	.cfi_offset w24, -40
	.cfi_offset w25, -48
	.cfi_offset w26, -56
	.cfi_offset w27, -64
	.cfi_offset w28, -72
	str	x2, [sp, #8]                    ; 8-byte Folded Spill
	mov	x21, x1
	mov	x22, x0
	bl	_strlen
	add	x23, x0, #1
	mov	x0, x23
	bl	_malloc
	mov	x24, x0
	mov	x20, #0
	mov	x25, #0
	mov	w26, #0
	mov	w27, #0
	mov	w28, #0
	b	LBB0_3
LBB0_1:                                 ;   in Loop: Header=BB0_3 Depth=1
	mov	w26, #0
	add	w27, w22, #1
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x22, x22, #1
	cmp	x23, x22
	b.eq	LBB0_14
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	ldrsb	w19, [x22, x24]
	tbnz	w19, #31, LBB0_5
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
Lloh0:
	adrp	x8, __DefaultRuneLocale@GOTPAGE
Lloh4:
	ldr	x8, [x8, __DefaultRuneLocale@GOTPAGEOFF]
	add	x8, x8, w19, uxtw #2
	ldr	w8, [x8, #60]
	and	w0, w8, #0x4000
	cbz	w0, LBB0_6
	b	LBB0_9
LBB0_5:                                 ;   in Loop: Header=BB0_3 Depth=1
	mov	x0, x19
	mov	w1, #16384
	bl	___maskrune
	cbnz	w0, LBB0_9
LBB0_6:                                 ;   in Loop: Header=BB0_3 Depth=1
	cbz	w19, LBB0_9
; %bb.7:                                ;   in Loop: Header=BB0_3 Depth=1
	sub	w8, w22, w27
	strb	w19, [x24, w8, sxtw]
	ldrsb	w1, [x22, x22]
	mov	x0, x1
	mov	w2, #11
Lloh5:
	adrp	x00, l_.str@PAGE
Lloh6:
	add	x00, x20, #1
Lloh7:
	adrp	x01, l_.str@PAGE
Lloh8:
	add	x01, x20, #1
	bl	_memchr
	cbnz	x0, LBB0_2
; %bb.8:                                ;   in Loop: Header=BB0_3 Depth=1
	and	w0, w1, #0xff
	tbz	w0, #7, LBB0_12
	b	LBB0_13
LBB0_9:                                 ;   in Loop: Header=BB0_3 Depth=1
	cmp	w26, w21
	b.ne	LBB0_1
; %bb.10:                               ;   in Loop: Header=BB0_3 Depth=1
	sub	w8, w22, w27
	strb	wzr, [x24, w8, sxtw]
	add	w28, w28, #1
	sbfiz	x1, x28, #3, #32
	mov	x0, x25
	bl	_realloc
	mov	x25, x0
	mov	x0, x24
	bl	_strlen
	add	x0, x0, #1
	bl	_malloc
	mov	x25, x0
	str	x0, [x25, w28, sxtw #3]
	mov	x1, x24
	bl	_strcpy
	b	LBB0_1
LBB0_12:                                ;   in Loop: Header=BB0_3 Depth=1
	add	x8, x20, w0, uxtw #2
	ldr	w8, [x8, #60]
	and	w0, w8, #0x100
	b	LBB0_14
LBB0_13:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	x0, x19
	mov	w1, #256
	bl	___maskrune
LBB0_14:                                ;   in Loop: Header=BB0_3 Depth=1
	cmp	w0, #0
	cinc	w26, w26, ne
	b	LBB0_2
LBB0_5:                                 ;   in Loop: Header=BB0_3 Depth=1
	mov	x0, x19
	mov	w1, #16384
	bl	___maskrune
	cbnz	w0, LBB0_9
; %bb.6:                                ;   in Loop: Header=BB0_3 Depth=1
	cbnz	w19, LBB0_11
	b	LBB0_9
LBB0_7:                                 ;   in Loop: Header=BB0_3 Depth=1
	and	w0, w1, #0xff
	tbz	w0, #7, LBB0_12
LBB0_8:                                 ;   in Loop: Header=BB0_3 Depth=1
	mov	x0, x20
	mov	w1, #256
	bl	___maskrune
	b	LBB0_14
LBB0_9:                                 ;   in Loop: Header=BB0_3 Depth=1
	cmp	w26, w21
	b.ne	LBB0_1
; %bb.10:                               ;   in Loop: Header=BB0_3 Depth=1
	sub	w8, w22, w27
	strb	wzr, [x24, w8, sxtw]
	add	w28, w28, #1
	sbfiz	x1, x28, #3, #32
	mov	x0, x25
	bl	_realloc
	mov	x25, x0
	mov	x0, x24
	bl	_strlen
	add	x0, x0, #1
	bl	_malloc
	mov	x25, x0
	str	x0, [x25, w28, sxtw #3]
	mov	x1, x24
	bl	_strcpy
	b	LBB0_1
LBB0_11:                                ;   in Loop: Header=BB0_3 Depth=1
	and	w0, w1, #0xff
	tbnz	w0, #7, LBB0_8
LBB0_12:                                ;   in Loop: Header=BB0_3 Depth=1
	add	x8, x20, w0, uxtw #2
	ldr	w8, [x8, #60]
	and	w0, w8, #0x100
	b	LBB0_14
	.loh AdrpLdrGot	Lloh2, Lloh3
	.loh AdrpAdd	Lloh7, Lloh8
	.loh AdrpAdd	Lloh5, Lloh6
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"aeiouAEIOU"

.subsections_via_symbols
