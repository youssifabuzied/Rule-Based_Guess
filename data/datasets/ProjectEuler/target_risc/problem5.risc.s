	.file	"problem5.c"
	.option pic
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%lu\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	li	a5,1		
	sd	a5,-32(s0)	
	li	a5,1		
	sd	a5,-24(s0)	
	j	.L2		
.L3:
	ld	a1,-24(s0)		
	ld	a0,-32(s0)		
	call	lcm		
	sd	a0,-32(s0)	
	ld	a5,-24(s0)		
	addi	a5,a5,1	
	sd	a5,-24(s0)	
.L2:
	ld	a4,-24(s0)		
	li	a5,20		
	bleu	a4,a5,.L3	
	ld	a1,-32(s0)		
	lla	a0,.LC0	
	call	printf@plt	
	li	a5,0		
	mv	a0,a5	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
	.size	main, .-main
	.align	1
	.type	gcd, @function
gcd:
	addi	sp,sp,-48	
	sd	s0,40(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	sd	a1,-48(s0)	
	ld	a4,-40(s0)		
	ld	a5,-48(s0)		
	bleu	a4,a5,.L7	
	ld	a5,-40(s0)		
	sd	a5,-32(s0)	
	ld	a5,-48(s0)		
	sd	a5,-40(s0)	
	ld	a5,-32(s0)		
	sd	a5,-48(s0)	
	j	.L7		
.L8:
	ld	a5,-48(s0)		
	sd	a5,-40(s0)	
	ld	a5,-24(s0)		
	sd	a5,-48(s0)	
.L7:
	ld	a4,-40(s0)		
	ld	a5,-48(s0)		
	remu	a5,a4,a5	
	sd	a5,-24(s0)	
	ld	a5,-24(s0)		
	bne	a5,zero,.L8	
	ld	a5,-48(s0)		
	mv	a0,a5	
	ld	s0,40(sp)		
	addi	sp,sp,48	
	jr	ra		
	.size	gcd, .-gcd
	.align	1
	.type	lcm, @function
lcm:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	sd	a1,-48(s0)	
	ld	a4,-40(s0)		
	ld	a5,-48(s0)		
	mul	a5,a4,a5	
	sd	a5,-24(s0)	
	ld	a1,-48(s0)		
	ld	a0,-40(s0)		
	call	gcd		
	mv	a4,a0	
	ld	a5,-24(s0)		
	divu	a5,a5,a4	
	mv	a0,a5	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
	.size	lcm, .-lcm
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
