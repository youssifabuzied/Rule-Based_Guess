.section .text
.align 1
.global _start
_start:
	li	a5,%eax
	mv	a0,a5
	lla	a1,.LC0
	li	a2,%rdi
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-16(s0)
	beqz	a5,.L2
	la	a5,__stack_chk_guard
	ld	a5,0(a5)
	sd	a5,-24(s0)
	j	.L2
.L1:
	li	a5,0
.L2:
	li	a0,0
	ld	a0,-16(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	bnez	a5,.L3
	lla	a1,.LC1
	li	a2,0
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L3
.L3:
	li	a5,0
.L1:
	li	a0,0
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a0,a5
	ld	a0,-24(s0)
	call	__syscall@plt
	li	a5,0
	mv	a0,a5
	ld	a5,-24(s0)
	lbu	a5,0(a5)
	mv	a0,a5
	ld	a5,-24(s0)
	addi	a5,a5,1
	sd	a5,-24(s0)
	j	.L1
.L1:
	li	a5,0
.L1:
	mv	a5,0
