.data 
	A: .word 0
	B: .word 0
	
	
	in_A: .asciiz "Introduce el caracter A: "
	in_B: .asciiz "Introduce el caracter B: "
	
.text
	la $a0, in_A
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	sw $v0, A #guardar en A
	
	la $a0, in_B
	li $v0, 4
	syscall

	li $v0, 5
	syscall
			
	sw $v0, B #guardar en B
	
	#cargamos las direcciones de memoria
	la $t0, A 
	la $t1, B 
	 
	#accedemos a la palabra en la posicion 
	lw $a0, 0($t0)
	lw $a1, 0($t1)
	
	#comparacion
	bge $a0, $a1, mayor_B
	li $v0, 1
	syscall
	li $a0, ','
	li $v0, 11
	syscall
	move $a0, $a1
	li $v0, 1
	syscall
	
	j acabar
	
	mayor_B:	move $a2, $a0
			move $a0, $a1
			li $v0,1
			syscall
			li $v0, 11
			li $a0, ','
			syscall
			move $a0, $a2
			li $v0, 1
			syscall
			
		
			j acabar
	
	#lw $t1, 0($t0)
	#add $t1, $t1, $t1
	#sw $t1, A
	#la $t2, A
	#lw $t3, 0($t2)

acabar: li $v0, 10
	syscall