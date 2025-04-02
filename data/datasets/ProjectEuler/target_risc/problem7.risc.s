	.file	"problem7.c"
	.option pic
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%lu\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-64	
	sd	ra,56(sp)	
	sd	s0,48(sp)	
	addi	s0,sp,64	
	sw	zero,-56(s0)	
	li	a5,999424		
	addi	a5,a5,576	
	sd	a5,-32(s0)	
	li	a5,8192		
	addi	a5,a5,1809	
	sw	a5,-52(s0)	
	li	a1,1		
	ld	a0,-32(s0)		
	call	calloc@plt	
	mv	a5,a0	
	sd	a5,-24(s0)	
	li	a5,2		
	sd	a5,-48(s0)	
	j	.L2		
.L8:
	ld	a4,-24(s0)		
	ld	a5,-48(s0)		
	add	a5,a4,a5	
	lbu	a5,0(a5)	
	bne	a5,zero,.L3	
	lw	a5,-56(s0)		
	addiw	a5,a5,1	
	sw	a5,-56(s0)	
	lw	a5,-56(s0)		
	mv	a4,a5	
	lw	a5,-52(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	bne	a4,a5,.L4	
	ld	a1,-48(s0)		
	lla	a0,.LC0	
	call	printf@plt	
	j	.L5		
.L4:
	ld	a5,-48(s0)		
	slli	a5,a5,1	
	sd	a5,-40(s0)	
	j	.L6		
.L7:
	ld	a4,-24(s0)		
	ld	a5,-40(s0)		
	add	a5,a4,a5	
	li	a4,1		
	sb	a4,0(a5)	
	ld	a4,-40(s0)		
	ld	a5,-48(s0)		
	add	a5,a4,a5	
	sd	a5,-40(s0)	
.L6:
	ld	a4,-40(s0)		
	ld	a5,-32(s0)		
	bltu	a4,a5,.L7	
.L3:
	ld	a5,-48(s0)		
	addi	a5,a5,1	
	sd	a5,-48(s0)	
.L2:
	ld	a4,-48(s0)		
	ld	a5,-32(s0)		
	bltu	a4,a5,.L8	
.L5:
	ld	a0,-24(s0)		
	call	free@plt	
	li	a5,0		
	mv	a0,a5	
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	addi	sp,sp,64	
	jr	ra		
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
