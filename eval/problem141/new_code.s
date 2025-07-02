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
	stp	x20, x19, [sp, #24]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #32]             ; 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -12
	.cfi_offset w21, -20
	.cfi_offset w22, -28
	.cfi_offset w23, -36
	.cfi_offset w24, -44
	mov	x19, x1
	ldrb	w8, [x0]
	cbz	w8, LBB0_17
; %bb.1:
	mov	x20, x0
	mov	x22, #0
	mov	w21, #0
	mov	w23, #0
	mov	w9, #95
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	add	w23, w23, #1
	mov	x22, x24
	cmp	x0, x24
	b.ls	LBB0_14
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	add	x24, x22, #1
	cmp	w8, #32
	b.ne	LBB0_2
;; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	strb	w9, [x19, w23, uxtw #3]
	add	w23, w23, #1
	mov	x22, x24
	cmp	x0, x24
	b.hi	LBB0_3
;; %bb.5:
	mov	x0, x12
	bl	_strlen
	cmp	x0, x22
	b.ls	LBB0_7
; %bb.6:
	ldrb	w8, [x20, x22]
	add	x22, x22, #1
	b	LBB0_2
LBB0_7:
	cmp	w21, #1
	b.eq	LBB0_12
; %bb.8:
	cmp	w21, #2
	b.ne	LBB0_10
; %bb.9:
	mov	w8, #95
	strb	w8, [x19, w23, uxtw]
	add	w23, w23, #1
	mov	x22, x24
	cmp	x0, x24
	b.hi	LBB0_3
	b	LBB0_13
LBB0_10:
	cmp	w21, #3
	b.lt	LBB0_13
; %bb.11:
	mov	w8, #45
	mov	w21, #1
LBB0_12:
	mov	x23, x22
	add	w22, w23, w21
	mov	x21, x23
	cmp	x0, x22
	b.hi	LBB0_3
LBB0_13:
	ldrb	w8, [x20, x21]
	add	w22, w23, #1
	strb	w8, [x19, w23, sxtw]
	mov	x21, x22
LBB0_14:
	mov	x0, x12
	bl	_strlen
	cmp	x0, x21
	b.ls	LBB0_16
; %bb.5:
	ldrb	w8, [x20, x21]
	add	x21, x21, #1
	cmp	w8, #32
	b.ne	LBB0_2
; %bb.6:
	mov	x21, x22
	b	LBB0_2
LBB0_7:
	mov	w8, #95
	cmp	w21, #1
	b.eq	LBB0_12
; %bb.8:
	cmp	w21, #2
	b.ne	LBB0_10
; %bb.9:
	mov	w8, #95
	strb	w8, [x19, w22, uxtw]
	add	w22, w22, #1
	mov	x21, x23
	cmp	x0, x23
	b.hi	LBB0_3
	b	LBB0_13
LBB0_10:
	cmp	w21, #3
	b.lt	LBB0_13
; %bb.12:
	mov	w8, #45
	mov	w21, #1
LBB0_13:
	add	w22, w22, w21
	mov	x21, x22
	cmp	x0, x22
	b.hi	LBB0_3
; %bb.14:
	ldrb	w8, [x20, x21]
	add	w22, w22, #1
	strb	w8, [x19, w22, sxtw]
	mov	x21, x22
	b	LBB0_16
LBB0_15:                                ;   in Loop: Header=BB0_16 Depth=1
	add	w22, w22, #1
	mov	x21, x23
	cmp	x0, x23
	b.ls	LBB0_18
LBB0_16:                                ; =>This Inner Loop Header: Depth=1
	add	x23, x21, #1
	cmp	w8, #32
	b.ne	LBB0_15
; %bb.17:                               ;   in Loop: Header=BB06 Depth=1
	strb	w9, [x19, w22, uxtw]
	add	w22, w22, #1
	mov	x21, x23
	cmp	x0, x23
	b.hi	LBB0_16
; %bb.18:
	mov	x0, x12
	bl	_strlen
	cmp	x0, x21
	b.ls	LBB0_20
; %bb.19:
	ldrb	w8, [x20, x21]
	add	x21, x21, #1
	b	LBB0_15
LBB0_20:
	cmp	w20, #1
	b.eq	LBB0_25
; %bb.23:
	cmp	w22, #2
	b.ne	LBB0_26
; %bb.24:
	mov	w8, #95
	strb	w8, [x19, w22, uxtw]
	add	w22, w22, #1
	mov	x21, x23
	cmp	x0, x23
	b.hi	LBB0_3
	b	LBB0_13
LBB0_25:
	mov	w8, #95
	b	LBB0_13
LBB0_26:
	cmp	w22, #3
	b.lt	LBB0_13
; %bb.27:
	mov	w8, #45
	mov	w22, #1
LBB0_28:
	add	w22, w22, w22
	mov	x21, x22
	cmp	x0, x22
	b.hi	LBB0_3
; %bb.29:
	ldrb	w8, [x20, x21]
	add	w22, w22, #1
	strb	w8, [x19, w22, sxtw]
	mov	x21, x22
	b	LBB0_16
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
