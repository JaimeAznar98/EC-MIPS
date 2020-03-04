.text

	li $a0, '>'
	li $v0, 11
	syscall
	li $v0, 5
	syscall
	move $a0, $v0
	jal suma
	move $a0, $v0
	jal imprim
	li $v0, 10		 #necesitamos poner esto, sino el codigo queda en bucle
	syscall

suma: 	move $t0, $a0 		#movemos a un registro temporal para no modificar su contenido
	add $t0, $t0, $t0 	#n + n
	add $t0, $t0, $t0 	#2n + 2n
	move $v0, $t0 		#el valor se devuelve en $v0
	jr $ra 			#volvemos al punto donde dejamo el codigo en "jal suma"
	
imprim: addi $v0, $zero, 1
	syscall
	li $a0, '\n'
	li $v0, 11
	syscall
	jr $ra
