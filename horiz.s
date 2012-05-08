##############################
#
# Homework 4, Problem 2
#
# Write a function that draws a horizontal line
# in a text "framebuffer" consisting of 32 lines of
# 63 characters (plus a newline).
#
# The byte address of a character in the framebuffer is
#
#    fb + 64 * y + x
#
# In C, its declaration would be
#
#   void horiz(int x0, int x1, int y);
#
# Your implementaiton must adhere to the MIPS calling conventions
# and use this template.  Modify the file only where indicated.
#
##############################
	# x0, the starting column, is in $a0
	# x1, the ending column, is in $a1
	# y, the row, is in $a2
horiz:

	####################
	#
	# Your solution goes here
	#
	###################

	#loop from x0 to x1,
	#inserting '+' into fb at fb + 64 * y + x
	li $t0, 1	#load address step size, needed once, will be overwritten
	addi $a1, $a1, 1
	la $t1, fb	#load fb address.
	li $t2, '+'	#the symbol we enter into the frame buffer.
	li $t3, 64
	mult $a2, $t3
	mflo $t4
	addu $t4, $t4, $t1
	mult $a0, $t0
	mflo $t0
	addu $t4, $t4, $t0
	#la $t5, $t4
	blt $a0, $a1, L2
retdone:
	j $ra
	
L2:
	sb $t2, ($t4)
	#sw $t1, $t2(fb)
	addiu $t4, $t4, 1 #increment address
	addiu $a0, $a0, 1 #increment conditional counter
	blt $a0, $a1, L2
	bge $a0, $a1, retdone

# Draw an image that looks like
#
# +++++++++++++++++++
#
#          +
#         +++
#        +++++
#       +++++++
#      +++++++++
#     +++++++++++
#    +++++++++++++
#   +++++++++++++++
#
# +++++++++++++++++++
#
# See "horiz-output.txt" for the exact output

main:
	# Draw a line along the top
	li $a0, 0
	li $a1, 62
	li $a2, 0
	jal horiz

	# Draw a line along the bottom
	li $a0, 0
	li $a1, 62
	li $a2, 31
	jal horiz

	# Draw a triangle from the bottom up
	# First line is (4 - 58) @ 29
	# Next is       (5 - 57) @ 28
	# Last is       (31 - 31) @ 2
	li $s0, 4 # x0
	li $s1, 58  # x1
	li $s2, 29 # y
	b L97
L96:
	addiu $s0, $s0, 1
	addiu $s1, $s1, -1
	addiu $s2, $s2, -1
L97:	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	jal horiz
	slt $t0, $s0, $s1
	bne $t0, $0, L96

	li $v0, 4
	la $a0, fb
	syscall    # Print the framebuffer
	
	li $v0, 10 # exit
	syscall

	
	.data
	
fb:	# Each line is exactly 64 characters: 63 spaces plus a newline
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .ascii "                                                               \n"
  .asciiz "                                                               \n"
