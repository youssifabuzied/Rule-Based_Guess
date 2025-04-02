	.file	"problem9.c"
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
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	li	a5,1		
	sw	a5,-28(s0)	
	j	.L2		
.L6:
	lw	a5,-28(s0)		
	sw	a5,-24(s0)	
	j	.L3		
.L5:
	li	a5,1000		
	lw	a4,-28(s0)		
	subw	a5,a5,a4	
	sext.w	a5,a5	
	lw	a4,-24(s0)		
	subw	a5,a5,a4	
	sw	a5,-20(s0)	
	lw	a5,-28(s0)		
	mulw	a5,a5,a5	
	sext.w	a4,a5	
	lw	a5,-24(s0)		
	mulw	a5,a5,a5	
	sext.w	a5,a5	
	addw	a5,a4,a5	
	sext.w	a4,a5	
	lw	a5,-20(s0)		
	mulw	a5,a5,a5	
	sext.w	a5,a5	
	bne	a4,a5,.L4	
	lw	a5,-28(s0)		
	mv	a4,a5	
	lw	a5,-24(s0)		
	mulw	a5,a4,a5	
	sext.w	a5,a5	
	lw	a4,-20(s0)		
	mulw	a5,a4,a5	
	sext.w	a5,a5	
	mv	a1,a5	
	lla	a0,.LC0	
	call	printf@plt	
.L4:
	lw	a5,-24(s0)		
	addiw	a5,a5,1	
	sw	a5,-24(s0)	
.L3:
	lw	a5,-24(s0)		
	sext.w	a4,a5	
	li	a5,666		
	ble	a4,a5,.L5	
	lw	a5,-28(s0)		
	addiw	a5,a5,1	
	sw	a5,-28(s0)	
.L2:
	lw	a5,-28(s0)		
	sext.w	a4,a5	
	li	a5,333		
	ble	a4,a5,.L6	
	li	a5,0		
	mv	a0,a5	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
