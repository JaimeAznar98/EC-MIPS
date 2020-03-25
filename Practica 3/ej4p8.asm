
.text
li $t1, 1
li $t2, -2

#movemos ambos valores al coprocesador1
mtc1 $t1, $f0
mtc1 $t2, $f1
#los cambiamos de entero a float en simple precision
cvt.s.w $f1, $f1
cvt.s.w $f0, $f0

#los floats tienen el print en f12
mov.s $f12, $f0
li $v0, 2
syscall


li $a0, '\n'
li $v0, 11
syscall

mov.s $f12, $f1
li $v0, 2
syscall

li $v0, 10
syscall