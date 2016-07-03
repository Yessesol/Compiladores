#/bin/bash
bison -d analizadorsintactico.y
flex analizador.l
gcc -o analizadorsintactico lex.yy.c analizadorsintactico.tab.c
./analizadorsintactico
