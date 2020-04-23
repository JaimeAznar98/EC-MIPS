.text
main: 
jal getc #Llama a la funcion para obtener el caracter de teclado
move $a0, $v0
beq $a0, 10, end #Si es un salto de linea acaba
subi $a0, $a0, 32 #Resta 32 al numero que identifica el caracter para mostrarlo en mayusculas
jal putc #Imprime caracter
j main 




getc:
lui $t0, 0xffff	#Direccion de ready
espera_teclado:
lw $t2, ($t0)	#Obtiene el bit de ready
andi $t2, $t2, 1
beqz $t2, espera_teclado	#Si no se introdujo nada queda en bucle en cambio si introduce un char pasa a la siguiente instruccion
lw $v0, 4($t0)	#Carga el caracter introducido
jr $ra

putc:
espera_consola:
lw $t1,8($t0)	#Espera a que la consola este lista para mostrar el caracter
andi $t1,$t1,0x0001
beq $t1,$0,espera_consola 
sw $a0,12($t0)	#Muestra por consola el dato
jr $ra


end: 
li $v0,10 #Termina el programa
syscall
