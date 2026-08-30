	.arch armv8-a
	.file	"codefibo.c"
	.text
	.section	.rodata
	.align	3
.LC0:
	.string	" ======= SERIE FIBONACCI ======"
	.align	3
.LC1:
	.string	"%d"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	wzr, [sp, 16]
	mov	w0, 1
	str	w0, [sp, 20]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
	str	wzr, [sp, 24]
	b	.L2
.L3:
	ldr	w1, [sp, 16]
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	ldr	w1, [sp, 16]
	ldr	w0, [sp, 20]
	add	w0, w1, w0
	str	w0, [sp, 28]
	ldr	w0, [sp, 20]
	str	w0, [sp, 16]
	ldr	w0, [sp, 28]
	str	w0, [sp, 20]
	mov	w0, 10
	bl	putchar
	ldr	w0, [sp, 24]
	add	w0, w0, 1
	str	w0, [sp, 24]
.L2:
	ldr	w0, [sp, 24]
	cmp	w0, 19
	ble	.L3
	mov	w0, 0
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
