	.file	"problem45.c"
	.option pic
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	"%llu\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32	
	sd	ra,24(sp)	
	sd	s0,16(sp)	
	addi	s0,sp,32	
	li	a5,144		
	sd	a5,-32(s0)	
	j	.L2		
.L3:
	ld	a5,-32(s0)		
	addi	a5,a5,1	
	sd	a5,-32(s0)	
.L2:
	ld	a0,-32(s0)		
	call	hexagonal		
	sd	a0,-24(s0)	
	ld	a0,-24(s0)		
	call	is_pentagonal		
	mv	a5,a0	
	beq	a5,zero,.L3	
	ld	a0,-24(s0)		
	call	is_triangle		
	mv	a5,a0	
	beq	a5,zero,.L3	
	ld	a1,-24(s0)		
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
	.globl	is_triangle
	.type	is_triangle, @function
is_triangle:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	ld	a5,-40(s0)		
	slli	a5,a5,3	
	addi	a5,a5,1	
	fcvt.d.lu	fa5,a5	
	fmv.d	fa0,fa5	
	call	sqrt@plt	
	fmv.d	fa5,fa0	
	fcvt.lu.d a5,fa5,rtz	
	sd	a5,-24(s0)	
	ld	a5,-24(s0)		
	mul	a4,a5,a5	
	ld	a5,-40(s0)		
	slli	a5,a5,3	
	addi	a5,a5,1	
	bne	a4,a5,.L6	
	ld	a5,-24(s0)		
	addi	a5,a5,-1	
	andi	a5,a5,1	
	bne	a5,zero,.L6	
	li	a5,1		
	j	.L7		
.L6:
	li	a5,0		
.L7:
	mv	a0,a5	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
	.size	is_triangle, .-is_triangle
	.align	1
	.globl	is_pentagonal
	.type	is_pentagonal, @function
is_pentagonal:
	addi	sp,sp,-48	
	sd	ra,40(sp)	
	sd	s0,32(sp)	
	addi	s0,sp,48	
	sd	a0,-40(s0)	
	ld	a4,-40(s0)		
	mv	a5,a4	
	slli	a5,a5,1	
	add	a5,a5,a4	
	slli	a5,a5,3	
	addi	a5,a5,1	
	fcvt.d.lu	fa5,a5	
	fmv.d	fa0,fa5	
	call	sqrt@plt	
	fmv.d	fa5,fa0	
	fcvt.lu.d a5,fa5,rtz	
	sd	a5,-24(s0)	
	ld	a5,-24(s0)		
	mul	a3,a5,a5	
	ld	a4,-40(s0)		
	mv	a5,a4	
	slli	a5,a5,1	
	add	a5,a5,a4	
	slli	a5,a5,3	
	addi	a5,a5,1	
	bne	a3,a5,.L10	
	ld	a5,-24(s0)		
	addi	a4,a5,1	
	li	a5,6		
	remu	a5,a4,a5	
	bne	a5,zero,.L10	
	li	a5,1		
	j	.L11		
.L10:
	li	a5,0		
.L11:
	mv	a0,a5	
	ld	ra,40(sp)		
	ld	s0,32(sp)		
	addi	sp,sp,48	
	jr	ra		
	.size	is_pentagonal, .-is_pentagonal
	.align	1
	.globl	hexagonal
	.type	hexagonal, @function
hexagonal:
	addi	sp,sp,-32	
	sd	s0,24(sp)	
	addi	s0,sp,32	
	sd	a0,-24(s0)	
	ld	a5,-24(s0)		
	slli	a5,a5,1	
	addi	a4,a5,-1	
	ld	a5,-24(s0)		
	mul	a5,a4,a5	
	mv	a0,a5	
	ld	s0,24(sp)		
	addi	sp,sp,32	
	jr	ra		
	.size	hexagonal, .-hexagonal
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
