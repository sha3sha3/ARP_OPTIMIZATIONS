	.file	"totalsense.c"
	.text
	.section	.rodata
.LC0:
	.string	"Plar Name: %s\n"
.LC1:
	.string	"Difficulty: %s\n"
.LC2:
	.string	"Starting Level: %d\n"
	.text
	.type	logConfig, @function
logConfig:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	addq	$100, %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-8(%rbp), %rax
	movl	200(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	logConfig, .-logConfig
	.section	.rodata
.LC3:
	.string	"r"
.LC4:
	.string	"appsettings.json"
.LC5:
	.string	"Error opening the file"
.LC6:
	.string	"Error parsing the file"
.LC7:
	.string	"PlayerName"
.LC8:
	.string	"Difficulty"
.LC9:
	.string	"StartingLevel"
.LC10:
	.string	"totalsense.c"
.LC11:
	.string	"[%d] at %s:\n"
.LC12:
	.string	"Player Name: %s\n"
.LC13:
	.string	"Preferences"
.LC14:
	.string	"Class"
.LC15:
	.string	"Class: %s\n"
.LC16:
	.string	"StartingPoints"
.LC17:
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
	subq	$1104, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rsi
	leaq	.LC4(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -1088(%rbp)
	cmpq	$0, -1088(%rbp)
	jne	.L3
	leaq	.LC5(%rip), %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L9
.L3:
	movq	-1088(%rbp), %rdx
	leaq	-1040(%rbp), %rax
	movq	%rdx, %rcx
	movl	$1024, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fread@PLT
	movl	%eax, -1096(%rbp)
	movq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	cJSON_Parse@PLT
	movq	%rax, -1080(%rbp)
	cmpq	$0, -1080(%rbp)
	jne	.L5
	leaq	.LC6(%rip), %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L9
.L5:
	movl	$8, %edi
	call	malloc@PLT
	movq	%rax, -1072(%rbp)
	movq	-1080(%rbp), %rax
	leaq	.LC7(%rip), %rsi
	movq	%rax, %rdi
	call	cJSON_GetObjectItemCaseSensitive@PLT
	movq	32(%rax), %rax
	movq	-1072(%rbp), %rdx
	addq	$100, %rdx
	movq	%rax, %rsi
	movq	%rdx, %rdi
	call	strcpy@PLT
	movq	-1080(%rbp), %rax
	leaq	.LC8(%rip), %rsi
	movq	%rax, %rdi
	call	cJSON_GetObjectItemCaseSensitive@PLT
	movq	32(%rax), %rdx
	movq	-1072(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-1080(%rbp), %rax
	leaq	.LC9(%rip), %rsi
	movq	%rax, %rdi
	call	cJSON_GetObjectItemCaseSensitive@PLT
	movl	40(%rax), %edx
	movq	-1072(%rbp), %rax
	movl	%edx, 200(%rax)
	leaq	.LC10(%rip), %rdx
	movl	$38, %esi
	leaq	.LC11(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-1072(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC12(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-1072(%rbp), %rax
	addq	$100, %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-1072(%rbp), %rax
	movl	200(%rax), %eax
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-1080(%rbp), %rax
	leaq	.LC13(%rip), %rsi
	movq	%rax, %rdi
	call	cJSON_GetObjectItemCaseSensitive@PLT
	movq	%rax, -1064(%rbp)
	movq	-1064(%rbp), %rax
	leaq	.LC14(%rip), %rsi
	movq	%rax, %rdi
	call	cJSON_GetObjectItemCaseSensitive@PLT
	movq	32(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC15(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-1064(%rbp), %rax
	leaq	.LC16(%rip), %rsi
	movq	%rax, %rdi
	call	cJSON_GetObjectItem@PLT
	movq	%rax, -1056(%rbp)
	movq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	cJSON_GetArraySize@PLT
	movl	%eax, -1092(%rbp)
	movl	$0, -1100(%rbp)
	jmp	.L6
.L8:
	movl	-1100(%rbp), %edx
	movq	-1056(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	cJSON_GetArrayItem@PLT
	movq	%rax, -1048(%rbp)
	movq	-1048(%rbp), %rax
	movq	%rax, %rdi
	call	cJSON_IsNumber@PLT
	testl	%eax, %eax
	je	.L7
	movq	-1048(%rbp), %rax
	movl	40(%rax), %eax
	movl	-1100(%rbp), %edx
	leal	1(%rdx), %ecx
	movl	%eax, %edx
	movl	%ecx, %esi
	leaq	.LC17(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L7:
	addl	$1, -1100(%rbp)
.L6:
	movl	-1100(%rbp), %eax
	cmpl	-1092(%rbp), %eax
	jl	.L8
	movq	-1080(%rbp), %rax
	movq	%rax, %rdi
	call	cJSON_Delete@PLT
	movq	-1072(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	movl	$0, %eax
.L9:
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
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
