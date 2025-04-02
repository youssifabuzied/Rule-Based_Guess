	.file	"problem10.c"
	.option pic
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%llu\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	li	a5,1998848		
	addi	a5,a5,1152	
	sd	a5,-32(s0)	
	sd	zero,-40(s0)	
	li	a1,1		
	ld	a0,-32(s0)		
	call	calloc@plt	
	mv	a5,a0	
	sd	a5,-24(s0)	
	li	a5,2		
	sw	a5,-48(s0)	
	j	.L2		
.L6:
	lwu	a5,-48(s0)	
	ld	a4,-24(s0)		
	add	a5,a4,a5	
	lbu	a5,0(a5)	
	bne	a5,zero,.L3	
	lwu	a5,-48(s0)	
	ld	a4,-40(s0)		
	add	a5,a4,a5	
	sd	a5,-40(s0)	
	lw	a5,-48(s0)		
	slliw	a5,a5,1	
	sw	a5,-44(s0)	
	j	.L4		
.L5:
	lwu	a5,-44(s0)	
	ld	a4,-24(s0)		
	add	a5,a4,a5	
	li	a4,1		
	sb	a4,0(a5)	
	lw	a5,-44(s0)		
	mv	a4,a5	
	lw	a5,-48(s0)		
	addw	a5,a4,a5	
	sw	a5,-44(s0)	
.L4:
	lwu	a5,-44(s0)	
	ld	a4,-32(s0)		
	bgtu	a4,a5,.L5	
.L3:
	lw	a5,-48(s0)		
	addiw	a5,a5,1	
	sw	a5,-48(s0)	
.L2:
	lwu	a5,-48(s0)	
	ld	a4,-32(s0)		
	bgtu	a4,a5,.L6	
	ld	a0,-24(s0)		
	call	free@plt	
	ld	a1,-40(s0)		
	lla	a0,.LC0	
	call	printf@plt	
	li	a5,0		
	mv	a0,a5	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
