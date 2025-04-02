	.arch armv8-a
	.file	"problem27.c"
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
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!	
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	
	str	wzr, [sp, 36]	
	str	wzr, [sp, 40]	
	str	wzr, [sp, 44]	
	mov	w0, -999	
	str	w0, [sp, 24]	
	b	.L2		
.L8:
	mov	w0, -999	
	str	w0, [sp, 28]	
	b	.L3		
.L7:
	str	wzr, [sp, 32]	
	b	.L4		
.L5:
	ldr	w0, [sp, 32]	
	add	w0, w0, 1	
	str	w0, [sp, 32]	
.L4:
	ldr	w0, [sp, 32]	
	mul	w1, w0, w0	
	ldr	w2, [sp, 24]	
	ldr	w0, [sp, 32]	
	mul	w0, w2, w0	
	add	w1, w1, w0	
	ldr	w0, [sp, 28]	
	add	w0, w1, w0	
	bl	is_prime		
	cmp	w0, 0	
	bne	.L5		
	ldr	w1, [sp, 32]	
	ldr	w0, [sp, 36]	
	cmp	w1, w0	
	ble	.L6		
	ldr	w0, [sp, 32]	
	str	w0, [sp, 36]	
	ldr	w0, [sp, 24]	
	str	w0, [sp, 40]	
	ldr	w0, [sp, 28]	
	str	w0, [sp, 44]	
.L6:
	ldr	w0, [sp, 28]	
	add	w0, w0, 1	
	str	w0, [sp, 28]	
.L3:
	ldr	w0, [sp, 28]	
	cmp	w0, 999	
	ble	.L7		
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
.L2:
	ldr	w0, [sp, 24]	
	cmp	w0, 999	
	ble	.L8		
	ldr	w1, [sp, 40]	
	ldr	w0, [sp, 44]	
	mul	w0, w1, w0	
	mov	w1, w0	
	adrp	x0, .LC0	
	add	x0, x0, :lo12:.LC0	
	bl	printf		
	mov	w0, 0	
	ldp	x29, x30, [sp], 48	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.type	is_prime, %function
is_prime:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!	
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp	
	str	d8, [sp, 16]	
	.cfi_offset 72, -48
	str	w0, [sp, 44]	
	ldr	w0, [sp, 44]	
	cmp	w0, 1	
	bgt	.L11		
	mov	w0, 0	
	b	.L12		
.L11:
	ldr	w0, [sp, 44]	
	cmp	w0, 2	
	bne	.L13		
	mov	w0, 1	
	b	.L12		
.L13:
	mov	w0, 2	
	str	w0, [sp, 60]	
	b	.L14		
.L16:
	ldr	w0, [sp, 44]	
	ldr	w1, [sp, 60]	
	sdiv	w2, w0, w1	
	ldr	w1, [sp, 60]	
	mul	w1, w2, w1	
	sub	w0, w0, w1	
	cmp	w0, 0	
	bne	.L15		
	mov	w0, 0	
	b	.L12		
.L15:
	ldr	w0, [sp, 60]	
	add	w0, w0, 1	
	str	w0, [sp, 60]	
.L14:
	ldr	w0, [sp, 60]	
	scvtf	d8, w0	
	ldr	w0, [sp, 44]	
	scvtf	d0, w0	
	bl	sqrt		
	fcmpe	d8, d0	
	bmi	.L16		
	mov	w0, 1	
.L12:
	ldr	d8, [sp, 16]	
	ldp	x29, x30, [sp], 64	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 72
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	is_prime, .-is_prime
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
