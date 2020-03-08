.data 
min: .asciiz "Introduce los minutos: "
seg: .asciiz " segundos."

.text
	#cadena de peticion de datos para mayor visibilidad
	la $a0, min
	li $v0, 4	
	syscall
	
	li $v0, 5
	syscall
	move $a0, $v0
	jal multiplicacion
	move $a0, $v0
	jal imprim
	li $v0, 10		 
	syscall
		
	
imprim: addi $v0, $zero, 1
	syscall
	la $a0, seg #mostrar la cadena segundos, para que sea mas visible
	li $v0, 4
	syscall	
	jr $ra #vuelve a jal multiplicacion
	
# 60 = 2^5 + 2^4 + 2^3 + 2^2
#calculado en registros temporales auxiliares y despues devuelvo en v0
multiplicacion:	move $t0, $a0  
		sll $t1, $t0, 5
		add $t2, $t2, $t1
		sll $t1, $t0, 4
		add $t2, $t2, $t1
		sll $t1, $t0, 3
		add $t2, $t2, $t1		
		sll $t1, $t0, 2
		add $t2, $t2, $t1
		move $v0, $t2
		jr $ra
