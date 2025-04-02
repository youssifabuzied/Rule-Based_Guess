	.arch armv8-a
	.file	"problem45.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%llu\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!	
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp	
	mov	x0, 144	
	str	x0, [sp, 16]	
	b	.L2		
.L3:
	ldr	x0, [sp, 16]	
	add	x0, x0, 1	
	str	x0, [sp, 16]	
.L2:
	ldr	x0, [sp, 16]	
	bl	hexagonal		
	str	x0, [sp, 24]	
	ldr	x0, [sp, 24]	
	bl	is_pentagonal		
	cmp	w0, 0	
	beq	.L3		
	ldr	x0, [sp, 24]	
	bl	is_triangle		
	cmp	w0, 0	
	beq	.L3		
	ldr	x1, [sp, 24]	
	adrp	x0, .LC0	
	add	x0, x0, :lo12:.LC0	
	bl	printf		
	mov	w0, 0	
	ldp	x29, x30, [sp], 32	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.global	is_triangle
	.type	is_triangle, %function
is_triangle:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!	
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	
	str	x0, [sp, 24]	
	ldr	x0, [sp, 24]	
	lsl	x0, x0, 3	
	add	x0, x0, 1	
	ucvtf	d0, x0	
	bl	sqrt		
	fcvtzu	d0, d0	
	str	d0, [sp, 40]	
	ldr	x0, [sp, 40]	
	mul	x1, x0, x0	
	ldr	x0, [sp, 24]	
	lsl	x0, x0, 3	
	add	x0, x0, 1	
	cmp	x1, x0	
	bne	.L6		
	ldr	x0, [sp, 40]	
	sub	x0, x0, #1	
	and	x0, x0, 1	
	cmp	x0, 0	
	bne	.L6		
	mov	w0, 1	
	b	.L8		
.L6:
	mov	w0, 0	
.L8:
	ldp	x29, x30, [sp], 48	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	is_triangle, .-is_triangle
	.align	2
	.global	is_pentagonal
	.type	is_pentagonal, %function
is_pentagonal:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!	
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	
	str	x0, [sp, 24]	
	ldr	x1, [sp, 24]	
	mov	x0, x1	
	lsl	x0, x0, 1	
	add	x0, x0, x1	
	lsl	x0, x0, 3	
	add	x0, x0, 1	
	ucvtf	d0, x0	
	bl	sqrt		
	fcvtzu	d0, d0	
	str	d0, [sp, 40]	
	ldr	x0, [sp, 40]	
	mul	x2, x0, x0	
	ldr	x1, [sp, 24]	
	mov	x0, x1	
	lsl	x0, x0, 1	
	add	x0, x0, x1	
	lsl	x0, x0, 3	
	add	x0, x0, 1	
	cmp	x2, x0	
	bne	.L10		
	ldr	x0, [sp, 40]	
	add	x2, x0, 1	
	mov	x0, -6148914691236517206	
	movk	x0, 0xaaab, lsl 0	
	umulh	x0, x2, x0	
	lsr	x1, x0, 2	
	mov	x0, x1	
	lsl	x0, x0, 1	
	add	x0, x0, x1	
	lsl	x0, x0, 1	
	sub	x1, x2, x0	
	cmp	x1, 0	
	bne	.L10		
	mov	w0, 1	
	b	.L12		
.L10:
	mov	w0, 0	
.L12:
	ldp	x29, x30, [sp], 48	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE2:
	.size	is_pentagonal, .-is_pentagonal
	.align	2
	.global	hexagonal
	.type	hexagonal, %function
hexagonal:
.LFB3:
	.cfi_startproc
	sub	sp, sp, #16	
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]	
	ldr	x0, [sp, 8]	
	lsl	x0, x0, 1	
	sub	x1, x0, #1	
	ldr	x0, [sp, 8]	
	mul	x0, x1, x0	
	add	sp, sp, 16	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE3:
	.size	hexagonal, .-hexagonal
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
