.data
	HelloWorld:
		.asciz "Hello World!\n"

.text

.globl _start
.type PrintFunction, @function	
	

	PrintFunction:
		pushl %ebp  		# Store the current value of EBP
		movl %esp, %ebp  	# Make EBP point the top of stack

		movl $4, %eax
		movl $1, %ebx
		movl 8(%ebp), %ecx
		movl 12(%ebp), %edx
		int $0x80
	
		movl %ebp, %esp  	# Restore the old value of ESP
		popl %ebp		# Restore the old value of EBP
		ret 			# Change EIP to start the net instruction

	_start:	
		nop

		pushl $13
		pushl $HelloWorld
		call PrintFunction
		addl $8, %esp
	ExitCall:
		movl $1, %eax
		movl $0, %ebx
		int $0x80
		
