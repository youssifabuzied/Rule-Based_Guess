	.file	"problem38.c"
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
	addi	sp,sp,-96	
	sd	ra,88(sp)	
	sd	s0,80(sp)	
	sd	s1,72(sp)	
	addi	s0,sp,96	
	la	a5,__stack_chk_guard		
	ld	a4, 0(a5)	
	sd	a4, -40(s0)	
	li	a4, 0	
	sw	zero,-88(s0)	
	li	a5,1		
	sw	a5,-84(s0)	
	j	.L2		
.L7:
	sd	zero,-72(s0)	
	sh	zero,-64(s0)	
	lw	a4,-84(s0)		
	addi	a5,s0,-72	
	mv	a3,a4	
	lla	a2,.LC0	
	li	a1,10		
	mv	a0,a5	
	call	snprintf@plt	
	li	a5,2		
	sw	a5,-80(s0)	
.L6:
	sd	zero,-56(s0)	
	sh	zero,-48(s0)	
	lw	a5,-84(s0)		
	mv	a4,a5	
	lw	a5,-80(s0)		
	mulw	a5,a4,a5	
	sext.w	a4,a5	
	addi	a5,s0,-56	
	mv	a3,a4	
	lla	a2,.LC0	
	li	a1,10		
	mv	a0,a5	
	call	snprintf@plt	
	addi	a5,s0,-72	
	mv	a0,a5	
	call	strlen@plt	
	mv	s1,a0	
	addi	a5,s0,-56	
	mv	a0,a5	
	call	strlen@plt	
	mv	a5,a0	
	add	a4,s1,a5	
	li	a5,9		
	bleu	a4,a5,.L3	
	addi	a5,s0,-72	
	mv	a0,a5	
	call	is_pandigital		
	mv	a5,a0	
	bne	a5,zero,.L4	
	j	.L5		
.L3:
	addi	a5,s0,-72	
	mv	a0,a5	
	call	strlen@plt	
	mv	a4,a0	
	li	a5,10		
	sub	a3,a5,a4	
	addi	a4,s0,-56	
	addi	a5,s0,-72	
	mv	a2,a3	
	mv	a1,a4	
	mv	a0,a5	
	call	strncat@plt	
	lw	a5,-80(s0)		
	addiw	a5,a5,1	
	sw	a5,-80(s0)	
	j	.L6		
.L4:
	addi	a5,s0,-72	
	li	a2,10		
	li	a1,0		
	mv	a0,a5	
	call	strtoul@plt	
	mv	a5,a0	
	sw	a5,-76(s0)	
	lw	a5,-76(s0)		
	mv	a4,a5	
	lw	a5,-88(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	bleu	a4,a5,.L5	
	lw	a5,-76(s0)		
	sw	a5,-88(s0)	
.L5:
	lw	a5,-84(s0)		
	addiw	a5,a5,1	
	sw	a5,-84(s0)	
.L2:
	lw	a5,-84(s0)		
	sext.w	a4,a5	
	li	a5,8192		
	addi	a5,a5,1807	
	bleu	a4,a5,.L7	
	lw	a5,-88(s0)		
	mv	a1,a5	
	lla	a0,.LC1	
	call	printf@plt	
	li	a5,0		
	mv	a4,a5	
	la	a5,__stack_chk_guard		
	ld	a3, -40(s0)	
	ld	a5, 0(a5)	
	xor	a5, a3, a5	
	li	a3, 0	
	beq	a5,zero,.L9	
	call	__stack_chk_fail@plt	
.L9:
	mv	a0,a4	
	ld	ra,88(sp)		
	ld	s0,80(sp)		
	ld	s1,72(sp)		
	addi	sp,sp,96	
	jr	ra		
	.size	main, .-main
	.align	1
	.type	compare, @function
compare:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	sd	a1,-32(s0)	
	ld	a5,-24(s0)		
	lbu	a5,0(a5)	
	sext.w	a4,a5	
	ld	a5,-32(s0)		
	lbu	a5,0(a5)	
	sext.w	a5,a5	
	subw	a5,a4,a5	
	sext.w	a5,a5	
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
	.size	compare, .-compare
	.align	1
	.type	is_pandigital, @function
is_pandigital:
	addi	sp,sp,-80	
	sd	ra,72(sp)	
	sd	s0,64(sp)	
	addi	s0,sp,80	
	sd	a0,-72(s0)	
	la	a5,__stack_chk_guard		
	ld	a4, 0(a5)	
	sd	a4, -24(s0)	
	li	a4, 0	
	ld	a0,-72(s0)		
	call	strlen@plt	
	sd	a0,-48(s0)	
	ld	a4,-48(s0)		
	li	a5,9		
	beq	a4,a5,.L13	
	li	a5,0		
	j	.L18		
.L13:
	addi	a5,s0,-40	
	li	a2,10		
	ld	a1,-72(s0)		
	mv	a0,a5	
	call	strncpy@plt	
	addi	a5,s0,-40	
	lla	a3,compare	
	li	a2,1		
	ld	a1,-48(s0)		
	mv	a0,a5	
	call	qsort@plt	
	sd	zero,-56(s0)	
	j	.L15		
.L17:
	ld	a5,-56(s0)		
	addi	a5,a5,-16	
	add	a5,a5,s0	
	lbu	a5,-24(a5)	
	mv	a4,a5	
	ld	a5,-56(s0)		
	addi	a5,a5,49	
	beq	a4,a5,.L16	
	li	a5,0		
	j	.L18		
.L16:
	ld	a5,-56(s0)		
	addi	a5,a5,1	
	sd	a5,-56(s0)	
.L15:
	ld	a4,-56(s0)		
	ld	a5,-48(s0)		
	bltu	a4,a5,.L17	
	li	a5,1		
.L18:
	mv	a4,a5	
	la	a5,__stack_chk_guard		
	ld	a3, -24(s0)	
	ld	a5, 0(a5)	
	xor	a5, a3, a5	
	li	a3, 0	
	beq	a5,zero,.L19	
	call	__stack_chk_fail@plt	
.L19:
	mv	a0,a4	
	ld	ra,72(sp)		
	ld	s0,64(sp)		
	addi	sp,sp,80	
	jr	ra		
	.size	is_pandigital, .-is_pandigital
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
