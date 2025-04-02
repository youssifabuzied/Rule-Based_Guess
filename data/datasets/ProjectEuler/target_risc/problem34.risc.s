	.file	"problem34.c"
	.option pic
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%u"
	.align	3
.LC1:
	.string	"%u\n"
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
	sw	zero,-52(s0)	
	li	a5,3		
	sw	a5,-56(s0)	
	j	.L2		
.L6:
	sw	zero,-44(s0)	
	lw	a4,-56(s0)		
	addi	a5,s0,-40	
	mv	a3,a4	
	lla	a2,.LC0	
	li	a1,16		
	mv	a0,a5	
	call	snprintf@plt	
	sw	zero,-48(s0)	
	j	.L3		
.L4:
	lwu	a5,-48(s0)	
	addi	a5,a5,-16	
	add	a5,a5,s0	
	lbu	a5,-24(a5)	
	sext.w	a5,a5	
	addiw	a5,a5,-48	
	sext.w	a5,a5	
	sext.w	a5,a5	
	mv	a0,a5	
	call	fact		
	mv	a5,a0	
	sext.w	a5,a5	
	lw	a4,-44(s0)		
	addw	a5,a4,a5	
	sw	a5,-44(s0)	
	lw	a5,-48(s0)		
	addiw	a5,a5,1	
	sw	a5,-48(s0)	
.L3:
	lwu	a5,-48(s0)	
	addi	a5,a5,-16	
	add	a5,a5,s0	
	lbu	a5,-24(a5)	
	bne	a5,zero,.L4	
	lw	a5,-56(s0)		
	mv	a4,a5	
	lw	a5,-44(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	bne	a4,a5,.L5	
	lw	a5,-52(s0)		
	mv	a4,a5	
	lw	a5,-44(s0)		
	addw	a5,a4,a5	
	sw	a5,-52(s0)	
.L5:
	lw	a5,-56(s0)		
	addiw	a5,a5,1	
	sw	a5,-56(s0)	
.L2:
	lw	a5,-56(s0)		
	sext.w	a4,a5	
	li	a5,98304		
	addi	a5,a5,1695	
	bleu	a4,a5,.L6	
	lw	a5,-52(s0)		
	mv	a1,a5	
	lla	a0,.LC1	
	call	printf@plt	
	li	a5,0		
	mv	a4,a5	
	la	a5,__stack_chk_guard		
	ld	a3, -24(s0)	
	ld	a5, 0(a5)	
	xor	a5, a3, a5	
	li	a3, 0	
	beq	a5,zero,.L8	
	call	__stack_chk_fail@plt	
.L8:
	mv	a0,a4	
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	addi	sp,sp,64	
	jr	ra		
	.size	main, .-main
	.align	1
	.globl	fact
	.type	fact, @function
fact:
	addi	sp,sp,-48	
	sd	s0,40(sp)	
	addi	s0,sp,48	
	mv	a5,a0	
	sw	a5,-36(s0)	
	li	a5,1		
	sw	a5,-20(s0)	
	j	.L10		
.L11:
	lw	a5,-36(s0)		
	addiw	a4,a5,-1	
	sw	a4,-36(s0)	
	sext.w	a5,a5	
	lw	a4,-20(s0)		
	mulw	a5,a4,a5	
	sw	a5,-20(s0)	
.L10:
	lw	a5,-36(s0)		
	sext.w	a5,a5	
	bne	a5,zero,.L11	
	lw	a5,-20(s0)		
	mv	a0,a5	
	ld	s0,40(sp)		
	addi	sp,sp,48	
	jr	ra		
	.size	fact, .-fact
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
