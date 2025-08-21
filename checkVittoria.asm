.globl checkVittoria
checkVittoria:
    la    $t0, plancia
    li    $t1, 2
    li    $t9, 0
    li    $t8, 36
    li    $t7, 49

sfolgiaPos:
    lb    $t2, 0($t0)
    beq   $t2, $t1, incremento
    beqz  $t2, incremento

oriz:
    lb    $t3, 1($t0)
    bne   $t2, $t3, diagDx

    lb    $t3, 2($t0)
    bne   $t2, $t3, diagDx

    lb    $t3, 3($t0)
    bne   $t2, $t3, diagDx
    j     vinto

diagDx:
    bge   $t9, $t8, incremento

    lb    $t3, 10($t0)
    bne   $t2, $t3, vert

    lb    $t3, 20($t0)
    bne   $t2, $t3, vert

    lb    $t3, 30($t0)
    bne   $t2, $t3, vert
    j     vinto

vert:
    lb    $t3, 9($t0)
    bne   $t2, $t3, diagSx

    lb    $t3, 18($t0)
    bne   $t2, $t3, diagSx

    lb    $t3, 27($t0)
    bne   $t2, $t3, diagSx
    j     vinto

diagSx:
    lb    $t3, 8($t0)
    bne   $t2, $t3, incremento

    lb    $t3, 16($t0)
    bne   $t2, $t3, incremento

    lb    $t3, 24($t0)
    bne   $t2, $t3, incremento
    j     vinto

incremento:
    bge   $t9, $t7, fine
    addi  $t0, $t0, 1
    addi  $t9, $t9, 1
    j     sfolgiaPos

vinto:
    move  $v0, $t2
    jr    $ra

fine:
    move  $v0, $zero
    jr    $ra
