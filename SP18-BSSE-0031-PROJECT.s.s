
#file read
.data
mydata: .space 100
newLine: .asciiz "\n"
space: .asciiz " "
adress: .asciiz "C:\Users\syeda\Desktop\TESTING.txt"

.text
.globl main
main:



#opening the file

	li $v0, 13
	la $a0, adress
	
	li $a1, 0 #mode 
	syscall
	
	move $t0, $v0
	
	#reading the data
	
	li $v0, 14		#file reading
	move $a0, $t0
	
	la $a1, mydata
	li $a2, 16		#char in file
	syscall
	
	#close file
	
	li $v0 16
	move $a0, $t0
	syscall
	
	#printing array
	
	#li $v0, 4
	#la $a3, mydata		#string data in txt file
	#syscall
	
	#sw $t1, mydata
	
	#string work
	
	

	li $t3, 0 #counter

	#printing the string
	la $t1,mydata #loading starting address of array in $t1
	la $t4, space
	
	For:
		lb $t2,($t1) 	#load the character from address in $t1 
		lb $t5, ($t4)
		beqz $t2,Exit 	#if char in t2 == 0 (NULL) so jump to exit
		
		#li $v0 , 11	#opcode to print character
		#move $a0,$t2
		#syscall
		
		bne $t2, $t5, nCounter
		
		add $t3, $t3, 1
			
		nCounter:
		add $t1,$t1,1 	#address = address+1
		
		b For
	Exit:
		
		add $t3, $t3, 1
		
		li $v0, 1
		move $a0, $t3
		syscall

	
	
	#close file
	
	#li $v0 16
	#move $a0, $t0
	#syscall
		
	
	
	
	li $v0, 10
	syscall