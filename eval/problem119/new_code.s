```armasm
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
	.cfi_offset w19, -14
	.cfi_offset w20, -12
	.cfi_offset w21, -20
	.cfi_offset w22, -28
	.cfi_offset w23, -36
	.cfi_offset w24, -40
	mov	x19, x0
	bl	_strlen
	sub	w21, w0, #2
	cmp	w21, #1
	b.lt	LBB0_6
; %bb.1:
	mov	w8, #-1
	add	x22, x21, x8
Lloh0:
	adrp	x20, l_.str@PAGE
Lloh1:
	add	x20, x20, l_.str@PAGEOFF
	b	LBB0_3
LBB0_2:                                 ;   in Loop: Header=BB0_3 Depth=1
	sub	x21, x21, #1
	cmp	x21, #1
	b.le	LBB0_6
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	ldrsb	w1, [x19, x21]
	and	w23, w1, #0xff
	mov	x0, x20
	mov	w2, #1
	bl	_memchr
	cbz	x0, LBB0_2
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	ldrsb	w1, [x19, x21]
	mov	x0, x20
	mov	w2, #1
	bl	_memchr
	cbnz	x0, LBB0_2
; %bb.5:                                ;   in Loop: Header=BB0_3 Depth=1
	ldrsb	w1, [x19, w22, uxtw]
	mov	x0, x20
	mov	w2, #1
	bl	_memchr
	cbnz	x0, LBB0_2
	b	LBB0_7
LBB0_6:
	mov	w23, #0
LBB0_7:
Lloh2:
	adrp	x0, _func0.out@PAGE
Lloh3:
	add	x0, x0, _func0.out@PAGEOFF
	strb	w23, [x0]
	ldp	x29, x30, [sp, #48]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #32]             ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #16]             ; 16-byte Folded Reload
	ldp	x24, x23, [sp], #64             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.loh AdrpAdd	Lloh2, Lloh3
	.cfi_endproc
                                        ; -- End function
.zerofill __DATA,__bss,_func0.out,2,0   ; @func0.out
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"AEIOUaeiou"

.subsections_via_symbols
