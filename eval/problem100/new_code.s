```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x29, x30, [sp, #-16]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 16
	mov	x29, sp
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	bl	_atof
	fmov	d1, #-0.50000000
	fadd	d1, d0, d1
	frintp	d1, d1
	fmov	d2, #0.50000000
	fadd	d2, d0, d2
	fcvtms	w8, d0
	fcmp	d0, #0.0
	fcsel	d0, d1, d2, mi
	fcvtzs	w0, d0
	ldp	x29, x30, [sp], #16             ; 16-byte Folded Reload
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
