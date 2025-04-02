	.file	"problem40.c"
	.option pic
	.text
	.section	.rodata
	.align	3
.LC2:
	.string	"%d\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-96	
	sd	ra,88(sp)	
	sd	s0,80(sp)	
	fsd	fs0,72(sp)	
	addi	s0,sp,96	
	la	a5,__stack_chk_guard		
	ld	a4, 0(a5)	
	sd	a4, -40(s0)	
	li	a4, 0	
	li	a5,1		
	sw	a5,-96(s0)	
	li	a5,1		
	sw	a5,-84(s0)	
	li	a5,1		
	sw	a5,-92(s0)	
	sw	zero,-88(s0)	
	j	.L2		
.L6:
	lw	a5,-92(s0)		
	fcvt.d.w	fa5,a5	
	fmv.d	fa0,fa5	
	call	log10@plt	
	fmv.d	fa4,fa0	
	lla	a5,.LC0	
	fld	fa5,0(a5)	
	fadd.d	fa5,fa4,fa5	
	fcvt.w.d a5,fa5,rtz	
	sw	a5,-76(s0)	
	sw	zero,-80(s0)	
	j	.L3		
.L5:
	lw	a5,-96(s0)		
	fcvt.d.w	fs0,a5	
	lw	a5,-88(s0)		
	fcvt.d.w	fa4,a5	
	lla	a5,.LC1	
	fld	fa5,0(a5)	
	fmv.d	fa1,fa4	
	fmv.d	fa0,fa5	
	call	pow@plt	
	fmv.d	fa5,fa0	
	feq.d	a5,fs0,fa5	
	beq	a5,zero,.L4	
	lw	a5,-76(s0)		
	mv	a4,a5	
	lw	a5,-80(s0)		
	subw	a5,a4,a5	
	sext.w	a5,a5	
	addiw	a5,a5,-1	
	sext.w	a5,a5	
	fcvt.d.w	fa4,a5	
	lla	a5,.LC1	
	fld	fa5,0(a5)	
	fmv.d	fa1,fa4	
	fmv.d	fa0,fa5	
	call	pow@plt	
	fmv.d	fa5,fa0	
	fcvt.w.d a5,fa5,rtz	
	sext.w	a5,a5	
	lw	a4,-92(s0)		
	divw	a5,a4,a5	
	sext.w	a3,a5	
	lw	a5,-88(s0)		
	addiw	a4,a5,1	
	sw	a4,-88(s0)	
	li	a4,10		
	remw	a4,a3,a4	
	sext.w	a4,a4	
	slli	a5,a5,2	
	addi	a5,a5,-32	
	add	a5,a5,s0	
	sw	a4,-40(a5)	
.L4:
	lw	a5,-80(s0)		
	addiw	a5,a5,1	
	sw	a5,-80(s0)	
	lw	a5,-96(s0)		
	addiw	a5,a5,1	
	sw	a5,-96(s0)	
.L3:
	lw	a5,-80(s0)		
	mv	a4,a5	
	lw	a5,-76(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	blt	a4,a5,.L5	
	lw	a5,-92(s0)		
	addiw	a5,a5,1	
	sw	a5,-92(s0)	
.L2:
	lw	a5,-88(s0)		
	sext.w	a4,a5	
	li	a5,6		
	ble	a4,a5,.L6	
	sw	zero,-92(s0)	
	j	.L7		
.L8:
	lw	a5,-92(s0)		
	slli	a5,a5,2	
	addi	a5,a5,-32	
	add	a5,a5,s0	
	lw	a5,-40(a5)		
	lw	a4,-84(s0)		
	mulw	a5,a4,a5	
	sw	a5,-84(s0)	
	lw	a5,-92(s0)		
	addiw	a5,a5,1	
	sw	a5,-92(s0)	
.L7:
	lw	a5,-92(s0)		
	mv	a4,a5	
	lw	a5,-88(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	blt	a4,a5,.L8	
	lw	a5,-84(s0)		
	mv	a1,a5	
	lla	a0,.LC2	
	call	printf@plt	
	li	a5,0		
	mv	a4,a5	
	la	a5,__stack_chk_guard		
	ld	a3, -40(s0)	
	ld	a5, 0(a5)	
	xor	a5, a3, a5	
	li	a3, 0	
	beq	a5,zero,.L10	
	call	__stack_chk_fail@plt	
.L10:
	mv	a0,a4	
	ld	ra,88(sp)		
	ld	s0,80(sp)		
	fld	fs0,72(sp)	
	addi	sp,sp,96	
	jr	ra		
	.size	main, .-main
	.section	.rodata
	.align	3
.LC0:
	.word	0
	.word	1072693248
	.align	3
.LC1:
	.word	0
	.word	1076101120
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
