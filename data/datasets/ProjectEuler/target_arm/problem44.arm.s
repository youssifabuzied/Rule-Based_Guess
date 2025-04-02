	.arch armv8-a
	.file	"problem44.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%u\n"
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
	mov	w0, -1	
	str	w0, [sp, 36]	
	mov	w0, 1	
	str	w0, [sp, 28]	
	b	.L2		
.L6:
	ldr	w0, [sp, 28]	
	str	w0, [sp, 32]	
	b	.L3		
.L5:
	ldr	w0, [sp, 28]	
	bl	pentagonal		
	str	w0, [sp, 40]	
	ldr	w0, [sp, 32]	
	bl	pentagonal		
	str	w0, [sp, 44]	
	ldr	w1, [sp, 40]	
	ldr	w0, [sp, 44]	
	add	w0, w1, w0	
	bl	is_pentagonal		
	cmp	w0, 0	
	beq	.L4		
	ldr	w1, [sp, 44]	
	ldr	w0, [sp, 40]	
	sub	w0, w1, w0	
	bl	is_pentagonal		
	cmp	w0, 0	
	beq	.L4		
	ldr	w1, [sp, 44]	
	ldr	w0, [sp, 40]	
	sub	w0, w1, w0	
	ldr	w1, [sp, 36]	
	cmp	w1, w0	
	bls	.L4		
	ldr	w1, [sp, 44]	
	ldr	w0, [sp, 40]	
	sub	w0, w1, w0	
	str	w0, [sp, 36]	
.L4:
	ldr	w0, [sp, 32]	
	add	w0, w0, 1	
	str	w0, [sp, 32]	
.L3:
	ldr	w1, [sp, 32]	
	mov	w0, 9999	
	cmp	w1, w0	
	bls	.L5		
	ldr	w0, [sp, 28]	
	add	w0, w0, 1	
	str	w0, [sp, 28]	
.L2:
	ldr	w1, [sp, 28]	
	mov	w0, 9999	
	cmp	w1, w0	
	bls	.L6		
	ldr	w1, [sp, 36]	
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
	.type	pentagonal, %function
pentagonal:
.LFB1:
	.cfi_startproc
	sub	sp, sp, #16	
	.cfi_def_cfa_offset 16
	str	w0, [sp, 12]	
	ldr	w1, [sp, 12]	
	mov	w0, w1	
	lsl	w0, w0, 1	
	add	w0, w0, w1	
	sub	w1, w0, #1	
	ldr	w0, [sp, 12]	
	mul	w0, w1, w0	
	lsr	w0, w0, 1	
	add	sp, sp, 16	
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1:
	.size	pentagonal, .-pentagonal
	.align	2
	.type	is_pentagonal, %function
is_pentagonal:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!	
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	
	str	w0, [sp, 28]	
	ldr	w1, [sp, 28]	
	mov	w0, w1	
	lsl	w0, w0, 1	
	add	w0, w0, w1	
	lsl	w0, w0, 3	
	add	w0, w0, 1	
	ucvtf	d0, w0	
	bl	sqrt		
	fcvtzu	w0, d0	
	str	w0, [sp, 44]	
	ldr	w0, [sp, 44]	
	mul	w2, w0, w0	
	ldr	w1, [sp, 28]	
	mov	w0, w1	
	lsl	w0, w0, 1	
	add	w0, w0, w1	
	lsl	w0, w0, 3	
	add	w0, w0, 1	
	cmp	w2, w0	
	bne	.L11		
	ldr	w0, [sp, 44]	
	add	w2, w0, 1	
	mov	w0, 43691	
	movk	w0, 0xaaaa, lsl 16	
	umull	x0, w2, w0	
	lsr	x0, x0, 32	
	lsr	w1, w0, 2	
	mov	w0, w1	
	lsl	w0, w0, 1	
	add	w0, w0, w1	
	lsl	w0, w0, 1	
	sub	w1, w2, w0	
	cmp	w1, 0	
	bne	.L11		
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
.LFE2:
	.size	is_pentagonal, .-is_pentagonal
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
