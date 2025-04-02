	.file	"problem16.c"
	.option pic
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%u\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-80	
	sd	ra,72(sp)	
	sd	s0,64(sp)	
	addi	s0,sp,80	
	la	a5,__stack_chk_guard		
	ld	a4, 0(a5)	
	sd	a4, -24(s0)	
	li	a4, 0	
	sw	zero,-68(s0)	
	addi	a5,s0,-40	
	mv	a0,a5	
	call	__gmpz_init@plt	
	addi	a5,s0,-40	
	li	a2,1000		
	li	a1,2		
	mv	a0,a5	
	call	__gmpz_ui_pow_ui@plt	
	addi	a5,s0,-40	
	mv	a2,a5	
	li	a1,10		
	li	a0,0		
	call	__gmpz_get_str@plt	
	sd	a0,-56(s0)	
	addi	a5,s0,-40	
	li	a1,10		
	mv	a0,a5	
	call	__gmpz_sizeinbase@plt	
	sd	a0,-48(s0)	
	sd	zero,-64(s0)	
	j	.L2		
.L3:
	ld	a4,-56(s0)		
	ld	a5,-64(s0)		
	add	a5,a4,a5	
	lbu	a5,0(a5)	
	sext.w	a5,a5	
	lw	a4,-68(s0)		
	addw	a5,a4,a5	
	sext.w	a5,a5	
	addiw	a5,a5,-48	
	sw	a5,-68(s0)	
	ld	a5,-64(s0)		
	addi	a5,a5,1	
	sd	a5,-64(s0)	
.L2:
	ld	a4,-64(s0)		
	ld	a5,-48(s0)		
	bltu	a4,a5,.L3	
	lw	a5,-68(s0)		
	mv	a1,a5	
	lla	a0,.LC0	
	call	printf@plt	
	ld	a0,-56(s0)		
	call	free@plt	
	addi	a5,s0,-40	
	mv	a0,a5	
	call	__gmpz_clear@plt	
	li	a5,0		
	mv	a4,a5	
	la	a5,__stack_chk_guard		
	ld	a3, -24(s0)	
	ld	a5, 0(a5)	
	xor	a5, a3, a5	
	li	a3, 0	
	beq	a5,zero,.L5	
	call	__stack_chk_fail@plt	
.L5:
	mv	a0,a4	
	ld	ra,72(sp)		
	ld	s0,64(sp)		
	addi	sp,sp,80	
	jr	ra		
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
