.data
intro: .asciiz "Introduce un numero: "
A: .word 2, 4, 6, 8 ,10
B: .word 0:4 #vector de cinco posiciones que son 0s
C: .space 50


.text
la $s0, A
la $s1, B
la $s2, C
li $s5, 5

rellena_B:
	addi $s3, $s3, 1 #contador
	add $t2, $s1, $t0 #desplazar el vector B tantas palabras como numeros llevemos introducidos
	la $a0, intro
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	sw $t1, 0($t2) #introducir en el vector mediante el puntero
	sll $t0, $s3, 2 #desplazarnos 2 bits, es decir el tamaño de palabra
	bne $s3, $s5, rellena_B #volver a hacer el modulo si no hemos hecho 5
	j loop #saltar al bucle de suma
	
loop:
	#carga de la posicion en el vector
	add $t1, $s0, $t0
	add $t2, $s1, $t0
	add $t3, $s2, $t0
	
	addi $s4, $s4, 1 #incrementar el contador
	
	lw $t4, 0($t1) #cargar palabra de A
	lw $t5, 0($t2) #cargar la palabra de B
	
	add $t6, $t4, $t5 #suma de A+B
	sw $t6, 0($t3) #introduccion en C

	sll $t0, $s4, 2
	bne $s4, $s5, loop
	 
	
li $v0, 10
syscall
