	.file	"problem37.c"
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
	sw	zero,-32(s0)	
	sw	zero,-28(s0)	
	li	a5,10		
	sw	a5,-36(s0)	
	j	.L2		
.L10:
	lw	a5,-36(s0)		
	sw	a5,-24(s0)	
	j	.L3		
.L6:
	lw	a5,-24(s0)		
	mv	a0,a5	
	call	is_prime		
	mv	a5,a0	
	beq	a5,zero,.L12	
	lw	a5,-24(s0)		
	mv	a4,a5	
	li	a5,10		
	divuw	a5,a4,a5	
	sw	a5,-24(s0)	
.L3:
	lw	a5,-24(s0)		
	sext.w	a5,a5	
	bne	a5,zero,.L6	
	lw	a5,-36(s0)		
	sw	a5,-24(s0)	
	lw	a5,-24(s0)		
	fcvt.d.wu	fa5,a5	
	fmv.d	fa0,fa5	
	call	log10@plt	
	fmv.d	fa5,fa0	
	fcvt.wu.d a5,fa5,rtz	
	sw	a5,-20(s0)	
	lw	a5,-20(s0)		
	fcvt.d.wu	fa4,a5	
	lla	a5,.LC0	
	fld	fa5,0(a5)	
	fmv.d	fa1,fa4	
	fmv.d	fa0,fa5	
	call	pow@plt	
	fmv.d	fa5,fa0	
	fcvt.wu.d a5,fa5,rtz	
	sw	a5,-20(s0)	
	j	.L7		
.L9:
	lw	a5,-24(s0)		
	mv	a4,a5	
	lw	a5,-20(s0)		
	remuw	a5,a4,a5	
	sext.w	a5,a5	
	mv	a0,a5	
	call	is_prime		
	mv	a5,a0	
	beq	a5,zero,.L13	
	lw	a5,-20(s0)		
	mv	a4,a5	
	li	a5,10		
	divuw	a5,a4,a5	
	sw	a5,-20(s0)	
.L7:
	lw	a5,-20(s0)		
	sext.w	a4,a5	
	li	a5,1		
	bne	a4,a5,.L9	
	lw	a5,-28(s0)		
	mv	a4,a5	
	lw	a5,-36(s0)		
	addw	a5,a4,a5	
	sw	a5,-28(s0)	
	lw	a5,-32(s0)		
	addiw	a5,a5,1	
	sw	a5,-32(s0)	
	j	.L5		
.L12:
	nop	
	j	.L5		
.L13:
	nop	
.L5:
	lw	a5,-36(s0)		
	addiw	a5,a5,1	
	sw	a5,-36(s0)	
.L2:
	lw	a5,-32(s0)		
	sext.w	a4,a5	
	li	a5,10		
	bleu	a4,a5,.L10	
	lw	a5,-28(s0)		
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
	bgtu	a4,a5,.L15	
	li	a5,0		
	j	.L16		
.L15:
	lw	a5,-36(s0)		
	sext.w	a4,a5	
	li	a5,2		
	bne	a4,a5,.L17	
	li	a5,1		
	j	.L16		
.L17:
	li	a5,2		
	sw	a5,-20(s0)	
	j	.L18		
.L20:
	lw	a5,-36(s0)		
	mv	a4,a5	
	lw	a5,-20(s0)		
	remuw	a5,a4,a5	
	sext.w	a5,a5	
	bne	a5,zero,.L19	
	li	a5,0		
	j	.L16		
.L19:
	lw	a5,-20(s0)		
	addiw	a5,a5,1	
	sw	a5,-20(s0)	
.L18:
	lw	a5,-20(s0)		
	mulw	a5,a5,a5	
	sext.w	a4,a5	
	lw	a5,-36(s0)		
	sext.w	a5,a5	
	bgeu	a5,a4,.L20	
	li	a5,1		
.L16:
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
