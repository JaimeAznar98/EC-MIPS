.data
Array: .float 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
long: .word 10
Suma: .float 0
out: .asciiz "El resultado del calculo de la media del vector es: "

.text

la $s0, Array
lw $s2, long


bucle_suma:
	#movimiento dentro del vector
	add $t1, $s0, $t0
	addi $s3, $s3, 1
	lwc1 $f0, 0($t1) #acceso a float
	add.s $f1, $f1, $f0 #guardamos todo en el auxiliar
	#desplazamiento en x palabras
	sll $t0, $s3, 2
	bne $s3, $s2, bucle_suma
	j media
	
media: 
	swc1 $f1, Suma #guardar resultado en la etiqueta
	mtc1 $s2, $f2 #mover la longitud del vector a float
	cvt.s.w $f2,$f2 #conversion de tipo
	div.s $f12, $f1, $f2 #division float
	la $a0, out
	li $v0, 4
	syscall
	li $v0, 2 #mostrar dato
	syscall
	
	li $v0, 10
	syscall