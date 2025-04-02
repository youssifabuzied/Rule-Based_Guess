	.file	"problem42.c"
	.option pic
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"r"
	.align	3
.LC1:
	.string	"words.txt"
	.align	3
.LC2:
	.string	"\"%[^\"]\","
	.align	3
.LC3:
	.string	"%d\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-80	
	sd	ra,72(sp)	
	sd	s0,64(sp)	
	addi	s0,sp,80	
	la	a5,__stack_chk_guard		
	ld	a4, 0(a5)	
	sd	a4, -24(s0)	
	li	a4, 0	
	sw	zero,-76(s0)	
	lla	a1,.LC0	
	lla	a0,.LC1	
	call	fopen@plt	
	mv	a5,a0	
	sd	a5,-64(s0)	
	ld	a5,-64(s0)		
	bne	a5,zero,.L4	
	lla	a0,.LC1	
	call	perror@plt	
	li	a5,1		
	j	.L8		
.L7:
	sw	zero,-68(s0)	
	sw	zero,-72(s0)	
	j	.L5		
.L6:
	lw	a5,-72(s0)		
	addi	a5,a5,-16	
	add	a5,a5,s0	
	lbu	a5,-40(a5)	
	sext.w	a5,a5	
	addiw	a5,a5,-64	
	sext.w	a5,a5	
	lw	a4,-68(s0)		
	addw	a5,a4,a5	
	sw	a5,-68(s0)	
	lw	a5,-72(s0)		
	addiw	a5,a5,1	
	sw	a5,-72(s0)	
.L5:
	lw	a5,-72(s0)		
	addi	a5,a5,-16	
	add	a5,a5,s0	
	lbu	a5,-40(a5)	
	bne	a5,zero,.L6	
	lw	a5,-68(s0)		
	mv	a0,a5	
	call	is_triangle		
	mv	a5,a0	
	lw	a4,-76(s0)		
	addw	a5,a4,a5	
	sw	a5,-76(s0)	
.L4:
	addi	a5,s0,-56	
	mv	a2,a5	
	lla	a1,.LC2	
	ld	a0,-64(s0)		
	call	__isoc99_fscanf@plt	
	mv	a5,a0	
	mv	a4,a5	
	li	a5,-1		
	bne	a4,a5,.L7	
	ld	a0,-64(s0)		
	call	fclose@plt	
	lw	a5,-76(s0)		
	mv	a1,a5	
	lla	a0,.LC3	
	call	printf@plt	
	li	a5,0		
.L8:
	mv	a4,a5	
	la	a5,__stack_chk_guard		
	ld	a3, -24(s0)	
	ld	a5, 0(a5)	
	xor	a5, a3, a5	
	li	a3, 0	
	beq	a5,zero,.L9	
	call	__stack_chk_fail@plt	
.L9:
	mv	a0,a4	
	ld	ra,72(sp)		
	ld	s0,64(sp)		
	addi	sp,sp,80	
	jr	ra		
	.size	main, .-main
	.align	1
	.type	is_triangle, @function
is_triangle:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	mv	a5,a0	
	sw	a5,-36(s0)	
	lw	a5,-36(s0)		
	slliw	a5,a5,3	
	sext.w	a5,a5	
	addiw	a5,a5,1	
	sext.w	a5,a5	
	fcvt.d.w	fa5,a5	
	fmv.d	fa0,fa5	
	call	sqrt@plt	
	fmv.d	fa5,fa0	
	fcvt.w.d a5,fa5,rtz	
	sw	a5,-20(s0)	
	lw	a5,-20(s0)		
	mulw	a5,a5,a5	
	sext.w	a4,a5	
	lw	a5,-36(s0)		
	slliw	a5,a5,3	
	sext.w	a5,a5	
	addiw	a5,a5,1	
	sext.w	a5,a5	
	bne	a4,a5,.L11	
	lw	a5,-20(s0)		
	andi	a5,a5,1	
	sext.w	a5,a5	
	beq	a5,zero,.L11	
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
	.size	is_triangle, .-is_triangle
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
