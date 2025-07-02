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
	bl	_strlen
	cbz	w0, LBB0_11
; %bb.1:
	mov	x20, x0
	lsl	x8, x0, #32
	mov	x9, #-4294967296
	add	x9, x8, x9
	asr	x9, x9, #32
	ldrsb	w0, [x19, x19]
	tbnz	w0, #31, LBB0_3
; %bb.2:
Lloh0:
	adrp	x9, __DefaultRuneLocale@GOTPAGE
Lloh1:
	ldr	x9, [x9, __DefaultRuneLocale@GOTPAGEOFF]
	add	x9, x9, x0, lsl #2
	ldr	w9, [x9, #60]
	and	w0, w9, #0x100
	cbnz	w0, LBB0_4
	b	LBB0_11
LBB0_3:
	mov	w1, #256
	bl	___maskrune
	cbz	w0, LBB0_11
LBB0_4:
	cmp	w20, #1
	b.ne	LBB0_6
; %bb.5:
	mov	w0, #1
	b	LBB0_11
LBB0_6:
	mov	x9, #-8589934592
	add	x8, x8, x9
	asr	x8, x8, #32
	ldrsb	w0, [x19, x8]
	tbnz	w0, #31, LBB0_8
; %bb.7:
Lloh2:
	adrp	x8, __DefaultRuneLocale@GOTPAGE
Lloh3:
	ldr	x8, [x8, __DefaultRuneLocale@GOTPAGEOFF]
	add	x8, x8, x0, lsl #2
	ldr	w8, [x8, #60]
	and	w0, w8, #0x100
	b	LBB0_9
LBB0_8:
	mov	w1, #256
	bl	___maskrune
LBB0_9:
	cmp	w0, #0
	cset	w0, eq
	b	LBB0_11
LBB0_10:
	mov	w0, #0
LBB0_11:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpLdrGot	Lloh0, Lloh1
	.loh AdrpLdrGot	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
