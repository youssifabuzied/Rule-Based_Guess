	.arch armv8-a
	.file	"problem42.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"r"
	.align	3
.LC1:
	.string	"words.txt"
	.align	3
.LC2:
	.string	"\"%[^\"]\","
	.align	3
.LC3:
	.string	"%d\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!	
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp	
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x1, [x0]	
	str	x1, [sp, 72]	
	mov	x1, 0	
	str	wzr, [sp, 20]	
	adrp	x0, .LC0	
	add	x1, x0, :lo12:.LC0	
	adrp	x0, .LC1	
	add	x0, x0, :lo12:.LC1	
	bl	fopen		
	str	x0, [sp, 32]	
	ldr	x0, [sp, 32]	
	cmp	x0, 0	
	bne	.L4		
	adrp	x0, .LC1	
	add	x0, x0, :lo12:.LC1	
	bl	perror		
	mov	w0, 1	
	b	.L8		
.L7:
	str	wzr, [sp, 28]	
	str	wzr, [sp, 24]	
	b	.L5		
.L6:
	ldrsw	x0, [sp, 24]	
	add	x1, sp, 40	
	ldrb	w0, [x1, x0]	
	sub	w0, w0, #64	
	ldr	w1, [sp, 28]	
	add	w0, w1, w0	
	str	w0, [sp, 28]	
	ldr	w0, [sp, 24]	
	add	w0, w0, 1	
	str	w0, [sp, 24]	
.L5:
	ldrsw	x0, [sp, 24]	
	add	x1, sp, 40	
	ldrb	w0, [x1, x0]	
	cmp	w0, 0	
	bne	.L6		
	ldr	w0, [sp, 28]	
	bl	is_triangle		
	mov	w1, w0	
	ldr	w0, [sp, 20]	
	add	w0, w0, w1	
	str	w0, [sp, 20]	
.L4:
	add	x0, sp, 40	
	mov	x2, x0	
	adrp	x0, .LC2	
	add	x1, x0, :lo12:.LC2	
	ldr	x0, [sp, 32]	
	bl	__isoc99_fscanf		
	cmn	w0, #1	
	bne	.L7		
	ldr	x0, [sp, 32]	
	bl	fclose		
	ldr	w1, [sp, 20]	
	adrp	x0, .LC3	
	add	x0, x0, :lo12:.LC3	
	bl	printf		
	mov	w0, 0	
.L8:
	mov	w1, w0	
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x3, [sp, 72]	
	ldr	x2, [x0]	
	subs	x3, x3, x2	
	mov	x2, 0	
	beq	.L9		
	bl	__stack_chk_fail		
.L9:
	mov	w0, w1	
	ldp	x29, x30, [sp], 80	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.type	is_triangle, %function
is_triangle:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!	
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	
	str	w0, [sp, 28]	
	ldr	w0, [sp, 28]	
	lsl	w0, w0, 3	
	add	w0, w0, 1	
	scvtf	d0, w0	
	bl	sqrt		
	fcvtzs	w0, d0	
	str	w0, [sp, 44]	
	ldr	w0, [sp, 44]	
	mul	w1, w0, w0	
	ldr	w0, [sp, 28]	
	lsl	w0, w0, 3	
	add	w0, w0, 1	
	cmp	w1, w0	
	bne	.L11		
	ldr	w0, [sp, 44]	
	and	w0, w0, 1	
	cmp	w0, 0	
	beq	.L11		
	mov	w0, 1	
	b	.L13		
.L11:
	mov	w0, 0	
.L13:
	ldp	x29, x30, [sp], 48	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	is_triangle, .-is_triangle
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
