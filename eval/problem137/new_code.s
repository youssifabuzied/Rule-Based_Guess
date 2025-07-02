```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_4
; %bb.1:
	mov	w8, #0
	mov	w9, #0
	mov	w10, w1
LBB0_2:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w11, [x0], #4
	cmp	w11, w8
	ccmp	w8, #0, #4, lt
	csel	w12, w11, w8, ne
	cmp	w11, #0
	csel	w13, w11, w8, eq
	csel	w12, w8, w12, eq
	cmp	w11, w9
	ccmp	w9, #0, #4, gt
	csel	w11, w11, w9, le
	cmp	w11, #0
	csel	w11, w11, w9, eq
	cmp	w11, w9
	ccmp	w9, #0, #4, le
	csel	w9, w11, w9, eq
	csel	w8, w12, w8, eq
	subs	x10, x10, #1
	b.ne	LBB0_2
; %bb.3:
	stp	w9, w8, [x2]
	ret
LBB0_4:
	stp	wzr, wzr, [x2]
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
