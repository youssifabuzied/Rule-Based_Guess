	.file	"problem39.c"
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
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sw	zero,-28(s0)	
	sw	zero,-24(s0)	
	li	a5,1		
	sw	a5,-36(s0)	
	j	.L2		
.L9:
	sw	zero,-32(s0)	
	li	a5,1		
	sw	a5,-44(s0)	
	j	.L3		
.L7:
	lw	a5,-44(s0)		
	sw	a5,-40(s0)	
	j	.L4		
.L6:
	lw	a5,-36(s0)		
	mv	a4,a5	
	lw	a5,-44(s0)		
	subw	a5,a4,a5	
	sext.w	a5,a5	
	lw	a4,-40(s0)		
	subw	a5,a5,a4	
	sw	a5,-20(s0)	
	lw	a5,-44(s0)		
	mulw	a5,a5,a5	
	sext.w	a4,a5	
	lw	a5,-40(s0)		
	mulw	a5,a5,a5	
	sext.w	a5,a5	
	addw	a5,a4,a5	
	sext.w	a4,a5	
	lw	a5,-20(s0)		
	mulw	a5,a5,a5	
	sext.w	a5,a5	
	bne	a4,a5,.L5	
	lw	a5,-32(s0)		
	addiw	a5,a5,1	
	sw	a5,-32(s0)	
.L5:
	lw	a5,-40(s0)		
	addiw	a5,a5,1	
	sw	a5,-40(s0)	
.L4:
	lw	a5,-36(s0)		
	srliw	a5,a5,1	
	sext.w	a4,a5	
	lw	a5,-40(s0)		
	sext.w	a5,a5	
	bltu	a5,a4,.L6	
	lw	a5,-44(s0)		
	addiw	a5,a5,1	
	sw	a5,-44(s0)	
.L3:
	lw	a5,-36(s0)		
	srliw	a5,a5,1	
	sext.w	a4,a5	
	lw	a5,-44(s0)		
	sext.w	a5,a5	
	bltu	a5,a4,.L7	
	lw	a5,-32(s0)		
	mv	a4,a5	
	lw	a5,-28(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	bleu	a4,a5,.L8	
	lw	a5,-32(s0)		
	sw	a5,-28(s0)	
	lw	a5,-36(s0)		
	sw	a5,-24(s0)	
.L8:
	lw	a5,-36(s0)		
	addiw	a5,a5,1	
	sw	a5,-36(s0)	
.L2:
	lw	a5,-36(s0)		
	sext.w	a4,a5	
	li	a5,1000		
	bleu	a4,a5,.L9	
	lw	a5,-24(s0)		
	mv	a1,a5	
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
