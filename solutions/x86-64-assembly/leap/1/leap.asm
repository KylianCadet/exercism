section .text
global leap_year
leap_year:
	mov rdx, 0
	mov rax, rdi
	mov rcx, 4
	div rcx
	cmp rdx, 0
	jz is_divisible_by_4
	mov eax, 0
	ret

is_divisible_by_4:
	mov rdx, 0
	mov rax, rdi
	mov rcx, 400
	div rcx
	cmp rdx, 0
	jz leap

is_divisible_by_4_but_not_400:
	mov rdx, 0,
	mov rax, rdi
	mov rcx, 100
	div rcx
	cmp rdx, 0
	jz not_leap

leap:
	mov eax, 1
	ret

not_leap:
	mov eax, 0
	ret



%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
