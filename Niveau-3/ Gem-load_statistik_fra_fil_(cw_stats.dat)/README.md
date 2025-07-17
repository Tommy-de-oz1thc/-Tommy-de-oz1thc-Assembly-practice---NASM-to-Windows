# Opgave 1: Gem og load statistik

## Formål
Gem CW-statistik til fil og hent den ved opstart.

## Funktion
Brug file I/O til at gemme og hente 10 bytes.

## Det jeg har lært
Filoperationer i Assembly, open/read/write.
Jeg lærte at læse en txt fil og rette add 1 eller 3  til værdien 12 og skrive 13 eller 14 ned i txt filen igen.

## Link
nasm -f win32 main.asm -o main.obj

gcc -m32 main.obj -o loop.exe
