.data
errore: .asciiz "errore"

.globl giocaMossa
.text
giocaMossa:
    move  $t0, $a0
    move  $t1, $a1

    mul   $t3, $t0, 1
    la    $t8, plancia
    add   $t3, $t3, $t8
    lb    $t4, 0($t3)
    beqz  $t4, vuota

piena:
    li    $v0, 1
    jr    $ra

vuota:
    addi  $t0, $t0, 9
    mul   $t3, $t0, 1
    add   $t3, $t3, $t8
    lb    $t4, 0($t3)
    beqz  $t4, vuota

    subi  $t0, $t0, 9
    mul   $t3, $t0, 1
    add   $t3, $t3, $t8
    beq   $t1, 1, giocatore1

    li    $t5, -1
    j     end

giocatore1:
    li    $t5, 1

end:
    sb    $t5, 0($t3)
    li    $v0, 0
    jr    $ra
