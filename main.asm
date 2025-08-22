.globl main
.globl plancia

.data
plancia: .space 63

msg:     .asciiz "\n-------------------\nNuova partita\n-------------------\n"
msg1:    .asciiz "\nVince il giocatore: "
prompt:  .asciiz "\nGioca ancora (1 sì, no altrimenti): "

.text
main:
main_loop:
    li    $v0, 4
    la    $a0, msg
    syscall

    jal   initPlancia
    jal   disegnaPlancia

    li    $s0, 1

game_loop:
    move  $a0, $s0
#beq $a0 -1 playerAI   # SCOMMENTAMI PER GIOCARE CONTRO AI
playerUmano:
    jal   chiediMossa
    j     dopo

playerAI:
    li    $a1, 0
    jal   trovaMiglioreAiRicorsivo

dopo:
    move  $a0, $v0
    beq   $a0, -1, end_game

    move  $a1, $s0
    jal   giocaMossa

    jal   disegnaPlancia

    jal   valutaScacchiera
    move  $a0, $v0
    li    $v0, 1
    syscall

    jal   checkVittoria
    move  $s3, $v0

    beq   $s3, 1, vincita
    beq   $s3, -1, vincita

    j     cambio_guardia

vincita:
    li    $v0, 4
    la    $a0, msg1
    syscall

    move  $a0, $s3
    li    $v0, 1
    syscall

    j     end_game

cambio_guardia:
    mul   $s0, $s0, -1
    j     game_loop

end_game:
    li    $v0, 4
    la    $a0, prompt
    syscall

    li    $v0, 5
    syscall
    move  $t0, $v0

    bne   $t0, 1, end_main
    j     main_loop

end_main:
    li    $v0, 10
    syscall
