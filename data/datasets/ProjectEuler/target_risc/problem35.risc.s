	.file	"problem35.c"
	.option pic
	.text
	.section	.rodata
	.align	3
.LC1:
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
	sw	zero,-40(s0)	
	li	a5,2		
	sw	a5,-44(s0)	
	j	.L2		
.L9:
	lw	a5,-44(s0)		
	mv	a0,a5	
	call	is_prime		
	mv	a5,a0	
	beq	a5,zero,.L11	
	lw	a5,-44(s0)		
	fcvt.d.wu	fa5,a5	
	fmv.d	fa0,fa5	
	call	log10@plt	
	fmv.d	fa5,fa0	
	fcvt.wu.d a5,fa5,rtz	
	sw	a5,-28(s0)	
	lw	a5,-44(s0)		
	sw	a5,-36(s0)	
	sw	zero,-32(s0)	
	j	.L5		
.L8:
	lw	a5,-28(s0)		
	fcvt.d.wu	fa4,a5	
	lla	a5,.LC0	
	fld	fa5,0(a5)	
	fmv.d	fa1,fa4	
	fmv.d	fa0,fa5	
	call	pow@plt	
	fmv.d	fa5,fa0	
	fcvt.wu.d a5,fa5,rtz	
	sw	a5,-24(s0)	
	lw	a5,-36(s0)		
	mv	a4,a5	
	lw	a5,-24(s0)		
	remuw	a5,a4,a5	
	sw	a5,-20(s0)	
	lw	a5,-36(s0)		
	mv	a4,a5	
	lw	a5,-24(s0)		
	divuw	a5,a4,a5	
	sw	a5,-36(s0)	
	lw	a5,-20(s0)		
	mv	a4,a5	
	mv	a5,a4	
	slliw	a5,a5,2	
	addw	a5,a5,a4	
	slliw	a5,a5,1	
	sext.w	a5,a5	
	lw	a4,-36(s0)		
	addw	a5,a4,a5	
	sw	a5,-36(s0)	
	lw	a5,-36(s0)		
	mv	a0,a5	
	call	is_prime		
	mv	a5,a0	
	beq	a5,zero,.L12	
	lw	a5,-32(s0)		
	addiw	a5,a5,1	
	sw	a5,-32(s0)	
.L5:
	lw	a5,-32(s0)		
	mv	a4,a5	
	lw	a5,-28(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	bltu	a4,a5,.L8	
	lw	a5,-40(s0)		
	addiw	a5,a5,1	
	sw	a5,-40(s0)	
	j	.L4		
.L7:
.L11:
	nop	
	j	.L4		
.L12:
	nop	
.L4:
	lw	a5,-44(s0)		
	addiw	a5,a5,1	
	sw	a5,-44(s0)	
.L2:
	lw	a5,-44(s0)		
	sext.w	a4,a5	
	li	a5,999424		
	addi	a5,a5,575	
	bleu	a4,a5,.L9	
	lw	a5,-40(s0)		
	mv	a1,a5	
	lla	a0,.LC1	
	call	printf@plt	
	li	a5,0		
	mv	a0,a5	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
	.size	main, .-main
	.align	1
	.type	is_prime, @function
is_prime:
	addi	sp,sp,-48	
	sd	s0,40(sp)	
	addi	s0,sp,48	
	mv	a5,a0	
	sw	a5,-36(s0)	
	lw	a5,-36(s0)		
	sext.w	a4,a5	
	li	a5,1		
	bgtu	a4,a5,.L14	
	li	a5,0		
	j	.L15		
.L14:
	lw	a5,-36(s0)		
	sext.w	a4,a5	
	li	a5,2		
	bne	a4,a5,.L16	
	li	a5,1		
	j	.L15		
.L16:
	li	a5,2		
	sw	a5,-20(s0)	
	j	.L17		
.L19:
	lw	a5,-36(s0)		
	mv	a4,a5	
	lw	a5,-20(s0)		
	remuw	a5,a4,a5	
	sext.w	a5,a5	
	bne	a5,zero,.L18	
	li	a5,0		
	j	.L15		
.L18:
	lw	a5,-20(s0)		
	addiw	a5,a5,1	
	sw	a5,-20(s0)	
.L17:
	lw	a5,-20(s0)		
	mulw	a5,a5,a5	
	sext.w	a4,a5	
	lw	a5,-36(s0)		
	sext.w	a5,a5	
	bgeu	a5,a4,.L19	
	li	a5,1		
.L15:
	mv	a0,a5	
	ld	s0,40(sp)		
	addi	sp,sp,48	
	jr	ra		
	.size	is_prime, .-is_prime
	.section	.rodata
	.align	3
.LC0:
	.word	0
	.word	1076101120
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
