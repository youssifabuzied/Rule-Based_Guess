```armasm
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
	.p2align	2
_func0:                                 ; @func0
	.cfi_startproc
; %bb.0:
	sub	sp, sp, #96
	.cfi_def_cfa_offset 96
	stp	x24, x23, [sp, #32]             ; 16-byte Folded Spill
	stp	x22, x21, [sp, #48]             ; 16-byte Folded Spill
	stp	x20, x19, [sp, #64]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #80]             ; 16-byte Folded Spill
	add	x29, sp, #80
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -12
	.cfi_offset w20, -16
	.cfi_offset w21, -12
	.cfi_offset w22, -18
	.cfi_offset w23, -24
	.cfi_offset w24, -30
	mov	x21, x1
	mov	x19, x0
	sbfiz	x0, x21, #3, #32
	bl	_malloc
	mov	x20, x0
	cmp	w21, #1
	b.lt	LBB0_9
;adrp	x23, l_.str@PAGE
	mov	w24, #1
	movk	w24, #32768, lsl #16
	b	LBB0_3
LBB0_1:                                 ;   in Loop: Header=BB0_3 Depth=1
	mov	w22, #0
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	mov	w0, #100
	bl	_malloc
	str	x0, [x20], #8
	stp	x22, x21, [sp, #8]
	str	x22, [sp]
	mov	w1, #0
	mov	w2, #100
	mov	x3, x23
	bl	___sprintf_chk
	cmp	x21, #1
	b.eq	LBB0_9
LBB0_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_6 Depth 2
	mov	x21, x20
	ldr	x8, [x19], #8
	ldrb	w9, [x8]
	cbz	w9, LBB0_1
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	mov	w22, #0
	add	x8, x8, #1
	b	LBB0_6
LBB0_5:                                 ;   in Loop: Header=BB0_6 Depth=2
	ldrb	w9, [x8], #1
	cbz	w9, LBB0_2
LBB0_6:                                 ;   Parent Loop BB0_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sub	w10, w9, #48
	cmp	w10, #9
	b.hi	LBB0_5
; %bb.7:                                ;   in Loop: Header=BB0_6 Depth=2
	and	w9, w9, #0xff
	sub	w9, w9, #48
	and	w9, w9, w24
	cmp	w9, #1
	cinc	w22, w22, eq
	b	LBB0_5
LBB0_8:                                 ;   in Loop: Header=BB0_9 Depth=1
	mov	w0, #100
	bl	_malloc
	str	x0, [x20], #8
	stp	x22, x21, [sp, #8]
	str	x22, [sp]
	mov	w1, #0
	mov	w2, #100
	mov	x3, x23
	bl	___sprintf_chk
LBB0_9:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_11 Depth 2
	cmp	x20, #1
	b.lt	LBB0_8
; %bb.10:                               ;   in Loop: Header=BB0_9 Depth=1
	ldr	x8, [x19], #8
	ldrb	w9, [x8]
	cbz	w9, LBB0_12
; %bb.11:                               ;   Parent Loop BB0_9 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sub	w10, w9, #48
	cmp	w10, #9
	b.hi	LBB0_13
; %bb.12:                               ;   in Loop: Header=BB0_11 Depth=2
	and	w9, w9, #0xff
	sub	w9, w9, #48
	and	w9, w9, w24
	cmp	w9, #1
	cinc	w22, w22, eq
	b	LBB0_14
LBB0_13:                                ;   in Loop: Header=BB0_11 Depth=2
	mov	w22, #0
LBB0_14:                                ;   in Loop: Header=BB0_11 Depth=2
	ldrb	w9, [x8], #1
	cbnz	w9, LBB0_11
; %bb.15:                               ;   in Loop: Header=BB0_9 Depth=1
	mov	w22, #0
	b	LBB0_2
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"the the number of odd elements %d in the string %d of the %d input."

.subsections_via_symbols
