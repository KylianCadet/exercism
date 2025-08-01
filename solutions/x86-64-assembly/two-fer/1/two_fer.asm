default rel
section .rodata
	msg_start: db "One for ", 0
	msg_default_friend: db "you", 0
	msg_end: db ", one for me.", 0

%macro str_cpy 3
lea rbx, [%2]
.copy_loop_%1:
	mov al, [rbx]
	cmp al, 0
	je .end_copy_%1
	mov [%3], al
	inc rbx
	inc %3
	jmp .copy_loop_%1
.end_copy_%1:
%endmacro

section .text
global two_fer
two_fer:
	str_cpy 1, msg_start, rsi
	cmp rdi, 0
	je two_fer_default
	str_cpy 2, rdi, rsi
	jmp two_fer_end
two_fer_default:
	str_cpy 2, msg_default_friend, rsi
two_fer_end:
	str_cpy 3, msg_end, rsi
	mov byte [rsi], 0
	ret

%ifidn __OUTPUT_FORMAT__,elf64:
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
