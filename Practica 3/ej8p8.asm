.data 

array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
long: .word 10
suma: .word 0

.text

lw $s1, long
lw $s2, suma
la $s0, array

sumatorio:
	#movimiento dentro del vector
	add $t1, $s0, $t0
	addi $s3, $s3, 1
	lw $t2, 0($t1) #acceso a palabra
	add $s2, $s2, $t2
	#desplazamiento en x palabras
	sll $t0, $s3, 2
	bne $s3, $s1, sumatorio
	j media
	
	
media:
	 mtc1 $s2, $f0 #mover al coprocesador 1 la suma
	 mtc1 $s1, $f1 #mover al coprocesador 1 la longitud
	 cvt.s.w $f0, $f0 #cambiamos a simple precision
	 cvt.s.w $f1, $f1 #cambiamos a simple precision
	 div.s $f12, $f0, $f1 #division
	 li $v0, 2 #mostrado
	 syscall
	 
	 li $v0, 10
	 syscall
	 