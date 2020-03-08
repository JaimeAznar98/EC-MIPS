.data

salida: .asciiz "ERROR, B tiene que ser mayor que A"

.text
li $v0, 5
syscall

move $a0, $v0
li $v0, 5
syscall

move $a1, $v0

bge $a0, $a1, salida_mal

j bucle




salida_mal: la $a0, salida
	li $v0, 4
	syscall
	li $v0, 10
	syscall
	
	
bucle: li $v0, 1
	syscall
	add $a0, $a0, 1
	bgt $a0, $a1, salida_bucle
	j bucle
	
salida_bucle: li $v0, 10
		syscall
	
	
