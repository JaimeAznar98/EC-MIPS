.data
A: .asciiz "Introduce A: "
B:  .asciiz "Introduce B: "

.text

#A
la $a0, A
li $v0, 4
syscall
li $v0,5 
syscall
move $t0, $v0 #quiero volver a usar a0 para pedir B

#B
la $a0, B
li $v0, 4
syscall

li $v0, 5
syscall

move $a0, $t0 #muevo a a0 el valor de A guardado en t0
move $a1, $v0 #muevo a a1 el valor recien leido de B

blt $a0, $a1, eti # A < B
li $v0, 1
syscall
j acabar #salto al final del problema

eti: 	move $a0, $a1
	li $v0, 1
	syscall
	j acabar #innecesario pero mejor para guiar la ejecucion

	
acabar: li $v0, 10
	syscall
	
