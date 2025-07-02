```armasm
	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 13, 0	sdk_version 13, 3
	.globl	_func0                          ; -- Begin function func0
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
	.cfi_offset w20, -32
	cmp	w0, w1
	b.le	LBB0_2
; %bb.1:
Lloh0:
	adrp	x0, l_.str@PAGE
Lloh1:
	add	x0, x0, l_.str@PAGEOFF
	b	LBB0_4
LBB0_2:
	add	w19, w1, w0
	mov	w0, #33
	bl	_malloc
	strb	wzr, [x0]
	strb	wzr, [x0, #32]
	add	x8, x0, #32
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	cmp	w19, #0
	cinc	w9, w19, lt
	asr	w10, w9, #1
	and	w9, w10, #0x1
	cmp	w9, #0
	cneg	w9, w9, lt
	add	w9, w9, #48
	sturb	w9, [x8, #-1]
	sub	x8, x8, #1
	cmp	w19, #3
	b.gt	LBB0_3
LBB0_4:
	ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp], #32             ; 16-byte Folded Reload
	ret
	.loh AdrpAdd	Lloh0, Lloh1
	.cfi_endproc
                                        ; -- End function
	.section	__TEXT,__cstring,cstring_literals
l_.str:                                 ; @.str
	.asciz	"-1"

.subsections_via_symbols
