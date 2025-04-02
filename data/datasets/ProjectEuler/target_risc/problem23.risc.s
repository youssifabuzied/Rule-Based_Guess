	.file	"problem23.c"
	.option pic
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%d\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64	
	sd	ra,56(sp)	
	sd	s0,48(sp)	
	addi	s0,sp,64	
	li	a5,28672		
	addi	a5,a5,-549	
	sw	a5,-40(s0)	
	sw	zero,-48(s0)	
	sw	zero,-44(s0)	
	li	a5,1		
	sw	a5,-56(s0)	
	j	.L2		
.L4:
	lw	a5,-56(s0)		
	mv	a0,a5	
	call	is_abundant		
	mv	a5,a0	
	beq	a5,zero,.L3	
	lw	a5,-48(s0)		
	addiw	a5,a5,1	
	sw	a5,-48(s0)	
.L3:
	lw	a5,-56(s0)		
	addiw	a5,a5,1	
	sw	a5,-56(s0)	
.L2:
	lw	a5,-56(s0)		
	mv	a4,a5	
	lw	a5,-40(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	blt	a4,a5,.L4	
	lw	a5,-48(s0)		
	slli	a5,a5,2	
	mv	a0,a5	
	call	malloc@plt	
	mv	a5,a0	
	sd	a5,-32(s0)	
	sw	zero,-52(s0)	
	li	a5,1		
	sw	a5,-56(s0)	
	j	.L5		
.L7:
	lw	a5,-56(s0)		
	mv	a0,a5	
	call	is_abundant		
	mv	a5,a0	
	beq	a5,zero,.L6	
	lw	a5,-52(s0)		
	addiw	a4,a5,1	
	sw	a4,-52(s0)	
	slli	a5,a5,2	
	ld	a4,-32(s0)		
	add	a5,a4,a5	
	lw	a4,-56(s0)		
	sw	a4,0(a5)	
.L6:
	lw	a5,-56(s0)		
	addiw	a5,a5,1	
	sw	a5,-56(s0)	
.L5:
	lw	a5,-56(s0)		
	mv	a4,a5	
	lw	a5,-40(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	blt	a4,a5,.L7	
	lw	a5,-40(s0)		
	li	a1,1		
	mv	a0,a5	
	call	calloc@plt	
	mv	a5,a0	
	sd	a5,-24(s0)	
	sw	zero,-56(s0)	
	j	.L8		
.L13:
	lw	a5,-56(s0)		
	sw	a5,-52(s0)	
	j	.L9		
.L12:
	lw	a5,-56(s0)		
	slli	a5,a5,2	
	ld	a4,-32(s0)		
	add	a5,a4,a5	
	lw	a4,0(a5)		
	lw	a5,-52(s0)		
	slli	a5,a5,2	
	ld	a3,-32(s0)		
	add	a5,a3,a5	
	lw	a5,0(a5)		
	addw	a5,a4,a5	
	sw	a5,-36(s0)	
	lw	a5,-36(s0)		
	mv	a4,a5	
	lw	a5,-40(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	bge	a4,a5,.L18	
	lw	a5,-36(s0)		
	addi	a5,a5,-1	
	ld	a4,-24(s0)		
	add	a5,a4,a5	
	li	a4,1		
	sb	a4,0(a5)	
	lw	a5,-52(s0)		
	addiw	a5,a5,1	
	sw	a5,-52(s0)	
.L9:
	lw	a5,-52(s0)		
	mv	a4,a5	
	lw	a5,-48(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	blt	a4,a5,.L12	
	j	.L11		
.L18:
	nop	
.L11:
	lw	a5,-56(s0)		
	addiw	a5,a5,1	
	sw	a5,-56(s0)	
.L8:
	lw	a5,-56(s0)		
	mv	a4,a5	
	lw	a5,-48(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	blt	a4,a5,.L13	
	li	a5,1		
	sw	a5,-56(s0)	
	j	.L14		
.L16:
	lw	a5,-56(s0)		
	addi	a5,a5,-1	
	ld	a4,-24(s0)		
	add	a5,a4,a5	
	lbu	a5,0(a5)	
	bne	a5,zero,.L15	
	lw	a5,-44(s0)		
	mv	a4,a5	
	lw	a5,-56(s0)		
	addw	a5,a4,a5	
	sw	a5,-44(s0)	
.L15:
	lw	a5,-56(s0)		
	addiw	a5,a5,1	
	sw	a5,-56(s0)	
.L14:
	lw	a5,-56(s0)		
	mv	a4,a5	
	lw	a5,-40(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	blt	a4,a5,.L16	
	lw	a5,-44(s0)		
	mv	a1,a5	
	lla	a0,.LC0	
	call	printf@plt	
	ld	a0,-32(s0)		
	call	free@plt	
	ld	a0,-24(s0)		
	call	free@plt	
	li	a5,0		
	mv	a0,a5	
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	addi	sp,sp,64	
	jr	ra		
	.size	main, .-main
	.align	1
	.type	is_abundant, @function
is_abundant:
	addi	sp,sp,-48	
	sd	s0,40(sp)	
	addi	s0,sp,48	
	mv	a5,a0	
	sw	a5,-36(s0)	
	li	a5,1		
	sw	a5,-32(s0)	
	lw	a5,-36(s0)		
	sw	a5,-24(s0)	
	li	a5,2		
	sw	a5,-28(s0)	
	j	.L20		
.L23:
	li	a5,1		
	sw	a5,-20(s0)	
	j	.L21		
.L22:
	lw	a5,-20(s0)		
	mv	a4,a5	
	lw	a5,-28(s0)		
	mulw	a5,a4,a5	
	sw	a5,-20(s0)	
	lw	a5,-24(s0)		
	mv	a4,a5	
	lw	a5,-28(s0)		
	divw	a5,a4,a5	
	sw	a5,-24(s0)	
.L21:
	lw	a5,-24(s0)		
	mv	a4,a5	
	lw	a5,-28(s0)		
	remw	a5,a4,a5	
	sext.w	a5,a5	
	beq	a5,zero,.L22	
	lw	a5,-20(s0)		
	mv	a4,a5	
	lw	a5,-28(s0)		
	mulw	a5,a4,a5	
	sext.w	a5,a5	
	addiw	a5,a5,-1	
	sext.w	a4,a5	
	lw	a5,-28(s0)		
	addiw	a5,a5,-1	
	sext.w	a5,a5	
	divw	a5,a4,a5	
	sext.w	a5,a5	
	lw	a4,-32(s0)		
	mulw	a5,a4,a5	
	sw	a5,-32(s0)	
	lw	a5,-28(s0)		
	addiw	a5,a5,1	
	sw	a5,-28(s0)	
.L20:
	lw	a5,-28(s0)		
	mv	a4,a5	
	lw	a5,-24(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	ble	a4,a5,.L23	
	lw	a5,-36(s0)		
	slliw	a5,a5,1	
	sext.w	a4,a5	
	lw	a5,-32(s0)		
	sext.w	a5,a5	
	sgt	a5,a5,a4	
	andi	a5,a5,0xff	
	sext.w	a5,a5	
	mv	a0,a5	
	ld	s0,40(sp)		
	addi	sp,sp,48	
	jr	ra		
	.size	is_abundant, .-is_abundant
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
