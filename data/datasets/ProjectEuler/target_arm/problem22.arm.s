	.arch armv8-a
	.file	"problem22.c"
	.text
	.section	.rodata
	.align	3
.LC1:
	.string	"r"
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
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!	
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp	
	str	x19, [sp, 16]	
	.cfi_offset 19, -80
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x1, [x0]	
	str	x1, [sp, 88]	
	mov	x1, 0	
	str	wzr, [sp, 36]	
	adrp	x0, .LC0	
	add	x1, x0, :lo12:.LC0	
	add	x0, sp, 72	
	ldr	x2, [x1]	
	str	x2, [x0]	
	ldrh	w1, [x1, 8]	
	strh	w1, [x0, 8]	
	str	wzr, [sp, 44]	
	add	x2, sp, 72	
	adrp	x0, .LC1	
	add	x1, x0, :lo12:.LC1	
	mov	x0, x2	
	bl	fopen		
	str	x0, [sp, 56]	
	ldr	x0, [sp, 56]	
	cmp	x0, 0	
	bne	.L2		
	add	x0, sp, 72	
	bl	perror		
	mov	w0, 1	
	b	.L10		
.L2:
	mov	x0, 65536	
	bl	malloc		
	str	x0, [sp, 64]	
	ldrsw	x0, [sp, 36]	
	lsl	x0, x0, 3	
	ldr	x1, [sp, 64]	
	add	x19, x1, x0	
	mov	x0, 16	
	bl	malloc		
	str	x0, [x19]	
	b	.L4		
.L5:
	ldr	w0, [sp, 36]	
	add	w0, w0, 1	
	str	w0, [sp, 36]	
	ldrsw	x0, [sp, 36]	
	lsl	x0, x0, 3	
	ldr	x1, [sp, 64]	
	add	x19, x1, x0	
	mov	x0, 16	
	bl	malloc		
	str	x0, [x19]	
.L4:
	ldrsw	x0, [sp, 36]	
	lsl	x0, x0, 3	
	ldr	x1, [sp, 64]	
	add	x0, x1, x0	
	ldr	x0, [x0]	
	mov	x2, x0	
	adrp	x0, .LC2	
	add	x1, x0, :lo12:.LC2	
	ldr	x0, [sp, 56]	
	bl	__isoc99_fscanf		
	cmn	w0, #1	
	bne	.L5		
	ldrsw	x0, [sp, 36]	
	lsl	x0, x0, 3	
	ldr	x1, [sp, 64]	
	add	x0, x1, x0	
	ldr	x0, [x0]	
	bl	free		
	ldr	x0, [sp, 56]	
	bl	fclose		
	ldrsw	x1, [sp, 36]	
	adrp	x0, compare	
	add	x3, x0, :lo12:compare	
	mov	x2, 8	
	ldr	x0, [sp, 64]	
	bl	qsort		
	str	wzr, [sp, 40]	
	b	.L6		
.L9:
	str	wzr, [sp, 52]	
	str	wzr, [sp, 48]	
	b	.L7		
.L8:
	ldrsw	x0, [sp, 40]	
	lsl	x0, x0, 3	
	ldr	x1, [sp, 64]	
	add	x0, x1, x0	
	ldr	x1, [x0]	
	ldrsw	x0, [sp, 48]	
	add	x0, x1, x0	
	ldrb	w0, [x0]	
	sub	w0, w0, #64	
	ldr	w1, [sp, 52]	
	add	w0, w1, w0	
	str	w0, [sp, 52]	
	ldr	w0, [sp, 48]	
	add	w0, w0, 1	
	str	w0, [sp, 48]	
.L7:
	ldrsw	x0, [sp, 40]	
	lsl	x0, x0, 3	
	ldr	x1, [sp, 64]	
	add	x0, x1, x0	
	ldr	x1, [x0]	
	ldrsw	x0, [sp, 48]	
	add	x0, x1, x0	
	ldrb	w0, [x0]	
	cmp	w0, 0	
	bne	.L8		
	ldr	w0, [sp, 40]	
	add	w1, w0, 1	
	ldr	w0, [sp, 52]	
	mul	w0, w1, w0	
	ldr	w1, [sp, 44]	
	add	w0, w1, w0	
	str	w0, [sp, 44]	
	ldrsw	x0, [sp, 40]	
	lsl	x0, x0, 3	
	ldr	x1, [sp, 64]	
	add	x0, x1, x0	
	ldr	x0, [x0]	
	bl	free		
	ldr	w0, [sp, 40]	
	add	w0, w0, 1	
	str	w0, [sp, 40]	
.L6:
	ldr	w1, [sp, 40]	
	ldr	w0, [sp, 36]	
	cmp	w1, w0	
	blt	.L9		
	ldr	x0, [sp, 64]	
	bl	free		
	ldr	w1, [sp, 44]	
	adrp	x0, .LC3	
	add	x0, x0, :lo12:.LC3	
	bl	printf		
	mov	w0, 0	
.L10:
	mov	w1, w0	
	adrp	x0, :got:__stack_chk_guard	
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	
	ldr	x3, [sp, 88]	
	ldr	x2, [x0]	
	subs	x3, x3, x2	
	mov	x2, 0	
	beq	.L11		
	bl	__stack_chk_fail		
.L11:
	mov	w0, w1	
	ldr	x19, [sp, 16]	
	ldp	x29, x30, [sp], 96	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
	.align	3
.LC0:
	.string	"names.txt"
	.text
	.align	2
	.type	compare, %function
compare:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!	
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp	
	str	x0, [sp, 24]	
	str	x1, [sp, 16]	
	ldr	x0, [sp, 24]	
	ldr	x2, [x0]	
	ldr	x0, [sp, 16]	
	ldr	x0, [x0]	
	mov	x1, x0	
	mov	x0, x2	
	bl	strcmp		
	ldp	x29, x30, [sp], 32	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE7:
	.size	compare, .-compare
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
