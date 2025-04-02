	.file	"problem44.c"
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
	li	a5,-1		
	sw	a5,-28(s0)	
	li	a5,1		
	sw	a5,-36(s0)	
	j	.L2		
.L6:
	lw	a5,-36(s0)		
	sw	a5,-32(s0)	
	j	.L3		
.L5:
	lw	a5,-36(s0)		
	mv	a0,a5	
	call	pentagonal		
	mv	a5,a0	
	sw	a5,-24(s0)	
	lw	a5,-32(s0)		
	mv	a0,a5	
	call	pentagonal		
	mv	a5,a0	
	sw	a5,-20(s0)	
	lw	a5,-24(s0)		
	mv	a4,a5	
	lw	a5,-20(s0)		
	addw	a5,a4,a5	
	sext.w	a5,a5	
	mv	a0,a5	
	call	is_pentagonal		
	mv	a5,a0	
	beq	a5,zero,.L4	
	lw	a5,-20(s0)		
	mv	a4,a5	
	lw	a5,-24(s0)		
	subw	a5,a4,a5	
	sext.w	a5,a5	
	mv	a0,a5	
	call	is_pentagonal		
	mv	a5,a0	
	beq	a5,zero,.L4	
	lw	a5,-20(s0)		
	mv	a4,a5	
	lw	a5,-24(s0)		
	subw	a5,a4,a5	
	sext.w	a4,a5	
	lw	a5,-28(s0)		
	sext.w	a5,a5	
	bleu	a5,a4,.L4	
	lw	a5,-20(s0)		
	mv	a4,a5	
	lw	a5,-24(s0)		
	subw	a5,a4,a5	
	sw	a5,-28(s0)	
.L4:
	lw	a5,-32(s0)		
	addiw	a5,a5,1	
	sw	a5,-32(s0)	
.L3:
	lw	a5,-32(s0)		
	sext.w	a4,a5	
	li	a5,8192		
	addi	a5,a5,1807	
	bleu	a4,a5,.L5	
	lw	a5,-36(s0)		
	addiw	a5,a5,1	
	sw	a5,-36(s0)	
.L2:
	lw	a5,-36(s0)		
	sext.w	a4,a5	
	li	a5,8192		
	addi	a5,a5,1807	
	bleu	a4,a5,.L6	
	lw	a5,-28(s0)		
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
	.align	1
	.type	pentagonal, @function
pentagonal:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	mv	a5,a0	
	sw	a5,-20(s0)	
	lw	a5,-20(s0)		
	mv	a4,a5	
	mv	a5,a4	
	slliw	a5,a5,1	
	addw	a5,a5,a4	
	sext.w	a5,a5	
	addiw	a5,a5,-1	
	sext.w	a5,a5	
	lw	a4,-20(s0)		
	mulw	a5,a4,a5	
	sext.w	a5,a5	
	srliw	a5,a5,1	
	sext.w	a5,a5	
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
	.size	pentagonal, .-pentagonal
	.align	1
	.type	is_pentagonal, @function
is_pentagonal:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	mv	a5,a0	
	sw	a5,-36(s0)	
	lw	a5,-36(s0)		
	mv	a4,a5	
	mv	a5,a4	
	slliw	a5,a5,1	
	addw	a5,a5,a4	
	slliw	a5,a5,3	
	sext.w	a5,a5	
	addiw	a5,a5,1	
	sext.w	a5,a5	
	fcvt.d.wu	fa5,a5	
	fmv.d	fa0,fa5	
	call	sqrt@plt	
	fmv.d	fa5,fa0	
	fcvt.wu.d a5,fa5,rtz	
	sw	a5,-20(s0)	
	lw	a5,-20(s0)		
	mulw	a5,a5,a5	
	sext.w	a3,a5	
	lw	a5,-36(s0)		
	mv	a4,a5	
	mv	a5,a4	
	slliw	a5,a5,1	
	addw	a5,a5,a4	
	slliw	a5,a5,3	
	sext.w	a5,a5	
	addiw	a5,a5,1	
	sext.w	a5,a5	
	mv	a4,a3	
	bne	a4,a5,.L11	
	lw	a5,-20(s0)		
	addiw	a5,a5,1	
	sext.w	a5,a5	
	mv	a4,a5	
	li	a5,6		
	remuw	a5,a4,a5	
	sext.w	a5,a5	
	bne	a5,zero,.L11	
	li	a5,1		
	j	.L12		
.L11:
	li	a5,0		
.L12:
	mv	a0,a5	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
	.size	is_pentagonal, .-is_pentagonal
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
