.data
stringa:      .asciiz "\n\nInserire mossa (da colonna 1 a colonna 7, oppure f per fine parita): "
nomove:       .asciiz "colonna piena! selezionarne un'altra.\n"
finepartita:  .asciiz "partita finita! ok!"

.text
.globl chiediMossa

chiediMossa:
    la    $t0, plancia
    beq   $a0, 1, giocatoreX
    beq   $a0, -1, giocatoreO

giocatoreX:
    la    $a0, stringa
    li    $v0, 4
    syscall

    li    $v0, 12
    syscall

    beq   $v0, 'f', fine
    subi  $v0, $v0, '0'

    jr    $ra
    li    $t3, 7
    blt   $t3, $v0, giocatoreX

    add   $t1, $t0, $v0
    lb    $t2, 0($t1)
    beqz  $t2, inserisciValoreX
    la    $a0, nomove
    li    $v0, 4
    syscall
    j     giocatoreX

giocatoreO:
    la    $a0, stringa
    li    $v0, 4
    syscall

    li    $v0, 12
    syscall

    beq   $v0, 'f', fine
    subi  $v0, $v0, '0'

    jr    $ra
    li    $t3, 7
    slt   $t4, $t3, $v0
    beq   $t4, 1, giocatoreO

    add   $t1, $t0, $v0
    lb    $t2, 0($t1)
    beqz  $t2, inserisciValoreO
    la    $a0, nomove
    li    $v0, 4
    syscall
    j     giocatoreO

inserisciValoreX:
    jr    $ra

inserisciValoreO:
    jr    $ra

fine:
    la    $a0, finepartita
    li    $v0, 4
    syscall

    li    $v0, -1
    jr    $ra
