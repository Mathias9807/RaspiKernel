.section ".text.boot"
.globl _start

_start:
	// TEMP
	// ldr r0, =0x20200000
	// 
	// mov r1, #1
	// lsl r1, #21
	// str r1, [r0, #16]

	// mov r1, #1
	// lsl r1, #15
	// str r1, [r0, #44]
	// TEMP

	// Sets up the stack
	mov sp, #0x8000

	ldr r4, =__bss_start
	ldr r9, =__bss_end
	mov r5, #0
	mov r6, #0
	mov r7, #0
	mov r8, #0
	b       2f

1:
	// store multiple at r4.
	stmia r4!, {r5-r8}

	// If we are still below bss_end, loop.
2:
	cmp r4, r9
	blo 1b

	// Call kernel
	ldr r3, =kernel
	blx r3

loop:
	b loop
