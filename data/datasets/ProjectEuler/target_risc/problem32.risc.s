	.file	"problem32.c"
	.option pic
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%d%d%d"
	.align	3
.LC1:
	.string	"%d\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-80	
	sd	ra,72(sp)	
	sd	s0,64(sp)	
	sd	s1,56(sp)	
	addi	s0,sp,80	
	la	a5,__stack_chk_guard		
	ld	a4, 0(a5)	
	sd	a4, -40(s0)	
	li	a4, 0	
	sw	zero,-68(s0)	
	li	a5,1111		
	sw	a5,-76(s0)	
	j	.L2		
.L9:
	li	a5,2		
	sw	a5,-72(s0)	
	j	.L3		
.L8:
	lw	a5,-76(s0)		
	mv	a4,a5	
	lw	a5,-72(s0)		
	remw	a5,a4,a5	
	sw	a5,-64(s0)	
	lw	a5,-64(s0)		
	sext.w	a5,a5	
	bne	a5,zero,.L12	
	lw	a5,-76(s0)		
	mv	a4,a5	
	lw	a5,-72(s0)		
	divw	a5,a4,a5	
	sw	a5,-60(s0)	
	lw	a5,-72(s0)		
	fcvt.d.w	fa5,a5	
	fmv.d	fa0,fa5	
	call	log10@plt	
	fmv.x.d	a5,fa0	
	fmv.d.x	fa0,a5	
	call	floor@plt	
	fmv.d	fa5,fa0	
	fcvt.l.d s1,fa5,rtz	
	lw	a5,-60(s0)		
	fcvt.d.w	fa5,a5	
	fmv.d	fa0,fa5	
	call	log10@plt	
	fmv.x.d	a5,fa0	
	fmv.d.x	fa0,a5	
	call	floor@plt	
	fmv.d	fa5,fa0	
	fcvt.l.d a5,fa5,rtz	
	add	s1,s1,a5	
	lw	a5,-76(s0)		
	fcvt.d.w	fa5,a5	
	fmv.d	fa0,fa5	
	call	log10@plt	
	fmv.x.d	a5,fa0	
	fmv.d.x	fa0,a5	
	call	floor@plt	
	fmv.d	fa5,fa0	
	fcvt.l.d a5,fa5,rtz	
	add	a4,s1,a5	
	li	a5,6		
	bne	a4,a5,.L13	
	lw	a5,-76(s0)		
	lw	a4,-60(s0)		
	lw	a3,-72(s0)		
	addi	a0,s0,-56	
	lla	a2,.LC0	
	li	a1,10		
	call	snprintf@plt	
	addi	a5,s0,-56	
	mv	a0,a5	
	call	is_pandigital		
	mv	a5,a0	
	beq	a5,zero,.L5	
	lw	a5,-68(s0)		
	mv	a4,a5	
	lw	a5,-76(s0)		
	addw	a5,a4,a5	
	sw	a5,-68(s0)	
	j	.L7		
.L12:
	nop	
	j	.L5		
.L13:
	nop	
.L5:
	lw	a5,-72(s0)		
	addiw	a5,a5,1	
	sw	a5,-72(s0)	
.L3:
	lw	a5,-72(s0)		
	mulw	a5,a5,a5	
	sext.w	a4,a5	
	lw	a5,-76(s0)		
	sext.w	a5,a5	
	bgt	a5,a4,.L8	
.L7:
	lw	a5,-76(s0)		
	addiw	a5,a5,1	
	sw	a5,-76(s0)	
.L2:
	lw	a5,-76(s0)		
	sext.w	a4,a5	
	li	a5,98304		
	addi	a5,a5,1695	
	ble	a4,a5,.L9	
	lw	a5,-68(s0)		
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
	beq	a5,zero,.L11	
	call	__stack_chk_fail@plt	
.L11:
	mv	a0,a4	
	ld	ra,72(sp)		
	ld	s0,64(sp)		
	ld	s1,56(sp)		
	addi	sp,sp,80	
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
	.section	.rodata
	.align	3
.LC2:
	.string	"123456789"
	.text
	.align	1
	.type	is_pandigital, @function
is_pandigital:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	lla	a3,compare	
	li	a2,1		
	li	a1,9		
	ld	a0,-24(s0)		
	call	qsort@plt	
	li	a2,9		
	lla	a1,.LC2	
	ld	a0,-24(s0)		
	call	memcmp@plt	
	mv	a5,a0	
	seqz	a5,a5	
	andi	a5,a5,0xff	
	sext.w	a5,a5	
	mv	a0,a5	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
	.size	is_pandigital, .-is_pandigital
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
