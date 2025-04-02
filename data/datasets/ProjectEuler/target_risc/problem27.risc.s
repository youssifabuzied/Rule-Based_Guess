	.file	"problem27.c"
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
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sw	zero,-28(s0)	
	sw	zero,-24(s0)	
	sw	zero,-20(s0)	
	li	a5,-999		
	sw	a5,-40(s0)	
	j	.L2		
.L8:
	li	a5,-999		
	sw	a5,-36(s0)	
	j	.L3		
.L7:
	sw	zero,-32(s0)	
	j	.L4		
.L5:
	lw	a5,-32(s0)		
	addiw	a5,a5,1	
	sw	a5,-32(s0)	
.L4:
	lw	a5,-32(s0)		
	mulw	a5,a5,a5	
	sext.w	a4,a5	
	lw	a5,-40(s0)		
	mv	a3,a5	
	lw	a5,-32(s0)		
	mulw	a5,a3,a5	
	sext.w	a5,a5	
	addw	a5,a4,a5	
	sext.w	a5,a5	
	lw	a4,-36(s0)		
	addw	a5,a4,a5	
	sext.w	a5,a5	
	mv	a0,a5	
	call	is_prime		
	mv	a5,a0	
	bne	a5,zero,.L5	
	lw	a5,-32(s0)		
	mv	a4,a5	
	lw	a5,-28(s0)		
	sext.w	a4,a4	
	sext.w	a5,a5	
	ble	a4,a5,.L6	
	lw	a5,-32(s0)		
	sw	a5,-28(s0)	
	lw	a5,-40(s0)		
	sw	a5,-24(s0)	
	lw	a5,-36(s0)		
	sw	a5,-20(s0)	
.L6:
	lw	a5,-36(s0)		
	addiw	a5,a5,1	
	sw	a5,-36(s0)	
.L3:
	lw	a5,-36(s0)		
	sext.w	a4,a5	
	li	a5,999		
	ble	a4,a5,.L7	
	lw	a5,-40(s0)		
	addiw	a5,a5,1	
	sw	a5,-40(s0)	
.L2:
	lw	a5,-40(s0)		
	sext.w	a4,a5	
	li	a5,999		
	ble	a4,a5,.L8	
	lw	a5,-24(s0)		
	mv	a4,a5	
	lw	a5,-20(s0)		
	mulw	a5,a4,a5	
	sext.w	a5,a5	
	mv	a1,a5	
	lla	a0,.LC0	
	call	printf@plt	
	li	a5,0		
	mv	a0,a5	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
	.size	main, .-main
	.align	1
	.type	is_prime, @function
is_prime:
	addi	sp,sp,-64	
	sd	ra,56(sp)	
	sd	s0,48(sp)	
	fsd	fs0,40(sp)	
	addi	s0,sp,64	
	mv	a5,a0	
	sw	a5,-52(s0)	
	lw	a5,-52(s0)		
	sext.w	a4,a5	
	li	a5,1		
	bgt	a4,a5,.L11	
	li	a5,0		
	j	.L12		
.L11:
	lw	a5,-52(s0)		
	sext.w	a4,a5	
	li	a5,2		
	bne	a4,a5,.L13	
	li	a5,1		
	j	.L12		
.L13:
	li	a5,2		
	sw	a5,-36(s0)	
	j	.L14		
.L16:
	lw	a5,-52(s0)		
	mv	a4,a5	
	lw	a5,-36(s0)		
	remw	a5,a4,a5	
	sext.w	a5,a5	
	bne	a5,zero,.L15	
	li	a5,0		
	j	.L12		
.L15:
	lw	a5,-36(s0)		
	addiw	a5,a5,1	
	sw	a5,-36(s0)	
.L14:
	lw	a5,-36(s0)		
	fcvt.d.w	fs0,a5	
	lw	a5,-52(s0)		
	fcvt.d.w	fa5,a5	
	fmv.d	fa0,fa5	
	call	sqrt@plt	
	fmv.d	fa5,fa0	
	flt.d	a5,fs0,fa5	
	bne	a5,zero,.L16	
	li	a5,1		
.L12:
	mv	a0,a5	
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	fld	fs0,40(sp)	
	addi	sp,sp,64	
	jr	ra		
	.size	is_prime, .-is_prime
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
