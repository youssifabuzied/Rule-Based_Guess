	.file	"problem3.c"
	.option pic
	.text
	.section	.rodata
	.align	3
.LC1:
	.string	"%llu\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	lla	a5,.LC0	
	ld	a5,0(a5)		
	sd	a5,-32(s0)	
	li	a5,2		
	sd	a5,-24(s0)	
	j	.L2		
.L4:
	ld	a4,-32(s0)		
	ld	a5,-24(s0)		
	divu	a5,a4,a5	
	sd	a5,-32(s0)	
.L3:
	ld	a4,-32(s0)		
	ld	a5,-24(s0)		
	remu	a5,a4,a5	
	beq	a5,zero,.L4	
	ld	a5,-24(s0)		
	addi	a5,a5,1	
	sd	a5,-24(s0)	
.L2:
	ld	a4,-24(s0)		
	ld	a5,-32(s0)		
	bltu	a4,a5,.L3	
	ld	a1,-32(s0)		
	lla	a0,.LC1	
	call	printf@plt	
	li	a5,0		
	mv	a0,a5	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
	.size	main, .-main
	.section	.rodata
	.align	3
.LC0:
	.dword	600851475143
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
