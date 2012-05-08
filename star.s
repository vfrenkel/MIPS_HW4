##############################
#
# Homework 4, Problem 3
#
# Write a function that draws arbitrary lines
# in a text "framebuffer" consisting of 32 lines of
# 63 characters (plus a newline).
#
# In C, its declaration would be
#
#   void line(int x0, int y0, int x1, int y1);
#
# Your implementaiton must adhere to the MIPS calling conventions
# and use this template.  Modify the file only where indicated.
#
# Base your code on the C implementation in star.c.
#
# You do not have to follow it exactly.  E.g., I did not
# write an assembly subroutine for plot().
#
# Consider using the MIPS assembler pseudoinstruction
#	
#   abs rd, rs
#
# which places the absolute value of the two's-complement
# contents of rs in rd.
#
# The byte address of a character in the framebuffer is
#
#    fb + 64 * y + x
#
##############################
	# x0 and y0, the starting coordinates, are in $a0 and $a1
	# x1 and y1, the ending coordinates, are in $a2 and $a3

line:

	####################
	#
	# Your solution goes here
	#
	###################

	li $t0, '*' 		#load up drawing symbol.
	sub $t2, $a2, $a0 	#dx
	sub $t3, $a3, $a1 	#dy
	abs $t2, $t2
	abs $t3, $t3

	slt $t9, $t2, $t3
	bge $t2, $t3, L3 	#if steep
	move $t4, $a0
	move $a0, $a1
	move $a1, $t4

	move $t4, $a2
	move $a2, $a3
	move $a3, $t4
L3:
	bge $a2, $a0, L4 	#if (x1 < x0)
	move $t4, $a0
	move $a0, $a2
	move $a2, $t4

	move $t4, $a1
	move $a1, $a3
	move $a3, $t4
L4:
	sub $t2, $a2, $a0
	sub $t3, $a3, $a1
	abs $t3, $t3 		#dy = abs(y1 - y0)
	
	#ystep
	bge $a1, $a3, L5
	li $t5, 1
	j SR
L5:	
	li $t5, -1
SR:	
	srl $t6, $t2, 1
	
	la $t7, fb
	li $t8, 64
	
FORDRW:
	bne $t9, $zero, L7 	#if (steep)
	#else block
	mult $a1, $t8		#y0 * 64
	mflo $t1
	addu $t1, $t1, $a0	#y0 * 64 + x0
	addu $t1, $t1, $t7	#y0 * 64 + x0 + fb
	j L8
L7:
	#true block
	mult $a0, $t8		#x0 * 64
	mflo $t1
	addu $t1, $t1, $a1	#x0 * 64 + y0
	addu $t1, $t1, $t7	#x0 * 64 + y0 + fb

L8:	
	sb $t0, ($t1)

	beq $a0, $a2, done	#if(x0 == x1) break

	addi $a0, $a0, 1
	sub $t6, $t6, $t3

	bgez $t6, FORDRW
	add $a1, $a1, $t5
	add $t6, $t6, $t2

	b FORDRW
	
done:
	j $ra
	
	
	
	
# Draw an image that looks like
#
#               *              
#              * *               
#             *   *              
#             *   *            
#  ***************************  
#    **     *       *      *    
#      **   *       *   **      
#         **         **         
#          * **    ** *         
#         *   *****   *         
#         *   *   *   *        
#        *  *        * *         
#        *             *       
#
# See "star-output.txt" for the exact output

main:
	li $a0, 31
	li $a1, 1
	li $a2, 47
	li $a3, 28
	jal line
	
	li $a0, 57
	li $a1, 11
	li $a2, 14
	li $a3, 28
	jal line

	li $a0, 47
	li $a1, 28
	li $a2, 4
	li $a3, 11
	jal line

	li $a0, 14
	li $a1, 28
	li $a2, 30
	li $a3, 1
	jal line

	li $a0, 4
	li $a1, 11
	li $a2, 57
	li $a3, 11
	jal line

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
