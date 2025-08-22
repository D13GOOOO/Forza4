.text
.globl sgiocaMossa

sgiocaMossa:
    la    $t0, plancia
    add   $t1, $t0, $a0

loop:
    lb    $t2, 0($t1)
    bnez  $t2, delete
    addi  $t1, $t1, 9
    j     loop

delete:
    sb    $zero, 0($t1)
    jr    $ra
