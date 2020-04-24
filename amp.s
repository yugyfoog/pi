	.align	16
	.globl	mpint_zero
mpint_zero:
	pxor	%xmm0,%xmm0
	movupd	%xmm0,(%rdi)
	movsd	%xmm0,16(%rdi)
	ret

	.align	16
	.globl	mpfloat_zero
mpfloat_zero:
	vpxor	%ymm0,%ymm0,%ymm0
	vmovupd	%ymm0,(%rdi)
	ret



	
