	.file	"problem14.c"
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
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sw	zero,-28(s0)	
	sw	zero,-24(s0)	
	li	a5,1		
	sw	a5,-32(s0)	
	j	.L2		
.L4:
	lw	a5,-32(s0)		
	mv	a0,a5	
	call	collatz_count		
	mv	a5,a0	
	sw	a5,-20(s0)	
	lw	a5,-20(s0)		
	mv	a4,a5	
	lw	a5,-28(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	bleu	a4,a5,.L3	
	lw	a5,-20(s0)		
	sw	a5,-28(s0)	
	lw	a5,-32(s0)		
	sw	a5,-24(s0)	
.L3:
	lw	a5,-32(s0)		
	addiw	a5,a5,1	
	sw	a5,-32(s0)	
.L2:
	lw	a5,-32(s0)		
	sext.w	a4,a5	
	li	a5,999424		
	addi	a5,a5,575	
	bleu	a4,a5,.L4	
	lw	a5,-24(s0)		
	mv	a1,a5	
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
	.type	collatz_count, @function
collatz_count:
	addi	sp,sp,-48	
	sd	s0,40(sp)	
	addi	s0,sp,48	
	mv	a5,a0	
	sw	a5,-36(s0)	
	sw	zero,-20(s0)	
	j	.L7		
.L10:
	lw	a5,-36(s0)		
	andi	a5,a5,1	
	sext.w	a5,a5	
	bne	a5,zero,.L8	
	lw	a5,-36(s0)		
	srliw	a5,a5,1	
	sext.w	a5,a5	
	j	.L9		
.L8:
	lw	a5,-36(s0)		
	mv	a4,a5	
	mv	a5,a4	
	slliw	a5,a5,1	
	addw	a5,a5,a4	
	sext.w	a5,a5	
	addiw	a5,a5,1	
	sext.w	a5,a5	
.L9:
	sw	a5,-36(s0)	
	lw	a5,-20(s0)		
	addiw	a5,a5,1	
	sw	a5,-20(s0)	
.L7:
	lw	a5,-36(s0)		
	sext.w	a4,a5	
	li	a5,1		
	bgtu	a4,a5,.L10	
	lw	a5,-20(s0)		
	addiw	a5,a5,1	
	sext.w	a5,a5	
	mv	a0,a5	
	ld	s0,40(sp)		
	addi	sp,sp,48	
	jr	ra		
	.size	collatz_count, .-collatz_count
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
