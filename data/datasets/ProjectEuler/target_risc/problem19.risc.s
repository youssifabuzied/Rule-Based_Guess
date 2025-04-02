	.file	"problem19.c"
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
	sw	zero,-28(s0)	
	sw	zero,-24(s0)	
	li	a5,1901		
	sw	a5,-32(s0)	
	j	.L2		
.L6:
	li	a5,1		
	sw	a5,-20(s0)	
	j	.L3		
.L5:
	lw	a5,-28(s0)		
	sext.w	a4,a5	
	li	a5,5		
	bne	a4,a5,.L4	
	lw	a5,-24(s0)		
	addiw	a5,a5,1	
	sw	a5,-24(s0)	
.L4:
	lw	a4,-20(s0)		
	lw	a5,-32(s0)		
	mv	a1,a4	
	mv	a0,a5	
	call	days		
	mv	a5,a0	
	lw	a4,-28(s0)		
	addw	a5,a4,a5	
	sext.w	a5,a5	
	mv	a4,a5	
	li	a5,7		
	remw	a5,a4,a5	
	sw	a5,-28(s0)	
	lw	a5,-20(s0)		
	addiw	a5,a5,1	
	sw	a5,-20(s0)	
.L3:
	lw	a5,-20(s0)		
	sext.w	a4,a5	
	li	a5,12		
	ble	a4,a5,.L5	
	lw	a5,-32(s0)		
	addiw	a5,a5,1	
	sw	a5,-32(s0)	
.L2:
	lw	a5,-32(s0)		
	sext.w	a4,a5	
	li	a5,2000		
	ble	a4,a5,.L6	
	lw	a5,-24(s0)		
	mv	a1,a5	
	lla	a0,.LC0	
	call	printf@plt	
	li	a5,0		
	mv	a0,a5	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
	.size	main, .-main
	.align	1
	.type	days, @function
days:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	mv	a5,a0	
	mv	a4,a1	
	sw	a5,-20(s0)	
	mv	a5,a4	
	sw	a5,-24(s0)	
	lw	a5,-24(s0)		
	addiw	a5,a5,-2	
	sext.w	a4,a5	
	mv	a3,a4	
	li	a5,9		
	sgtu	a5,a3,a5	
	andi	a5,a5,0xff	
	bne	a5,zero,.L9	
	li	a5,1		
	sll	a5,a5,a4	
	andi	a4,a5,660	
	snez	a4,a4	
	andi	a4,a4,0xff	
	bne	a4,zero,.L10	
	andi	a5,a5,1	
	snez	a5,a5	
	andi	a5,a5,0xff	
	beq	a5,zero,.L9	
	lw	a5,-20(s0)		
	andi	a5,a5,3	
	sext.w	a5,a5	
	bne	a5,zero,.L11	
	lw	a5,-20(s0)		
	mv	a4,a5	
	li	a5,100		
	remw	a5,a4,a5	
	sext.w	a5,a5	
	bne	a5,zero,.L12	
.L11:
	lw	a5,-20(s0)		
	mv	a4,a5	
	li	a5,400		
	remw	a5,a4,a5	
	sext.w	a5,a5	
	bne	a5,zero,.L13	
.L12:
	li	a5,29		
	j	.L14		
.L13:
	li	a5,28		
	j	.L14		
.L10:
	li	a5,30		
	j	.L14		
.L9:
	li	a5,31		
.L14:
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
	.size	days, .-days
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
