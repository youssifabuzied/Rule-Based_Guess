```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #128
	.cfi_def_cfa_offset 128
	stp	x29, x30, [sp, #112]            ; 16-byte Folded Spill
	add	x29, sp, #112
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, #0
Lloh0:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh1:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh2:
	ldr	x9, [x9]
	stur	x9, [x29, #-8]
	str	xzr, [sp, #96]
	movi.2d	v0, #0000000000000000
	stp	q0, q0, [sp, #64]
	stp	q0, q0, [sp, #32]
	stp	q0, q0, [sp]
	b	LBB0_2
LBB0_1:                                 ;   in Loop: Header=BB0_2 Depth=1
	add	x0, x0, #1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	ldrb	w9, [x0]
	cmp	w9, #32
	b.eq	LBB0_1
; %bb.3:                                ;   in Loop: Header=BB0_2 Depth=1
	cbz	w9, LBB0_5
; %bb.4:                                ;   in Loop: Header=BB0_2 Depth=1
	sxtb	x9, w9
	add	x10, sp, #32
	ldr	w11, [x10, x9, lsl #2]
	add	w12, w11, #1
	str	w12, [x10, x9, lsl #2]
	cmp	w11, w8
	csinc	w8, w8, w11, lt
	b	LBB0_1
LBB0_5:
	mov	x9, #0
	mov	w10, #0
	mov	x11, sp
	b	LBB0_7
LBB0_6:                                 ;   in Loop: Header=BB0_7 Depth=1
	add	x9, x9, #1
	cmp	x9, #26
	b.eq	LBB0_9
LBB0_7:                                 ; =>This Inner Loop Header: Depth=1
	lsl	x11, x9, #2
	ldr	w12, [x11, x1]
	str	w12, [x0, x11]
	cmp	w12, w8
	b.ne	LBB0_6
; %bb.8:                                ;   in Loop: Header=BB0_7 Depth=1
	strb	w9, [x3, w10, sxtw]
	add	w10, w10, #1
	b	LBB0_6
LBB0_9:
	str	w8, [x2]
	strb	wzr, [x3, w10, sxtw]
	ldur	x8, [x29, #-8]
Lloh3:
	adrp	x9, ___stack_chk_guard@GOTPAGE
Lloh4:
	ldr	x9, [x9, ___stack_chk_guard@GOTPAGEOFF]
Lloh5:
	ldr	x9, [x9]
	cmp	x9, x8
	b.ne	LBB0_11
; %bb.10:
	ldp	x29, x30, [sp, #112]            ; 16-byte Folded Reload
	add	sp, sp, #128
	ret
LBB0_11:
	bl	___stack_chk_fail
	.loh AdrpLdrGotLdr	Lloh0, Lloh1, Lloh2
	.loh AdrpLdrGotLdr	Lloh3, Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
