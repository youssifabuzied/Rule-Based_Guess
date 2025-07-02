```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func1
	.p2align	2
_func1:                                 ; @func1
	.cfi_startproc
; %bb.0:
	cmp	w1, #2
	b.lt	LBB0_4
; %bb.1:
	mov	x8, x0
	mov	w9, w1
	ldr	w10, [x0], #4
	sub	x11, x9, #1
	mov	w0, #-1
	mov	w12, #1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w13, [x8], #4
	cmp	w13, w10
	csel	w0, w12, w0, lt
	add	x12, x12, #1
	mov	x10, x13
	cmp	x11, x12
	b.ne	LBB0_2
; %bb.3:
	ret
LBB0_4:
	mov	w0, #-1
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
