```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cbz	w1, LBB0_3
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	mov	x8, x1
	sdiv	w9, w0, w1
	msub	w1, w9, w1, w0
	mov	x0, x8
	cbnz	w1, LBB0_1
; %bb.2:
	mov	x0, x8
LBB0_3:
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
