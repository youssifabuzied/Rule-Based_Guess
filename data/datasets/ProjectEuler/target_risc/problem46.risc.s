	.file	"problem46.c"
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
	li	a5,8192		
	addi	a0,a5,1808	
	call	prime_sieve		
	sd	a0,-32(s0)	
	li	a5,40960		
	addi	a0,a5,-960	
	call	malloc@plt	
	mv	a5,a0	
	sd	a5,-24(s0)	
	sw	zero,-40(s0)	
	sw	zero,-44(s0)	
	j	.L2		
.L4:
	lwu	a5,-44(s0)	
	ld	a4,-32(s0)		
	add	a5,a4,a5	
	lbu	a5,0(a5)	
	bne	a5,zero,.L3	
	lw	a5,-40(s0)		
	addiw	a4,a5,1	
	sw	a4,-40(s0)	
	slli	a5,a5,32	
	srli	a5,a5,32	
	slli	a5,a5,2	
	ld	a4,-24(s0)		
	add	a5,a4,a5	
	lw	a4,-44(s0)		
	sw	a4,0(a5)	
.L3:
	lw	a5,-44(s0)		
	addiw	a5,a5,1	
	sw	a5,-44(s0)	
.L2:
	lw	a5,-44(s0)		
	sext.w	a4,a5	
	li	a5,8192		
	addi	a5,a5,1807	
	bleu	a4,a5,.L4	
	lwu	a5,-40(s0)	
	slli	a5,a5,2	
	ld	a4,-24(s0)		
	add	a5,a4,a5	
	sw	zero,0(a5)	
	li	a5,3		
	sw	a5,-44(s0)	
	j	.L5		
.L13:
	lwu	a5,-44(s0)	
	ld	a4,-32(s0)		
	add	a5,a4,a5	
	lbu	a5,0(a5)	
	beq	a5,zero,.L15	
	sw	zero,-40(s0)	
	j	.L8		
.L12:
	lwu	a5,-40(s0)	
	slli	a5,a5,2	
	ld	a4,-24(s0)		
	add	a5,a4,a5	
	lw	a4,0(a5)		
	lw	a5,-44(s0)		
	sext.w	a5,a5	
	bgeu	a5,a4,.L9	
	lw	a5,-44(s0)		
	mv	a1,a5	
	lla	a0,.LC0	
	call	printf@plt	
	j	.L10		
.L9:
	lwu	a5,-40(s0)	
	slli	a5,a5,2	
	ld	a4,-24(s0)		
	add	a5,a4,a5	
	lw	a5,0(a5)		
	lw	a4,-44(s0)		
	subw	a5,a4,a5	
	sext.w	a5,a5	
	srliw	a5,a5,1	
	sw	a5,-36(s0)	
	lw	a5,-36(s0)		
	mv	a0,a5	
	call	is_square		
	mv	a5,a0	
	bne	a5,zero,.L16	
	lw	a5,-40(s0)		
	addiw	a5,a5,1	
	sw	a5,-40(s0)	
.L8:
	lwu	a5,-40(s0)	
	slli	a5,a5,2	
	ld	a4,-24(s0)		
	add	a5,a4,a5	
	lw	a5,0(a5)		
	bne	a5,zero,.L12	
	j	.L7		
.L15:
	nop	
	j	.L7		
.L16:
	nop	
.L7:
	lw	a5,-44(s0)		
	addiw	a5,a5,2	
	sw	a5,-44(s0)	
.L5:
	lw	a5,-44(s0)		
	sext.w	a4,a5	
	li	a5,8192		
	addi	a5,a5,1807	
	bleu	a4,a5,.L13	
	nop	
.L10:
	ld	a0,-32(s0)		
	call	free@plt	
	ld	a0,-24(s0)		
	call	free@plt	
	li	a5,0		
	mv	a0,a5	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
	.size	main, .-main
	.align	1
	.type	prime_sieve, @function
prime_sieve:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	mv	a5,a0	
	sw	a5,-36(s0)	
	lwu	a5,-36(s0)	
	li	a1,1		
	mv	a0,a5	
	call	calloc@plt	
	mv	a5,a0	
	sd	a5,-24(s0)	
	ld	a5,-24(s0)		
	addi	a5,a5,1	
	li	a4,1		
	sb	a4,0(a5)	
	lbu	a4,0(a5)	
	ld	a5,-24(s0)		
	sb	a4,0(a5)	
	li	a5,2		
	sw	a5,-32(s0)	
	j	.L18		
.L22:
	lwu	a5,-32(s0)	
	ld	a4,-24(s0)		
	add	a5,a4,a5	
	lbu	a5,0(a5)	
	bne	a5,zero,.L19	
	lw	a5,-32(s0)		
	slliw	a5,a5,1	
	sw	a5,-28(s0)	
	j	.L20		
.L21:
	lwu	a5,-28(s0)	
	ld	a4,-24(s0)		
	add	a5,a4,a5	
	li	a4,1		
	sb	a4,0(a5)	
	lw	a5,-28(s0)		
	mv	a4,a5	
	lw	a5,-32(s0)		
	addw	a5,a4,a5	
	sw	a5,-28(s0)	
.L20:
	lw	a5,-28(s0)		
	mv	a4,a5	
	lw	a5,-36(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	bltu	a4,a5,.L21	
.L19:
	lw	a5,-32(s0)		
	addiw	a5,a5,1	
	sw	a5,-32(s0)	
.L18:
	lw	a5,-32(s0)		
	mv	a4,a5	
	lw	a5,-36(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	bltu	a4,a5,.L22	
	ld	a5,-24(s0)		
	mv	a0,a5	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
	.size	prime_sieve, .-prime_sieve
	.align	1
	.type	is_square, @function
is_square:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	mv	a5,a0	
	sw	a5,-36(s0)	
	lw	a5,-36(s0)		
	fcvt.d.wu	fa5,a5	
	fmv.d	fa0,fa5	
	call	sqrt@plt	
	fmv.d	fa5,fa0	
	fcvt.wu.d a5,fa5,rtz	
	sw	a5,-20(s0)	
	lw	a5,-20(s0)		
	mulw	a5,a5,a5	
	sext.w	a4,a5	
	lw	a5,-36(s0)		
	sext.w	a5,a5	
	sub	a5,a5,a4	
	seqz	a5,a5	
	andi	a5,a5,0xff	
	sext.w	a5,a5	
	mv	a0,a5	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
	.size	is_square, .-is_square
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
