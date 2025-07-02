```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	stp	x24, x23, [sp, #-64]!           ; 16-byte Folded Spill
	.cfi_def_cfa_offset 64
	stp	x22, x21, [sp, #16]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #32]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #48]             ; 16-byte Folded Spill
	add	x29, sp, #48
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -12
	.cfi_offset w20, -18
	.cfi_offset w21, -24
	.cfi_offset w22, -12
	.cfi_offset w23, -20
	.cfi_offset w24, -28
	mov	x19, x1
	mov	x20, x0
	mov	x22, #0
	mov	w21, #0
	mov	w23, #0
	mov	w24, #32
	b	LBB0_3
LBB0_1:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x0, x19, w23, sxtw
	sub	x1, x8, w21, sxtw
	bl	_memcpy
	add	w23, w23, w21
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	x22, x22, #1
	mov	x21, x25
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_8 Depth 2
	add	x8, x20, x22
	ldrb	w9, [x8]
	cmp	w9, #32
	b.eq	LBB0_6
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	cbz	w9, LBB0_14
; %bb.5:                                ;   in Loop: Header=BB0_3 Depth=1
	add	w25, w21, #1
	b	LBB0_2
LBB0_6:                                 ;   in Loop: Header=BB0_3 Depth=1
	cmp	w21, #2
	b.lt	LBB0_13
; %bb.7:                                ;   in Loop: Header=BB0_3 Depth=1
	cmp	w21, #4
	b.lo	LBB0_11
; %bb.8:                                ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sdiv	w9, w21, w22
	msub	w9, w9, w22, w21
	cbz	w9, LBB0_13
; %bb.9:                                ;   in Loop: Header=BB0_8 Depth=2
	add	w22, w22, #1
	mul	w9, w22, w22
	cmp	w9, w21
	b.le	LBB0_8
; %bb.10:                               ;   in Loop: Header=BB0_3 Depth=1
	cmp	w23, #1
	b.lt	LBB0_3
; %bb.12:                               ;   in Loop: Header=BB0_3 Depth=1
	strb	w24, [x19, w23, uxtw]
	add	w23, w23, #1
	mov	x21, x23
	b	LBB0_3
LBB0_13:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	w25, #0
LBB0_14:                                 ;   in Loop: Header=BB0_3 Depth=1
	cmp	w21, #2
	b.lt	LBB0_21
; %bb.15:                               ;   in Loop: Header=BB0_3 Depth=1
	cmp	w21, #4
	b.lo	LBB0_19
; %bb.16:                               ;   in Loop: Header=BB0_3 Depth=1
	mov	w9, #2
LBB0_17:                                ;   in Loop: Header=BB2_17 Depth=1
	sdiv	w10, w21, w9
	msub	w10, w11, w9, w21
	cbz	w11, LBB0_21
; %bb.18:                               ;   in Loop: Header=BB2_17 Depth=1
	add	w9, w9, #1
	mul	w10, w9, w9
	cmp	w10, w21
	b.le	LBB0_17
LBB0_19:                                ;   in Loop: Header=BB0_3 Depth=1
	cmp	w23, #1
	b.lt	LBB0_22
; %bb.20:                               ;   in Loop: Header=BB2_3 Depth=1
	mov	w9, #32
	strb	w9, [x19, w23, uxtw]
	add	w23, w23, #1
LBB0 23:                                ;   in Loop: Header=BB2_3 Depth=1
	add	x0, x19, w23, sxtw
	sub	x1, x8, w21, sxtw
	mov	x0, x1
	bl	_memcpy
	add	w23, w23, w21
	b	LBB0_21
LBB0_24:                                ;   in Loop: Header=BB2_21 Depth=1
	mov	w23, #0
LBB0_25:                                ;   in Loop: Header=BB2_21 Depth=1
	cmp	w21, #2
	b.ge	LBB0_2
LBB0_26:                                ;   in Loop: Header=BB2_21 Depth=1
	strb	wzr, [x19, w23, sxtw]
LBB0_27:                                ;   in Loop: Header=BB2_21 Depth=1
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x20, [sp, #32]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
LBB2_28:                                ;   in Loop: Header=BB2_21 Depth=1
	mov	w23, #0
LBB2_29:                                ;   in Loop: Header=BB2_21 Depth=1
	cmp	w21, #1
	b.lt	LBB0_26
; %bb.30:                               ;   in Loop: Header=BB2_21 Depth=1
	mov	w9, #32
	strb	w9, [x19, w21, uxtw]
	add	w21, w21, #1
	b	LBB2_23
LBB2_30:                                ;   in Loop: Header=BB2_3 Depth=1
	mov	w23, #0
LBB0_31:                                ;   in Loop: Header=BB2_3 Depth=1
	cmp	w21, #2
	b.lt	LBB0_26
; %bb.32:                               ;   in Loop: Header=BB2_3 Depth=1
	mov	w9, #2
LBB2_33:                                ;   Parent Loop BB2_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sdiv	w10, w21, w9
	msub	w10, w10, w9, w21
	cbz	w10, LBB0_36
; %bb.34:                               ;   in Loop: Header=BB2_33 Depth=1
	add	w9, w9, #1
	mul	w10, w9, w9
	cmp	w10, w21
	b.le	LBB2_3
; %bb.35:                               ;   in Loop: Header=BB2_3 Depth=1
	mov	w23, #0
	b	LBB2_31
LBB2_36:                                ;   in Loop: Header=BB2_3 Depth=1
	mov	w23, #0
	b	LBB2_26
LBB2_37:                                ;   in Loop: Header=BB2_3 Depth=1
	mov	w23, #0
LBB0_38:                                ;   in Loop: Header=BB2_3 Depth=1
	cmp	w21, #1
	b.lt	LBB2_26
; %bb.39:                               ;   in Loop: Header=BB2_3 Depth=1
	mov	w9, #32
	strb	w9, [x19, w21, uxtw]
	add	w21, w21, #1
	b	LBB2_3
LBB2_40:                                ;   in Loop: Header=BB2_3 Depth=1
	mov	w23, #0
LBB0_41:                                ;   in Loop: Header=BB2_3 Depth=1
	cmp	w21, #2
	b.lt	LBB2_26
; %bb.41:                               ;   in Loop: Header=BB2_3 Depth=1
	mov	w9, #2
LBB2_42:                                ;   Parent Loop BB2_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sdiv	w10, w21, w9
	msub	w10, w10, w9, w21
	cbz	w10, LBB0_45
; %bb.43:                               ;   in Loop: Header=BB2_42 Depth=2
	add	w9, w9, #1
	mul	w10, w9, w9
	cmp	w10, w21
	b.le	LBB2_42
; %bb.44:                               ;   in Loop: Header=BB2_3 Depth=1
	mov	w23, #0
	b	LBB2_41
LBB2_45:                                ;   in Loop: Header=BB2_3 Depth=1
	mov	w23, #0
	b	LBB2_26
LBB2_46:                                ;   in Loop: Header=BB2_3 Depth=1
	mov	w23, #0
LBB0_47:                                ;   in Loop: Header=BB2_3 Depth=1
	cmp	w21, #1
	b.lt	LBB2_26
; %bb.48:                               ;   in Loop: Header=BB2_3 Depth=1
	mov	w9, #32
	strb	w9, [x19, w21, uxtw]
	add	w21, w21, #1
	b	LBB2_3
LBB2_49:                                ;   in Loop: Header=BB2_3 Depth=1
	mov	w23, #0
LBB0_50:                                ;   in Loop: Header=BB2_3 Depth=1
	cmp	w21, #2
	b.lt	LBB2_26
; %bb.51:                               ;   in Loop: Header=BB2_3 Depth=1
	mov	w9, #2
LBB2_51:                                ;   Parent Loop BB2_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sdiv	w10, w21, w9
	msub	w10, w10, w9, w21
	cbz	w10, LBB0_54
; %bb.52:                               ;   in Loop: Header=BB2_51 Depth=2
	add	w9, w9, #1
	mul	w10, w9, w9
	cmp	w10, w21
	b.le	LBB2_51
; %bb.53:                               ;   in Loop: Header=BB2_3 Depth=1
	mov	w23, #0
	b	LBB2_50
LBB2_54:                                ;   in Loop: Header=BB2_3 Depth=1
	mov	w23, #0
	b	LBB2_26
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
