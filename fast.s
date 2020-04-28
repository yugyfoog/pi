	.align	16
	.globl	fast_set
fast_set:
	lea	(%rdi,%rsi,8),%rdi
	neg	%rsi
1:	mov	%rdx,(%rdi,%rsi,8)
	inc	%rsi
	jnz	1b
	ret

	.align	16
	.globl	fast_copy
fast_copy:
	lea	(%rdi,%rdx,8),%rdi
	lea	(%rsi,%rdx,8),%rsi
	neg	%rdx
1:	mov	(%rsi,%rdx,8),%rax
	mov	%rax,(%rdi,%rdx,8)
	inc	%rdx
	jnz	1b
	ret
	
	.align	16
	.globl	fast_multiply
fast_multiply:
	xchg	%rcx,%rdx
	mov	%r8,%rax
	lea	(%rdi,%rcx,8),%rdi
	lea	(%rsi,%rcx,8),%rsi
	neg	%rcx		;
	clc
1:	mulx	(%rsi,%rcx,8),%r8,%r9
	adc	%rax,%r8
	mov	%r8,(%rdi,%rcx,8)
	mov	%r9,%rax
	inc	%rcx
	jnz	1b
	adc	$0,%rax
	ret
	
