	.align	16
	.globl	fast_set
fast_set:
	lea	(%rdi,%rsi,8),%rdi
	neg	%rsi
1:	mov	%rdx,(%rdi,%rsi,8)
	inc	%rsi
	jne	1b
	ret
