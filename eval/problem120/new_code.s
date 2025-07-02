```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func1
	.p2align	2
_func1:                                 ; @func1
	.cfi_startproc
;; %bb.0:
	stp	x20, x21, [sp, #-48]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 48
	stp	x20, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -12
	.cfi_offset w21, -20
	.cfi_offset w22, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	mov	x21, x1
	mov	x19, x0
	bl	_strlen
	mov	x20, x0
	mov	x0, x21
	bl	_strlen
	cmp	w20, #1
	b.lt	LBB0_3
; %bb.2:
	mov	w8, #0
	mov	w9, #1
	mov	x10, x19
	mov	w11, w20
	b	LBB2_5
LBB2_3:
	mov	w8, #0
	mov	w9, #1
	cmp	w0, #1
	b.ge	LBB2_7
LBB2_4:
	cbz	w8, LBB2_12
LBB2_5:
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	b	LBB2_17
LBB2_6:
Lloh2:
	adrp	x0, l_.str.1@PAGE
Lloh3:
	add	x0, x0, l_.str.1@PAGEOFF
	tst	w8, #0x1
	cset	w8, eq
	cinc	w9, w8, ne
	cmp	w9, #0
	csel	w9, wzr, w22, lt
	cmp	w8, #0
	csel	w8, wzr, w9, eq
LBB2_7:
	cmp	w0, #1
	b.lt	LBB2_11
; %bb.8:
	mov	w10, w0
	add	x11, x21, #1
	sub	x10, x10, #1
LBB2_9:                                 ; =>This Inner Loop Header: Depth=1
	ldurb	w12, [x11, #-1]
	ldrb	w13, [x11], #1
	cmp	w12, #40
	cinc	w8, w8, eq
	cmp	w12, #41
	cset	w12, eq
	sub	w8, w8, w12
	cmp	w13, #40
	cinc	w8, w8, eq
	cmp	w13, #41
	cset	w12, eq
	sub	w8, w8, w12
	orr	w12, w8, w12
	cmp	w12, #0
	csel	w9, wzr, w9, lt
	subs	x10, x10, #1
	b.ne	LBB2_9
; %bb.10:
	cbnz	w8, LBB2_13
	b	LBB2_14
LBB2_11:
	mov	w8, #1
	cbnz	w8, LBB2_6
LBB2_12:
	cbz	w9, LBB2_15
LBB2_13:
Lloh4:
	adrp	x0, l_.str.1@PAGE
Lloh5:
	add	x0, x0, l_.str.1@PAGEOFF
	tst	w8, #0x1
	cset	w8, eq
	cinc	w9, w8, ne
	cmp	w9, #0
	csel	w9, wzr, w22, lt
	cmp	w8, #0
	csel	w8, wzr, w9, eq
LBB2_14:
	cmp	w0, #1
	b.lt	LBB2_18
LBB2_5:                                 ; =>This Inner Loop Header: Depth=1
	ldrb	w9, [x21], #1
	cmp	w9, #40
	cinc	w8, w8, eq
	cmp	w9, #41
	cset	w9, eq
	sub	w8, w8, w9
	cmp	w8, #0
	csel	w8, wzr, w22, lt
	subs	x19, x19, #1
	b.ne	LBB2_5
LBB2_6:
	cmp	w0, #1
	b.lt	LBB2_19
; %bb.7:
	mov	w10, #0
	mov	w9, w0
	add	x11, x19, #1
Lloh6:
	adrp	x0, l_.str@PAGE
Lloh7:
	add	x0, x0, l_.str@PAGEOFF
LBB2_8:                                 ; =>This Inner Loop Header: Depth=1
	ldurb	w12, [x11, #-1]
	ldrb	w13, [x11], #1
	cmp	w12, #40
	cinc	w10, w10, eq
	cmp	w12, #41
	cset	w12, eq
	sub	w10, w10, w12
	cmp	w13, #40
	cinc	w10, w10, eq
	cmp	w13, #41
	cset	w12, eq
	sub	w10, w10, w12
	orr	w12, w10, w12
	cmp	w12, #0
	csel	w8, wzr, w8, lt
	subs	x9, x9, #1
	b.ne	LBB2_8
; %bb.9:
	cmp	w8, #0
	ccmp	w10, #0, #0, eq
	b.eq	LBB2_17
; %bb.10:
Lloh8:
	adrp	x0, l_.str.1@PAGE
Lloh9:
	add	x0, x0, l_.str.1@PAGEOFF
	tst	w8, #0x1
	cset	w8, eq
	cinc	w9, w8, ne
	cmp	w9, #0
	csel	w9, wzr, w22, lt
	cmp	w8, #0
	csel	w8, wzr, w9, eq
	b	LBB2_17
LBB2_11:
	cbnz	w0, LBB2_13
; %bb.12:
	cbnz	w8, LBB2_5
LBB2_13:
Lloh10:
	adrp	x0, l_.str.1@PAGE
Lloh11:
	add	x0, x0, l_.str.1@PAGEOFF
	tst	w8, #0x1
	cset	w8, eq
	cinc	w9, w8, ne
	cmp	w9, #0
	csel	w9, wzr, w22, lt
	cmp	w8, #0
	csel	w8, wzr, w9, eq
	b	LBB2_15
LBB2_14:
	cmp	w0, #1
	b.lt	LBB2_19
LBB2_15:
	mov	w10, #0
	mov	w9, w0
	add	x11, x19, #1
Lloh12:
	adrp	x0, l_.str@PAGE
Lloh13:
	add	x0, x0, l_.str@PAGEOFF
LBB2_16:                                ; =>This Inner Loop Header: Depth=1
	ldurb	w12, [x11, #-1]
	ldrb	w13, [x11], #1
	cmp	w12, #40
	cinc	w10, w10, eq
	cmp	w12, #41
	cset	w12, eq
	sub	w10, w10, w12
	cmp	w13, #40
	cinc	w10, w10, eq
	cmp	w13, #41
	cset	w12, eq
	sub	w10, w10, w12
	orr	w12, w10, w12
	cmp	w12, #0
	csel	w8, wzr, w8, lt
	subs	x9, x9, #1
	b.ne	LBB2_16
LBB2_17:
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
LBB2_18:
	mov	w8, #1
	b	LBB2_6
LBB2_19:
	mov	x0, x8
	ldp	x29, x30, [sp, #32]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #16]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp], #48             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh4, Lloh5
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh10, Lloh12
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"Yes"

l_.str.1:                               ; @.str.1
	.asciz	"No"

.subsections_via_symbols
