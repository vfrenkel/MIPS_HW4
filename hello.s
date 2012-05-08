	.data
hello:	.asciiz "Hello World!\n"
	
	.text
main:
	li $v0, 4      # print_string
	la $a0, hello  # argument 0: address of string to print
	syscall        # call print_string

	jr $ra         # return to caller
