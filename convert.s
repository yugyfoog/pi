	.globl	convert_64_string
convert_64_string:
	lea	20(%rdi),%rdi
	movb	$0,(%rdi)
	mov	%dl,%dh	
	movzx	%dx,%eax	
	shl	$16,%eax	
	add	%eax,%edx	
	mov	%edx,%eax	
	shl	$32,%rax	
	add	%rax,%rdx	
	mov	%rdx,-20(%rdi)	
	mov	%rdx,-12(%rdi)
	mov	%edx,-4(%rdi)
	movabs	$14757395258967641293,%rdx
1:	dec	%rdi
	mulx	%rsi,%rcx,%rax
	shr	$3,%rax
	lea	(%rax,%rax,4),%rcx
	add	%rcx,%rcx
	sub	%rcx,%rsi
	add	$'0',%sil
	mov	%sil,(%rdi)
	mov	%rax,%rsi
	test	%rsi,%rsi
	jnz	1b
	mov	%rdi,%rax
	ret

	.globl	convert_string_64
convert_string_64:
	xor	%eax,%eax
1:	movzxb	(%rdi),%rdx
	sub	$'0',%rdx
	jb	3f
	lea	(%rax,%rax,4),%rax
	add	%rax,%rax
	add	%rdx,%rax
	inc	%rdi
	jmp	1b
3:	ret
