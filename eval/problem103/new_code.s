```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
;; %bb.0:
	cmp	w1, w0
	b.ge	LBB0_2
; ; %bb.1:
	mov	w0, #-1
	ret
LBB0_2:
	and	w8, w1, #0x80000001
	cmp	w1, w0
	ccmp	w8, #1, #0, eq
	b.eq	LBB0_5
; ; %bb.3:
	cmp	w8, #1
	cset	w8, eq
	sub	w0, w1, w8
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
