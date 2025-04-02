	.arch armv8-a
	.file	"problem32.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%d%d%d"
	.align	3
.LC1:
	.string	"%d\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!	
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp	
	str	x19, [sp, 16]	
	str	d8, [sp, 24]	
	.cfi_offset 19, -64
	.cfi_offset 72, -56
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x1, [x0]	
	str	x1, [sp, 72]	
	mov	x1, 0	
	str	wzr, [sp, 44]	
	mov	w0, 1111	
	str	w0, [sp, 36]	
	b	.L2		
.L9:
	mov	w0, 2	
	str	w0, [sp, 40]	
	b	.L3		
.L8:
	ldr	w0, [sp, 36]	
	ldr	w1, [sp, 40]	
	sdiv	w2, w0, w1	
	ldr	w1, [sp, 40]	
	mul	w1, w2, w1	
	sub	w0, w0, w1	
	str	w0, [sp, 48]	
	ldr	w0, [sp, 48]	
	cmp	w0, 0	
	bne	.L12		
	ldr	w1, [sp, 36]	
	ldr	w0, [sp, 40]	
	sdiv	w0, w1, w0	
	str	w0, [sp, 52]	
	ldr	w0, [sp, 40]	
	scvtf	d0, w0	
	bl	log10		
	bl	floor		
	fcvtzs	d8, d0	
	ldr	w0, [sp, 52]	
	scvtf	d0, w0	
	bl	log10		
	bl	floor		
	fcvtzs	d0, d0	
	add	d0, d8, d0	
	fmov	x19, d0	
	ldr	w0, [sp, 36]	
	scvtf	d0, w0	
	bl	log10		
	bl	floor		
	fcvtzs	d0, d0	
	fmov	x0, d0	
	add	x0, x19, x0	
	cmp	x0, 6	
	bne	.L13		
	add	x6, sp, 56	
	ldr	w5, [sp, 36]	
	ldr	w4, [sp, 52]	
	ldr	w3, [sp, 40]	
	adrp	x0, .LC0	
	add	x2, x0, :lo12:.LC0	
	mov	x1, 10	
	mov	x0, x6	
	bl	snprintf		
	add	x0, sp, 56	
	bl	is_pandigital		
	cmp	w0, 0	
	beq	.L5		
	ldr	w1, [sp, 44]	
	ldr	w0, [sp, 36]	
	add	w0, w1, w0	
	str	w0, [sp, 44]	
	b	.L7		
.L12:
	nop	
	b	.L5		
.L13:
	nop	
.L5:
	ldr	w0, [sp, 40]	
	add	w0, w0, 1	
	str	w0, [sp, 40]	
.L3:
	ldr	w0, [sp, 40]	
	mul	w0, w0, w0	
	ldr	w1, [sp, 36]	
	cmp	w1, w0	
	bgt	.L8		
.L7:
	ldr	w0, [sp, 36]	
	add	w0, w0, 1	
	str	w0, [sp, 36]	
.L2:
	ldr	w1, [sp, 36]	
	mov	w0, 34463	
	movk	w0, 0x1, lsl 16	
	cmp	w1, w0	
	ble	.L9		
	ldr	w1, [sp, 44]	
	adrp	x0, .LC1	
	add	x0, x0, :lo12:.LC1	
	bl	printf		
	mov	w0, 0	
	mov	w1, w0	
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x3, [sp, 72]	
	ldr	x2, [x0]	
	subs	x3, x3, x2	
	mov	x2, 0	
	beq	.L11		
	bl	__stack_chk_fail		
.L11:
	mov	w0, w1	
	ldr	d8, [sp, 24]	
	ldr	x19, [sp, 16]	
	ldp	x29, x30, [sp], 80	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 72
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.align	2
	.type	compare, %function
compare:
.LFB7:
	.cfi_startproc
	sub	sp, sp, #16	
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]	
	str	x1, [sp]	
	ldr	x0, [sp, 8]	
	ldrb	w0, [x0]	
	mov	w1, w0	
	ldr	x0, [sp]	
	ldrb	w0, [x0]	
	sub	w0, w1, w0	
	add	sp, sp, 16	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE7:
	.size	compare, .-compare
	.section	.rodata
	.align	3
.LC2:
	.string	"123456789"
	.text
	.align	2
	.type	is_pandigital, %function
is_pandigital:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!	
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp	
	str	x0, [sp, 24]	
	adrp	x0, compare	
	add	x3, x0, :lo12:compare	
	mov	x2, 1	
	mov	x1, 9	
	ldr	x0, [sp, 24]	
	bl	qsort		
	mov	x2, 9	
	adrp	x0, .LC2	
	add	x1, x0, :lo12:.LC2	
	ldr	x0, [sp, 24]	
	bl	memcmp		
	cmp	w0, 0	
	cset	w0, eq	
	and	w0, w0, 255	
	ldp	x29, x30, [sp], 32	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE8:
	.size	is_pandigital, .-is_pandigital
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
