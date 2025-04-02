	.file	"problem31.c"
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
	sw	zero,-52(s0)	
	li	a5,200		
	sw	a5,-20(s0)	
	sw	zero,-48(s0)	
	j	.L2		
.L16:
	sw	zero,-44(s0)	
	j	.L3		
.L15:
	sw	zero,-40(s0)	
	j	.L4		
.L14:
	sw	zero,-36(s0)	
	j	.L5		
.L13:
	sw	zero,-32(s0)	
	j	.L6		
.L12:
	sw	zero,-28(s0)	
	j	.L7		
.L11:
	sw	zero,-24(s0)	
	j	.L8		
.L10:
	lw	a5,-48(s0)		
	mv	a4,a5	
	lw	a5,-44(s0)		
	addw	a5,a4,a5	
	sext.w	a5,a5	
	lw	a4,-40(s0)		
	addw	a5,a4,a5	
	sext.w	a5,a5	
	lw	a4,-36(s0)		
	addw	a5,a4,a5	
	sext.w	a5,a5	
	lw	a4,-32(s0)		
	addw	a5,a4,a5	
	sext.w	a5,a5	
	lw	a4,-28(s0)		
	addw	a5,a4,a5	
	sext.w	a5,a5	
	lw	a4,-24(s0)		
	addw	a5,a4,a5	
	sext.w	a5,a5	
	mv	a4,a5	
	li	a5,200		
	bgt	a4,a5,.L9	
	lw	a5,-52(s0)		
	addiw	a5,a5,1	
	sw	a5,-52(s0)	
.L9:
	lw	a5,-24(s0)		
	addiw	a5,a5,2	
	sw	a5,-24(s0)	
.L8:
	lw	a5,-24(s0)		
	mv	a4,a5	
	lw	a5,-20(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	ble	a4,a5,.L10	
	lw	a5,-28(s0)		
	addiw	a5,a5,5	
	sw	a5,-28(s0)	
.L7:
	lw	a5,-28(s0)		
	mv	a4,a5	
	lw	a5,-20(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	ble	a4,a5,.L11	
	lw	a5,-32(s0)		
	addiw	a5,a5,10	
	sw	a5,-32(s0)	
.L6:
	lw	a5,-32(s0)		
	mv	a4,a5	
	lw	a5,-20(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	ble	a4,a5,.L12	
	lw	a5,-36(s0)		
	addiw	a5,a5,20	
	sw	a5,-36(s0)	
.L5:
	lw	a5,-36(s0)		
	mv	a4,a5	
	lw	a5,-20(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	ble	a4,a5,.L13	
	lw	a5,-40(s0)		
	addiw	a5,a5,50	
	sw	a5,-40(s0)	
.L4:
	lw	a5,-40(s0)		
	mv	a4,a5	
	lw	a5,-20(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	ble	a4,a5,.L14	
	lw	a5,-44(s0)		
	addiw	a5,a5,100	
	sw	a5,-44(s0)	
.L3:
	lw	a5,-44(s0)		
	mv	a4,a5	
	lw	a5,-20(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	ble	a4,a5,.L15	
	lw	a5,-48(s0)		
	addiw	a5,a5,200	
	sw	a5,-48(s0)	
.L2:
	lw	a5,-48(s0)		
	mv	a4,a5	
	lw	a5,-20(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	ble	a4,a5,.L16	
	lw	a5,-52(s0)		
	mv	a1,a5	
	lla	a0,.LC0	
	call	printf@plt	
	li	a5,0		
	mv	a0,a5	
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	addi	sp,sp,64	
	jr	ra		
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
