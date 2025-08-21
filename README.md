Forza 4 in Assembly MIPS

Un’implementazione del gioco Forza 4 scritta interamente in Assembly MIPS, eseguibile su MARS
.

📖 Descrizione

Il progetto riproduce una versione testuale di Connect Four (Forza 4).
Le funzioni principali gestiscono:

La plancia di gioco (6 righe x 7 colonne, con delimitazioni a muro).

L’inserimento di una pedina in una colonna scelta.

La verifica delle mosse valide (colonna piena / non piena).

Il controllo delle condizioni di vittoria (orizzontale, verticale e diagonale).

La possibilità di giocare Umano vs Umano o Umano vs AI (semplice ricorsione di valutazione).

Gestione della partita multipla con richiesta di “giocare ancora”.

🗂 Struttura del progetto

main.asm → ciclo principale del gioco e gestione giocatori

disegnaPlancia.asm → stampa a schermo della plancia

chiediMossa.asm → input da utente (colonna o fine partita)

giocaMossa.asm → inserimento effettivo della pedina nella colonna scelta

checkVittoria.asm → verifica se un giocatore ha vinto

initPlancia.asm → inizializzazione tabellone

valutaScacchiera.asm / trovaMiglioreAiRicorsivo.asm → funzioni per AI

▶️ Esecuzione

Aprire MARS.

Caricare tutti i file .asm del progetto.

Impostare main.asm come program entry.

Avviare il programma con Assemble (F3) e poi Run (F5).

🎮 Regole implementate

Inserire la colonna (da 1 a 7) in cui giocare.

Se la colonna è piena, verrà richiesto di sceglierne un’altra.

È possibile terminare la partita digitando f.

Vince il giocatore che allinea 4 pedine consecutive (orizzontale, verticale o diagonale).

🛠 Requisiti

MARS MIPS Simulator
 (Java necessario).

🚀 Idee per estensioni

AI più avanzata con minimax.

Timer per le mosse.

Interfaccia grafica minimale usando bitmap display di MARS.
