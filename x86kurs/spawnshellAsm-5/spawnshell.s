.data

	Sh:
		.asciz "/bin/sh"
	Null1:
		.int 0
	AddressToSh:
		.int 0
	Null2:
		.int 0
.text
	.globl _start

_start:

	movl $Sh, AddressToSh
	movl $11, %eax
	movl $Sh, %ebx
	movl $AddressToSh , %ecx
	movl $Null2 , %edx
	
	int $0x80

	#exit

	movl $10, %ebx
	movl $1, %eax
	int $0x80

