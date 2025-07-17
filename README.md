# Assembly-practice---NASM-to-Windows

========================================

Niveau 1 – Grundlæggende
------------------------
1. UdsAssembly Øvelser - NASM til Windowskriv tallene 1–10 med _printf
Lav et loop fra 1 til 10, og udskriv hvert tal med _printf. Brug eax/ebx som tællere.

2. Toggle et flag med XOR
Definér en variabel 'flag db 1'. Skift mellem 0 og 1 ved hjælp af XOR, og vis værdien.

3. Funktion: Returnér summen af to tal
Lav en funktion 'add' som tager to parametre på stacken og returnerer deres sum.

4. Get char og vis aschii
Lav en funktion der udskriver aschii værdien for en char.

Niveau 2 – Spilrelaterede
-------------------------
4. inc_stat: Tæl bestået/dumpet
Lav en funktion der inkrementerer en statistikvariabel (pass/fail) givet en offset.

5. Statistikoversigt: Vis for flere rum
Udskriv fx: 'Rum 1: Pass=3, Fail=1'. Brug _printf og variabler pr. rum.

6. Tilfældig CW-sekvens (bogstaver A–Z)
Lav en array med bogstaver, træk 5 tilfældige og vis dem.


Niveau 3 – Avanceret
--------------------
7. Gem/load statistik fra fil (cw_stats.dat)
Ved opstart: læs 10 bytes. Ved afslutning: skriv dem tilbage. Brug open/read/write.

8. Menu med tastestyring
Lav en menu hvor brugeren vælger funktioner med tal. Fx: '1: CW', '2: Statistik'.

9. Adgangskode-funktion
Spilleren skal skrive 4 tegn korrekt (sammenlignes byte for byte med gemt kode).


Bonusøvelser
------------
*10. Alternativ afslutning afhængig af flag
Afslut spillet forskelligt afhængig af et bestemt flag (fx 'hoppet ud af vindue').

*11. Vis/skjul-tilstand og vis status
Skift vis/skjul-flag og udskriv teksten 'Tekst vises' eller 'Tekst skjult'.


