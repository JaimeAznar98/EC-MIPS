.data
	cadena: .space 32
	
	.eqv ControlTeclado 0
	.eqv BufferTeclado 4
	.eqv ControlDisplay 8
	.eqv BufferDisplay 12
	
.text
	la $a0, cadena
	jal read_string
	la $a0, cadena
	jal print_string 
	
	li $v0, 10
	syscall
	

print_string:
	la $t0, 0xFFFF0000
sync:
	lw $t1, ControlDisplay($t0)
	andi $t1, $t1, 1
	beqz $t1, sync
	
	lbu $t1, 0($a0)
	beqz $t1, final
	sw $t1, BufferDisplay($t0)
	addi $a0, $a0,1
	j sync
final:
	jr $ra

read_string:
lui $t0, 0xffff
lectura_caracter:
	lw $t2, ($t0)
	andi $t2, $t2, 1
	beqz $t2, lectura_caracter
	lb $t3, BufferTeclado($t0)
	sb $t3, 0($a0)
	addi $a0, $a0, 1
	bne $t3, 10, read_string
	jr $ra
	

		
	
