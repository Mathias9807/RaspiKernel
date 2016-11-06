	.arch armv6
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"kernel.c"
	.text
	.align	2
	.global	kernel
	.syntax unified
	.arm
	.fpu softvfp
	.type	kernel, %function
kernel:
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L9+8
	push	{r7, lr}
	mov	r0, #262144
	ldr	r3, .L9+12
	ldr	lr, .L9+16
	ldr	r1, .L9+20
	ldr	ip, .L9+24
	adr	r7, .L9
	ldrd	r6, [r7]
	ldr	r8, .L9+28
	sub	sp, sp, #16
	mov	r9, #0
	str	r0, [r2]
	mov	r0, #65536
	str	r0, [r3]
.L4:
	ldr	r4, [r1]
	str	r0, [lr]
	adds	r2, r8, r4
	adc	r3, r9, #0
	strd	r2, [sp, #8]
.L2:
	ldrd	r4, [sp, #8]
	ldr	r2, [r1]
	mov	r3, #0
	cmp	r3, r5
	cmpeq	r2, r4
	bcc	.L2
	adds	r2, r2, r6
	adc	r3, r3, r7
	str	r0, [ip]
	strd	r2, [sp]
.L3:
	ldrd	r4, [sp]
	ldr	r2, [r1]
	mov	r3, #0
	cmp	r3, r5
	cmpeq	r2, r4
	bcc	.L3
	b	.L4
.L10:
	.align	3
.L9:
	.word	899999
	.word	0
	.word	1059061764
	.word	1059061800
	.word	1059061804
	.word	1056976900
	.word	1059061792
	.word	100000
	.size	kernel, .-kernel
	.ident	"GCC: (Arch Repository) 6.1.1 20160526"
