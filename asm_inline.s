	.file	"totalsense.c"
	.text
	.section	.rodata
.LC0:
	.string	"r"
.LC1:
	.string	"appsettings.json"
.LC2:
	.string	"Error opening the file"
.LC3:
	.string	"Error parsing the file"
.LC4:
	.string	"PlayerName"
.LC5:
	.string	"Difficulty"
.LC6:
	.string	"StartingLevel"
.LC7:
	.string	"totalsense.c"
.LC8:
	.string	"[%d] at %s:\n"
.LC9:
	.string	"Player Name: %s\n"
.LC10:
	.string	"Difficulty: %s\n"
.LC11:
	.string	"Starting Level: %d\n"
.LC12:
	.string	"Preferences"
.LC13:
	.string	"Class"
.LC14:
	.string	"Class: %s\n"
.LC15:
	.string	"StartingPoints"
.LC16:
	.string	"StartingPoint [%d]: %d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1120, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -1096(%rbp)
	cmpq	$0, -1096(%rbp)
	jne	.L2
	leaq	.LC2(%rip), %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L8
.L2:
	movq	-1096(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1024, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	movl	%eax, -1104(%rbp)
	movq	-1096(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	cJSON_Parse@PLT
	movq	%rax, -1088(%rbp)
	cmpq	$0, -1088(%rbp)
	jne	.L4
	leaq	.LC3(%rip), %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L8
.L4:
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -1080(%rbp)
	movq	-1088(%rbp), %rax
	leaq	.LC4(%rip), %rsi
	movq	%rax, %rdi
	call	cJSON_GetObjectItemCaseSensitive@PLT
	movq	32(%rax), %rax
	movq	-1080(%rbp), %rdx
	addq	$100, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy@PLT
	movq	-1088(%rbp), %rax
	leaq	.LC5(%rip), %rsi
	movq	%rax, %rdi
	call	cJSON_GetObjectItemCaseSensitive@PLT
	movq	32(%rax), %rdx
	movq	-1080(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-1088(%rbp), %rax
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	call	cJSON_GetObjectItemCaseSensitive@PLT
	movl	40(%rax), %edx
	movq	-1080(%rbp), %rax
	movl	%edx, 200(%rax)
	leaq	.LC7(%rip), %rdx
	movl	$38, %esi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-1080(%rbp), %rax
	movq	%rax, -1048(%rbp)
	movq	-1048(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-1048(%rbp), %rax
	addq	$100, %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-1048(%rbp), %rax
	movl	200(%rax), %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	movq	-1088(%rbp), %rax
	leaq	.LC12(%rip), %rsi
	movq	%rax, %rdi
	call	cJSON_GetObjectItemCaseSensitive@PLT
	movq	%rax, -1072(%rbp)
	movq	-1072(%rbp), %rax
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	call	cJSON_GetObjectItemCaseSensitive@PLT
	movq	32(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-1072(%rbp), %rax
	leaq	.LC15(%rip), %rsi
	movq	%rax, %rdi
	call	cJSON_GetObjectItem@PLT
	movq	%rax, -1064(%rbp)
	movq	-1064(%rbp), %rax
	movq	%rax, %rdi
	call	cJSON_GetArraySize@PLT
	movl	%eax, -1100(%rbp)
	movl	$0, -1108(%rbp)
	jmp	.L5
.L7:
	movl	-1108(%rbp), %edx
	movq	-1064(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cJSON_GetArrayItem@PLT
	movq	%rax, -1056(%rbp)
	movq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	cJSON_IsNumber@PLT
	testl	%eax, %eax
	je	.L6
	movq	-1056(%rbp), %rax
	movl	40(%rax), %eax
	movl	-1108(%rbp), %edx
	leal	1(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC16(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L6:
	addl	$1, -1108(%rbp)
.L5:
	movl	-1108(%rbp), %eax
	cmpl	-1100(%rbp), %eax
	jl	.L7
	movq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	cJSON_Delete@PLT
	movq	-1080(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
.L8:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
