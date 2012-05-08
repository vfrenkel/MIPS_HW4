##############################
#
# Homework 4, Problem 1
#
# Write a function that takes two integer arguments
# and returns the one whose absolute value is larger
#
# In C, its declaration would be
#
#   int absmin(int a, int b);
#
# Your implementation must adhere to the MIPS calling conventions
# and use this template.  Modify the file only where indicated.
#
##############################

###************RECHECK/OPTIMIZE/CLEAN UP BEFORE SUBMISSION
###************DON'T NEED ANY OF THE BRANCH LABELS YOU PUT IN, JUST FAST FORWARD
###************THROUGH CODE YOU DON'T WANT TO EXECUTE (CONDITIONAL JUMPS!)
###************HORRIBLE/HACKEY CODING STYLE WITH THE jump at end of FLIPSB.

	
absmin:
	####################
	#
	# Your solution goes here
	#
	####################

	#prepare a -1 for sign flipping.
	li $t0, -1

	#store original values.
	move $t1, $a0
	move $t2, $a1
	
	#check for negative numbers, make positive if found.
	blt $a0, $zero, FLIPSA
	blt $a1, $zero, FLIPSB

RET:
	#check which number is greater and return it.
	bgt $a0, $a1, RETA
	bgt $a1, $a0, RETB
	
	
FLIPSA:
	mult $a0, $t0
	mflo $a0

FLIPSB:
	mult $a1, $t0
	mflo $a1
	b RET
	
RETA:
	move $v0, $t1
	jr $ra

RETB:
	move $v0, $t2
	jr $ra

main:
	li $a0, 10
	li $a1, -5
	jal absmin
	move $a0, $v0
	jal print_int  # Should print 10

	li $a0, -10
	li $a1, 5
	jal absmin
	move $a0, $v0
	jal print_int  # Should print -10

	li $a0, 10
	li $a1, 15
	jal absmin
	move $a0, $v0
	jal print_int  # Should print 15

	li $a0, 10
	li $a1, -15
	jal absmin
	move $a0, $v0
	jal print_int  # Should print -15

	li $v0, 10 # exit
	syscall

print_int:
	li $v0, 1 # print_int
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	jr $ra

	.data
newline:	.asciiz "\n"
	
