.data
	HelloWorldString:
		.asciz "Hello World of Assembly!"
	H3110:
		.asciz "H3110"
.bss
	.lcomm Destination, 100	
	.lcomm DestinationUsingRep, 100
	.lcomm DestinationUsingStos, 100
.text
	.globl _start
	
	_start:
		nop
		# 1. Simple copying using movsb, movsw, movsl

		movl $HelloWorldString, %esi
		movl $Destination, %edi

		movsb
		movsw
		movsl

		# 2. Setting / Clearing the DF flag

		std # set the DF flag
		cld # clear th DF flag

		# 3. Using Rep

		movl $HelloWorldString, %esi
		movl $DestinationUsingRep, %edi
		movl $25, %ecx			 # set the string length in ECX
		cld				 # clear the DF
		rep movsb
		std

		# 4. Loading string from memory into EAX register

		cld
		leal HelloWorldString, %esi
		lodsb
		movb $0, %al
		
		dec %esi
		lodsw
		movw $0, %ax
		
		subl $2, %esi
		lodsl		

		# 5. Storing Strings from EAX to memory
		
		leal DestinationUsingStos, %edi
		stosb	
		stosw
		stosl


		# 6. Comparing Strings
	
		cld
		leal HelloWorldString, %esi
		leal H3110, %edi
		cmpsb
	
		dec %esi
		dec %edi
		cmpsw

		subl $2, %esi
		subl $2, %edi
		cmpsl





		movl $1, %eax
		movl $0, %ebx
		int $0x80


