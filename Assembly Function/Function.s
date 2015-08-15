.data
	HelloWorld:
		.asciz "Hello World!\n"
	HelloFunction:
		.asciz "Hello Function!\n"

.text

.globl _start
	
	.type MyFunction, @function

	MyFunction:
		movl $4, %eax
		movl $1, %ebx
		int $0x80
		ret

	_start:
		nop
		leal HelloWorld, %ecx
		movl $14, %edx
		call MyFunction
		
		leal HelloFunction, %ecx
		movl $17, %edx
		call MyFunction

	ExitCall:
		movl $1, %eax
		movl $0, %ebx
		int $0x80
		
