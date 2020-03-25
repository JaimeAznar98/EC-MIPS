.data
 vector: .word -4, 2, -1, 8
 msg1: .asciiz "\n La suma de los valores positivos es = "
 msg2: .asciiz "\n La suma de los valores negativos es = "

 
 .text
 
 Principal:
 	li $v0, 4
 	la $a0, msg1 
 	syscall
 	la $a0, vector
 	li $a1, 4
 	li $v0, 0
 	
 	jal sum
 	
 	move $a0, $v0
 	li $v0, 1
 	syscall
 	li $v0, 4
 	la $a0, msg2
 	syscall
 	li $v0, 1
 	move $a0, $v1
 	syscall
 	
 	li $v0, 10
 	syscall
 	
 	 
 sum:
 	add $t0, $a0, $t1
 	addi $s1, $s1, 1
 	lw $s2, 0($t0)
 	#si es un numero positivo lo llevo a su modulo
 	bgez $s2, sumarPos 
 	#sino sera negativo	
 	b sumarNeg

#aqui aumento la variable v0 y desplazo el vector
sumarPos:
	add $v0, $v0, $s2
	sll $t1, $s1, 2
	bne $s1, $a1, sum
	jr $ra

#lo mismo con la variable v1
sumarNeg:
	add $v1, $v1, $s2
	sll $t1, $s1, 2
	bne $s1, $a1, sum
	jr $ra
	 	
 	 