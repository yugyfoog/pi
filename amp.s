	.align	16
	.globl	mpint_make_zero
mpint_make_zero:
	pxor	%xmm0,%xmm0
	movupd	%xmm0,(%rdi)
	movsd	%xmm0,16(%rdi)
	ret


	
