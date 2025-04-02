	.file	"problem22.c"
	.option pic
	.text
	.section	.rodata
	.align	3
.LC1:
	.string	"r"
	.align	3
.LC2:
	.string	"\"%[^\"]\","
	.align	3
.LC3:
	.string	"%d\n"
	.align	3
.LC0:
	.string	"names.txt"
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
	sw	zero,-92(s0)	
	lla	a5,.LC0	
	ld	a4,0(a5)		
	sd	a4,-56(s0)	
	lhu	a5,8(a5)	
	sh	a5,-48(s0)	
	sw	zero,-84(s0)	
	addi	a5,s0,-56	
	lla	a1,.LC1	
	mv	a0,a5	
	call	fopen@plt	
	mv	a5,a0	
	sd	a5,-72(s0)	
	ld	a5,-72(s0)		
	bne	a5,zero,.L2	
	addi	a5,s0,-56	
	mv	a0,a5	
	call	perror@plt	
	li	a5,1		
	j	.L10		
.L2:
	li	a0,65536		
	call	malloc@plt	
	mv	a5,a0	
	sd	a5,-64(s0)	
	lw	a5,-92(s0)		
	slli	a5,a5,3	
	ld	a4,-64(s0)		
	add	s1,a4,a5	
	li	a0,16		
	call	malloc@plt	
	mv	a5,a0	
	sd	a5,0(s1)	
	j	.L4		
.L5:
	lw	a5,-92(s0)		
	addiw	a5,a5,1	
	sw	a5,-92(s0)	
	lw	a5,-92(s0)		
	slli	a5,a5,3	
	ld	a4,-64(s0)		
	add	s1,a4,a5	
	li	a0,16		
	call	malloc@plt	
	mv	a5,a0	
	sd	a5,0(s1)	
.L4:
	lw	a5,-92(s0)		
	slli	a5,a5,3	
	ld	a4,-64(s0)		
	add	a5,a4,a5	
	ld	a5,0(a5)		
	mv	a2,a5	
	lla	a1,.LC2	
	ld	a0,-72(s0)		
	call	__isoc99_fscanf@plt	
	mv	a5,a0	
	mv	a4,a5	
	li	a5,-1		
	bne	a4,a5,.L5	
	lw	a5,-92(s0)		
	slli	a5,a5,3	
	ld	a4,-64(s0)		
	add	a5,a4,a5	
	ld	a5,0(a5)		
	mv	a0,a5	
	call	free@plt	
	ld	a0,-72(s0)		
	call	fclose@plt	
	lw	a5,-92(s0)		
	lla	a3,compare	
	li	a2,8		
	mv	a1,a5	
	ld	a0,-64(s0)		
	call	qsort@plt	
	sw	zero,-88(s0)	
	j	.L6		
.L9:
	sw	zero,-76(s0)	
	sw	zero,-80(s0)	
	j	.L7		
.L8:
	lw	a5,-88(s0)		
	slli	a5,a5,3	
	ld	a4,-64(s0)		
	add	a5,a4,a5	
	ld	a4,0(a5)		
	lw	a5,-80(s0)		
	add	a5,a4,a5	
	lbu	a5,0(a5)	
	sext.w	a5,a5	
	addiw	a5,a5,-64	
	sext.w	a5,a5	
	lw	a4,-76(s0)		
	addw	a5,a4,a5	
	sw	a5,-76(s0)	
	lw	a5,-80(s0)		
	addiw	a5,a5,1	
	sw	a5,-80(s0)	
.L7:
	lw	a5,-88(s0)		
	slli	a5,a5,3	
	ld	a4,-64(s0)		
	add	a5,a4,a5	
	ld	a4,0(a5)		
	lw	a5,-80(s0)		
	add	a5,a4,a5	
	lbu	a5,0(a5)	
	bne	a5,zero,.L8	
	lw	a5,-88(s0)		
	addiw	a5,a5,1	
	sext.w	a5,a5	
	lw	a4,-76(s0)		
	mulw	a5,a4,a5	
	sext.w	a5,a5	
	lw	a4,-84(s0)		
	addw	a5,a4,a5	
	sw	a5,-84(s0)	
	lw	a5,-88(s0)		
	slli	a5,a5,3	
	ld	a4,-64(s0)		
	add	a5,a4,a5	
	ld	a5,0(a5)		
	mv	a0,a5	
	call	free@plt	
	lw	a5,-88(s0)		
	addiw	a5,a5,1	
	sw	a5,-88(s0)	
.L6:
	lw	a5,-88(s0)		
	mv	a4,a5	
	lw	a5,-92(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	blt	a4,a5,.L9	
	ld	a0,-64(s0)		
	call	free@plt	
	lw	a5,-84(s0)		
	mv	a1,a5	
	lla	a0,.LC3	
	call	printf@plt	
	li	a5,0		
.L10:
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
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	sd	a1,-32(s0)	
	ld	a5,-24(s0)		
	ld	a4,0(a5)		
	ld	a5,-32(s0)		
	ld	a5,0(a5)		
	mv	a1,a5	
	mv	a0,a4	
	call	strcmp@plt	
	mv	a5,a0	
	mv	a0,a5	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
	.size	compare, .-compare
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
