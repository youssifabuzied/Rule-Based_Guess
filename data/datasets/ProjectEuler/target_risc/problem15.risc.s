	.file	"problem15.c"
	.option pic
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64	
	sd	ra,56(sp)	
	sd	s0,48(sp)	
	addi	s0,sp,64	
	la	a5,__stack_chk_guard		
	ld	a4, 0(a5)	
	sd	a4, -24(s0)	
	li	a4, 0	
	addi	a5,s0,-56	
	mv	a0,a5	
	call	__gmpz_init@plt	
	addi	a5,s0,-40	
	mv	a0,a5	
	call	__gmpz_init@plt	
	addi	a5,s0,-56	
	li	a1,40		
	mv	a0,a5	
	call	__gmpz_fac_ui@plt	
	addi	a5,s0,-40	
	li	a1,20		
	mv	a0,a5	
	call	__gmpz_fac_ui@plt	
	addi	a3,s0,-40	
	addi	a4,s0,-40	
	addi	a5,s0,-40	
	mv	a2,a3	
	mv	a1,a4	
	mv	a0,a5	
	call	__gmpz_mul@plt	
	addi	a3,s0,-40	
	addi	a4,s0,-56	
	addi	a5,s0,-56	
	mv	a2,a3	
	mv	a1,a4	
	mv	a0,a5	
	call	__gmpz_divexact@plt	
	la	a5,stdout		
	ld	a5,0(a5)		
	addi	a4,s0,-56	
	mv	a2,a4	
	li	a1,10		
	mv	a0,a5	
	call	__gmpz_out_str@plt	
	li	a0,10		
	call	putchar@plt	
	addi	a5,s0,-56	
	mv	a0,a5	
	call	__gmpz_clear@plt	
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
	beq	a5,zero,.L3	
	call	__stack_chk_fail@plt	
.L3:
	mv	a0,a4	
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	addi	sp,sp,64	
	jr	ra		
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
