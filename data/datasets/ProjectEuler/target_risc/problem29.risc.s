	.file	"problem29.c"
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
	la	a5,__stack_chk_guard		
	ld	a4, 0(a5)	
	sd	a4, -24(s0)	
	li	a4, 0	
	sw	zero,-56(s0)	
	sw	zero,-52(s0)	
	addi	a5,s0,-40	
	mv	a0,a5	
	call	__gmpz_init@plt	
	li	a5,155648		
	addi	a0,a5,1168	
	call	malloc@plt	
	mv	a5,a0	
	sd	a5,-48(s0)	
	li	a5,2		
	sw	a5,-64(s0)	
	j	.L2		
.L5:
	lw	a4,-64(s0)		
	addi	a5,s0,-40	
	mv	a1,a4	
	mv	a0,a5	
	call	__gmpz_set_ui@plt	
	li	a5,2		
	sw	a5,-60(s0)	
	j	.L3		
.L4:
	lw	a3,-64(s0)		
	addi	a4,s0,-40	
	addi	a5,s0,-40	
	mv	a2,a3	
	mv	a1,a4	
	mv	a0,a5	
	call	__gmpz_mul_ui@plt	
	lw	a5,-56(s0)		
	slli	a5,a5,4	
	ld	a4,-48(s0)		
	add	a5,a4,a5	
	mv	a0,a5	
	call	__gmpz_init@plt	
	lw	a5,-56(s0)		
	slli	a5,a5,4	
	ld	a4,-48(s0)		
	add	a5,a4,a5	
	addi	a4,s0,-40	
	mv	a1,a4	
	mv	a0,a5	
	call	__gmpz_set@plt	
	lw	a5,-56(s0)		
	addiw	a5,a5,1	
	sw	a5,-56(s0)	
	lw	a5,-60(s0)		
	addiw	a5,a5,1	
	sw	a5,-60(s0)	
.L3:
	lw	a5,-60(s0)		
	sext.w	a4,a5	
	li	a5,100		
	ble	a4,a5,.L4	
	lw	a5,-64(s0)		
	addiw	a5,a5,1	
	sw	a5,-64(s0)	
.L2:
	lw	a5,-64(s0)		
	sext.w	a4,a5	
	li	a5,100		
	ble	a4,a5,.L5	
	lla	a3,compare	
	li	a2,16		
	li	a5,8192		
	addi	a1,a5,1609	
	ld	a0,-48(s0)		
	call	qsort@plt	
	addi	a5,s0,-40	
	li	a1,0		
	mv	a0,a5	
	call	__gmpz_set_ui@plt	
	sw	zero,-56(s0)	
	j	.L6		
.L8:
	lw	a5,-56(s0)		
	slli	a5,a5,4	
	ld	a4,-48(s0)		
	add	a4,a4,a5	
	addi	a5,s0,-40	
	mv	a1,a4	
	mv	a0,a5	
	call	__gmpz_cmp@plt	
	mv	a5,a0	
	beq	a5,zero,.L7	
	lw	a5,-52(s0)		
	addiw	a5,a5,1	
	sw	a5,-52(s0)	
.L7:
	lw	a5,-56(s0)		
	slli	a5,a5,4	
	ld	a4,-48(s0)		
	add	a4,a4,a5	
	addi	a5,s0,-40	
	mv	a1,a4	
	mv	a0,a5	
	call	__gmpz_set@plt	
	lw	a5,-56(s0)		
	slli	a5,a5,4	
	ld	a4,-48(s0)		
	add	a5,a4,a5	
	mv	a0,a5	
	call	__gmpz_clear@plt	
	lw	a5,-56(s0)		
	addiw	a5,a5,1	
	sw	a5,-56(s0)	
.L6:
	lw	a5,-56(s0)		
	sext.w	a4,a5	
	li	a5,8192		
	addi	a5,a5,1608	
	ble	a4,a5,.L8	
	lw	a5,-52(s0)		
	mv	a1,a5	
	lla	a0,.LC0	
	call	printf@plt	
	ld	a0,-48(s0)		
	call	free@plt	
	addi	a5,s0,-40	
	mv	a0,a5	
	call	__gmpz_clear@plt	
	li	a5,0		
	mv	a4,a5	
	la	a5,__stack_chk_guard		
	ld	a3, -24(s0)	
	ld	a5, 0(a5)	
	xor	a5, a3, a5	
	li	a3, 0	
	beq	a5,zero,.L10	
	call	__stack_chk_fail@plt	
.L10:
	mv	a0,a4	
	ld	ra,56(sp)		
	ld	s0,48(sp)		
	addi	sp,sp,64	
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
	ld	a1,-32(s0)		
	ld	a0,-24(s0)		
	call	__gmpz_cmp@plt	
	mv	a5,a0	
	mv	a0,a5	
	ld	ra,24(sp)		
	ld	s0,16(sp)		
	addi	sp,sp,32	
	jr	ra		
	.size	compare, .-compare
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
