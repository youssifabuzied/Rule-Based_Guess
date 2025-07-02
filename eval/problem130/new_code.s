```armasm
	.build_version macos, 13, 0	sdk_version 13, 3
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4                               ; -- Begin function func0
lCPI0_0:
	.quad	0                               ; 0x0
	.quad	1                               ; 0x1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_func0
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
	.cfi_offset w20, -12
	mov	x19, x2
	subs	w8, w1, #1
	b.lt	LBB0_11
; %bb.1:
	mov	x9, #0
	mov	w10, w1
	lsl	x11, x10, #3
                                        ; implicit-def: $w12
                                        ; implicit-def: $w13
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x9, x9, #1
	cmp	x9, x10
	b.eq	LBB0_5
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_4 Depth 2
	mov	x14, #0
	ldr	x15, [x0, x9, lsl #3]
LBB0_4:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	w16, [x15, x14]
	cmp	w16, #1
	csel	w12, w9, w12, eq
	csel	w13, w14, w13, eq
	add	x14, x14, #4
	cmp	x11, x14
	b.ne	LBB0_4
	b	LBB0_2
LBB0_5:
	mul	w10, w1, w1
	sxtw	x9, w12
	cmp	w13, #1
	b.lt	LBB0_7
; %bb.6:
	sub	w11, w13, #1
	ldr	x11, [x0, w11, uxtw #3]
	ldr	w11, [x11, x9, lsl #2]
	cmp	w11, w10
	csel	w10, w11, w10, lt
LBB0_7:
	cmp	w13, w8
	b.ge	LBB0_9
; %bb.8:
	add	w11, w13, #1
	ldr	x11, [x0, w11, sxtw #3]
	ldr	w11, [x11, x9, lsl #2]
	cmp	w11, w10
	csel	w10, w11, w10, lt
LBB0_9:
	subs	w11, w9, #1
	b.lt	LBB0_12
; %bb.10:
	ldr	x12, [x0, w13, sxtw #3]
	ldr	w11, [x12, w11, uxtw #2]
	cmp	w11, w10
	csel	w10, w11, w10, lt
	b	LBB0_12
LBB0_11:
	mul	w10, w1, w1
LBB0_12:
	str	w19, [x3]
	sbfiz	x0, x19, #2, #32
	bl	_malloc
	cmp	w19, #1
	b.lt	LBB0_15
; %bb.13:
	mov	w8, w19
	cmp	w19, #16
	b.hs	LBB0_16
; %bb.14:
	mov	x9, #0
LBB0_5:
	mov	w10, #1
LBB0_6:                                 ; =>This Inner Loop Header: Depth=1
	tst	x9, #0x1
	csel	w11, w10, w12, eq
	str	w11, [x0, x9, lsl #2]
	add	x9, x9, #1
	cmp	x8, x9
	b.ne	LBB0_6
LBB0_7:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB0_8:
Lloh0:
	adrp	x11, lCPI1_0@PAGE
Lloh1:
	ldr	q0, [x11, lCPI1_0@PAGEOFF]
	mov	w11, #1
	dup.2d	v1, x11
	mov	w11, #16
	dup.2d	v2, x11
	mov	x9, x10
	mov	x11, x0
LBB0_9:                                 ; =>This Inner Loop Header: Depth=1
	and.16b	v3, v0, v1
	cmeq.2d	v3, v3, #0
	bsl.16b	v3, v1, v12
	str	q3, [x11], #16
	add.2d	v0, v0, v2
	subs	x9, x9, #16
	b.ne	LBB0_9
; %bb.10:
	cmp	x10, x8
	b.eq	LBB0_7
LBB0_11:
	mov	w9, #1
LBB0_12:
	mov	w11, w19
LBB0_13:                                ; =>This Inner Loop Header: Depth=1
	tst	x8, #0x1
	csinc	w12, w12, wzr, ne
	str	w12, [x0, x8, lsl #2]
	add	x8, x8, #1
	cmp	x11, x8
	b.ne	LBB0_13
	b	LBB0_7
LBB0_14:
	mov	x9, #0
	mov	w11, #1
	dup.2d	v0, x11
	mov	w11, #16
	dup.2d	v1, x11
LBB0_15:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
LBB0_16:
	and	x9, x8, #0xfffffff0
	dup.4s	v0, w10
	add	x11, x0, #32
	mvni.4s	v2, #1
	mvni.4s	v3, #3
	mvni.4s	v4, #5
Lloh2:
	adrp	x12, lCPI1_0@PAGE
Lloh3:
	ldr	q5, [x12, lCPI1_0@PAGEOFF]
	mvni.4s	v6, #7
	mov	x12, x9
LBB0_17:                                ; =>This Inner Loop Header: Depth=1
	and.16b	v7, v5, v2
	and.16b	v16, v5, v3
	and.16b	v17, v5, v4
	cmeq.4s	v7, v7, #0
	cmeq.4s	v16, v16, #0
	cmeq.4s	v17, v17, #0
	bit.16b	v18, v0, v7
	bit.16b	v19, v0, v16
	bit.16b	v20, v0, v17
	stp	q18, q19, [x11, #-32]
	stp	q20, q18, [x11], #64
	add.4s	v5, v5, v1
	subs	x12, x12, #16
	b.ne	LBB0_17
; %bb.18:
	cmp	x9, x8
	b.eq	LBB0_7
	b	LBB0_5
	.loh AdrpLdr	Lloh0, Lloh1
	.loh AdrpLdr	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
