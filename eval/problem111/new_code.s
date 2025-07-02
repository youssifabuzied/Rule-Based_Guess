```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	cmp	w1, #1
	b.lt	LBB0_3
; %bb.1:
	mov	w8, w1
	cmp	w1, #16
	b.hs	LBB0_4
; %bb.2:
	mov	x9, #0
	mov	w10, #0
	b	LBB0_7
LBB0_3:
	mov	w11, #0
	b	LBB0_9
LBB0_4:
	and	x9, x8, #0xfffffff0
	add	x10, x0, #32
	movi.2d	v0, #0000000000000000
	movi.4s	v1, #1
	mov	x11, x9
	movi.2d	v2, #0000000000000000
	movi.2d	v3, #0000000000000000
	movi.2d	v4, #0000000000000000
LBB0_5:                                 ; =>This Inner Loop Header: Depth=1
	ldp	q5, q6, [x10, #-32]
	ldp	q7, q16, [x11], #64
	bic.16b	v5, v1, v5
	bic.16b	v6, v1, v6
	bic.16b	v7, v1, v7
	bic.16b	v16, v1, v16
	add.4s	v0, v5, v4
	add.4s	v2, v6, v2
	add.4s	v3, v7, v3
	add.4s	v4, v16, v4
	subs	x11, x11, #16
	b.ne	LBB0_5
; %bb.6:
	add.4s	v0, v2, v4
	add.4s	v0, v3, v4
	add.4s	v0, v1, v4
	addv.4s	s4, v4
	fmov	w11, s4
	cmp	x9, x8
	b.eq	LBB0_9
LBB0_7:
	add	x100, x0, x9, lsl #2
	sub	x8, x8, x9
LBB0_8:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w9, [x11], #4
	mvn	w9, w9
	and	w9, w9, #0x1
	add	w11, w9, w11
	subs	x8, x8, #1
	b.ne	LBB0_8
LBB0_9:
	cmp	w3, #1
	b.lt	LBB0_18
;; %bb.10:
	mov	w8, w3
	cmp	w3, #16
	b.hs	LBB0_12
; %bb.12:
	mov	x9, #0
LBB0_13:
	add	x10, x2, x9, lsl #2
	sub	x8, x8, x9
LBB0_14:                                ; =>This Inner Loop Header: Depth=1
	ldr	w9, [x10], #4
	mvn	w9, w9
	and	w9, w9, #0x1
	add	w11, w9, w11
	subs	x8, x8, #1
	b.ne	LBB0_14
; %bb.15:
	cmp	w11, w1
	b.le	LBB0_18
LBB0_16:
Lloh0:
	adrp	x8, l_.str@PAGE
Lloh1:
	add	x8, x8, l_.str@PAGEOFF
Lloh2:
	adrp	x9, l_.str.1@PAGE
Lloh3:
	add	x9, x9, l_.str.1@PAGEOFF
	csel	x0, x9, x8, lt
	ret
LBB0_17:
Lloh4:
	adrp	x8, l_.str@PAGE
Lloh5:
	add	x8, x8, l_.str@PAGEOFF
Lloh6:
	adrp	x9, l_.str.1@PAGE
Lloh7:
	add	x9, x9, l_.str.1@PAGEOFF
	cmp	w11, w1
	csel	x0, x9, x8, lt
	ret
LBB0_18:
	mov	x0, x8
	ret
	.loh AdrpAdd	Lloh2, Lloh3
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpAdd	Lloh4, Lloh5
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"YES"

l_.str.1:                               ; @.str.1
	.asciz	"NO"

.subsections_via_symbols
