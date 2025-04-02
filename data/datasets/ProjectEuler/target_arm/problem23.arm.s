	.arch armv8-a
	.file	"problem23.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%d\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!	
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp	
	mov	w0, 28123	
	str	w0, [sp, 40]	
	str	wzr, [sp, 32]	
	str	wzr, [sp, 36]	
	mov	w0, 1	
	str	w0, [sp, 24]	
	b	.L2		
.L4:
	ldr	w0, [sp, 24]	
	bl	is_abundant		
	cmp	w0, 0	
	beq	.L3		
	ldr	w0, [sp, 32]	
	add	w0, w0, 1	
	str	w0, [sp, 32]	
.L3:
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
.L2:
	ldr	w1, [sp, 24]	
	ldr	w0, [sp, 40]	
	cmp	w1, w0	
	blt	.L4		
	ldrsw	x0, [sp, 32]	
	lsl	x0, x0, 2	
	bl	malloc		
	str	x0, [sp, 48]	
	str	wzr, [sp, 28]	
	mov	w0, 1	
	str	w0, [sp, 24]	
	b	.L5		
.L7:
	ldr	w0, [sp, 24]	
	bl	is_abundant		
	cmp	w0, 0	
	beq	.L6		
	ldr	w0, [sp, 28]	
	add	w1, w0, 1	
	str	w1, [sp, 28]	
	sxtw	x0, w0	
	lsl	x0, x0, 2	
	ldr	x1, [sp, 48]	
	add	x0, x1, x0	
	ldr	w1, [sp, 24]	
	str	w1, [x0]	
.L6:
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
.L5:
	ldr	w1, [sp, 24]	
	ldr	w0, [sp, 40]	
	cmp	w1, w0	
	blt	.L7		
	ldrsw	x0, [sp, 40]	
	mov	x1, 1	
	bl	calloc		
	str	x0, [sp, 56]	
	str	wzr, [sp, 24]	
	b	.L8		
.L13:
	ldr	w0, [sp, 24]	
	str	w0, [sp, 28]	
	b	.L9		
.L12:
	ldrsw	x0, [sp, 24]	
	lsl	x0, x0, 2	
	ldr	x1, [sp, 48]	
	add	x0, x1, x0	
	ldr	w1, [x0]	
	ldrsw	x0, [sp, 28]	
	lsl	x0, x0, 2	
	ldr	x2, [sp, 48]	
	add	x0, x2, x0	
	ldr	w0, [x0]	
	add	w0, w1, w0	
	str	w0, [sp, 44]	
	ldr	w1, [sp, 44]	
	ldr	w0, [sp, 40]	
	cmp	w1, w0	
	bge	.L18		
	ldrsw	x0, [sp, 44]	
	sub	x0, x0, #1	
	ldr	x1, [sp, 56]	
	add	x0, x1, x0	
	mov	w1, 1	
	strb	w1, [x0]	
	ldr	w0, [sp, 28]	
	add	w0, w0, 1	
	str	w0, [sp, 28]	
.L9:
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 32]	
	cmp	w1, w0	
	blt	.L12		
	b	.L11		
.L18:
	nop	
.L11:
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
.L8:
	ldr	w1, [sp, 24]	
	ldr	w0, [sp, 32]	
	cmp	w1, w0	
	blt	.L13		
	mov	w0, 1	
	str	w0, [sp, 24]	
	b	.L14		
.L16:
	ldrsw	x0, [sp, 24]	
	sub	x0, x0, #1	
	ldr	x1, [sp, 56]	
	add	x0, x1, x0	
	ldrb	w0, [x0]	
	cmp	w0, 0	
	bne	.L15		
	ldr	w1, [sp, 36]	
	ldr	w0, [sp, 24]	
	add	w0, w1, w0	
	str	w0, [sp, 36]	
.L15:
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
.L14:
	ldr	w1, [sp, 24]	
	ldr	w0, [sp, 40]	
	cmp	w1, w0	
	blt	.L16		
	ldr	w1, [sp, 36]	
	adrp	x0, .LC0	
	add	x0, x0, :lo12:.LC0	
	bl	printf		
	ldr	x0, [sp, 48]	
	bl	free		
	ldr	x0, [sp, 56]	
	bl	free		
	mov	w0, 0	
	ldp	x29, x30, [sp], 64	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.align	2
	.type	is_abundant, %function
is_abundant:
.LFB7:
	.cfi_startproc
	sub	sp, sp, #32	
	.cfi_def_cfa_offset 32
	str	w0, [sp, 12]	
	mov	w0, 1	
	str	w0, [sp, 16]	
	ldr	w0, [sp, 12]	
	str	w0, [sp, 24]	
	mov	w0, 2	
	str	w0, [sp, 20]	
	b	.L20		
.L23:
	mov	w0, 1	
	str	w0, [sp, 28]	
	b	.L21		
.L22:
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 20]	
	mul	w0, w1, w0	
	str	w0, [sp, 28]	
	ldr	w1, [sp, 24]	
	ldr	w0, [sp, 20]	
	sdiv	w0, w1, w0	
	str	w0, [sp, 24]	
.L21:
	ldr	w0, [sp, 24]	
	ldr	w1, [sp, 20]	
	sdiv	w2, w0, w1	
	ldr	w1, [sp, 20]	
	mul	w1, w2, w1	
	sub	w0, w0, w1	
	cmp	w0, 0	
	beq	.L22		
	ldr	w1, [sp, 28]	
	ldr	w0, [sp, 20]	
	mul	w0, w1, w0	
	sub	w1, w0, #1	
	ldr	w0, [sp, 20]	
	sub	w0, w0, #1	
	sdiv	w0, w1, w0	
	ldr	w1, [sp, 16]	
	mul	w0, w1, w0	
	str	w0, [sp, 16]	
	ldr	w0, [sp, 20]	
	add	w0, w0, 1	
	str	w0, [sp, 20]	
.L20:
	ldr	w1, [sp, 20]	
	ldr	w0, [sp, 24]	
	cmp	w1, w0	
	ble	.L23		
	ldr	w0, [sp, 12]	
	lsl	w0, w0, 1	
	ldr	w1, [sp, 16]	
	cmp	w1, w0	
	cset	w0, gt	
	and	w0, w0, 255	
	add	sp, sp, 32	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE7:
	.size	is_abundant, .-is_abundant
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
