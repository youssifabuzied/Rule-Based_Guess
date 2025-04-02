	.arch armv8-a
	.file	"problem31.c"
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
	stp	x29, x30, [sp, -64]!	
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp	
	str	wzr, [sp, 28]	
	mov	w0, 200	
	str	w0, [sp, 60]	
	str	wzr, [sp, 32]	
	b	.L2		
.L16:
	str	wzr, [sp, 36]	
	b	.L3		
.L15:
	str	wzr, [sp, 40]	
	b	.L4		
.L14:
	str	wzr, [sp, 44]	
	b	.L5		
.L13:
	str	wzr, [sp, 48]	
	b	.L6		
.L12:
	str	wzr, [sp, 52]	
	b	.L7		
.L11:
	str	wzr, [sp, 56]	
	b	.L8		
.L10:
	ldr	w1, [sp, 32]	
	ldr	w0, [sp, 36]	
	add	w1, w1, w0	
	ldr	w0, [sp, 40]	
	add	w1, w1, w0	
	ldr	w0, [sp, 44]	
	add	w1, w1, w0	
	ldr	w0, [sp, 48]	
	add	w1, w1, w0	
	ldr	w0, [sp, 52]	
	add	w1, w1, w0	
	ldr	w0, [sp, 56]	
	add	w0, w1, w0	
	cmp	w0, 200	
	bgt	.L9		
	ldr	w0, [sp, 28]	
	add	w0, w0, 1	
	str	w0, [sp, 28]	
.L9:
	ldr	w0, [sp, 56]	
	add	w0, w0, 2	
	str	w0, [sp, 56]	
.L8:
	ldr	w1, [sp, 56]	
	ldr	w0, [sp, 60]	
	cmp	w1, w0	
	ble	.L10		
	ldr	w0, [sp, 52]	
	add	w0, w0, 5	
	str	w0, [sp, 52]	
.L7:
	ldr	w1, [sp, 52]	
	ldr	w0, [sp, 60]	
	cmp	w1, w0	
	ble	.L11		
	ldr	w0, [sp, 48]	
	add	w0, w0, 10	
	str	w0, [sp, 48]	
.L6:
	ldr	w1, [sp, 48]	
	ldr	w0, [sp, 60]	
	cmp	w1, w0	
	ble	.L12		
	ldr	w0, [sp, 44]	
	add	w0, w0, 20	
	str	w0, [sp, 44]	
.L5:
	ldr	w1, [sp, 44]	
	ldr	w0, [sp, 60]	
	cmp	w1, w0	
	ble	.L13		
	ldr	w0, [sp, 40]	
	add	w0, w0, 50	
	str	w0, [sp, 40]	
.L4:
	ldr	w1, [sp, 40]	
	ldr	w0, [sp, 60]	
	cmp	w1, w0	
	ble	.L14		
	ldr	w0, [sp, 36]	
	add	w0, w0, 100	
	str	w0, [sp, 36]	
.L3:
	ldr	w1, [sp, 36]	
	ldr	w0, [sp, 60]	
	cmp	w1, w0	
	ble	.L15		
	ldr	w0, [sp, 32]	
	add	w0, w0, 200	
	str	w0, [sp, 32]	
.L2:
	ldr	w1, [sp, 32]	
	ldr	w0, [sp, 60]	
	cmp	w1, w0	
	ble	.L16		
	ldr	w1, [sp, 28]	
	adrp	x0, .LC0	
	add	x0, x0, :lo12:.LC0	
	bl	printf		
	mov	w0, 0	
	ldp	x29, x30, [sp], 64	
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
