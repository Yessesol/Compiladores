%{
#include <stdlib.h>
void yyerror(char *);
#include "analizadorsintactico.tab.h"
%}
%option yylineno
%option lex-compat
    
PALABRAS_RESERVADAS "if"|"then"|"else"|"while"|"do"|"input"|"output"|"return"
TIPO_VARIABLE "char"|"int"|"float"|"bool"|"string" 
CARACTERES_ESPECIALES  "<="|";"|"+"|"-"|"*"|"/"|"<"|">"|"="|"!"|"&"|"$"
AGRUPADORES "{"|"}"|"("|")"
OP_COMP  ">="|"<="|"!="|"&&"|"||"|"=="
IDENTIFICADOR  [a-z][_a-zA-Z0-9]*
FUNCION  {IDENTIFICADOR}"()"
ENTERO_POSITIVO [0-9]+
ENTERO  -?[0-9]+
FLOTANTE  {ENTERO}"."[0-9]+
BOOL true|false
CARACTER  '[^ \n\t]'
STRING  \"[^\n\t]+\"
COMEN_UNICA  "//".*
COMEN_MULTIPLE  "/*"[^"/"]*"*/"
DOS_PUNTOS ":"
CORCH_A "["
CORCH_C "]"
%%
{PALABRAS_RESERVADAS}		return PALABRAS_RESERVADAS;
{TIPO_VARIABLE} 		return TIPO_VARIABLE;
{CARACTERES_ESPECIALES}		return CARACTERES_ESPECIALES;
{OP_COMP}			return OP_COMP;
{IDENTIFICADOR}			return IDENTIFICADOR; 
{FUNCION}			return FUNCION; 
{ENTERO_POSITIVO}		return ENTERO_POSITIVO;
{ENTERO}         		return ENTERO;
{FLOTANTE}			fprintf(yyout,"float: %s \n", yytext); 
{BOOL}				fprintf(yyout,"bool: %s \n", yytext); 
{CARACTER}			fprintf(yyout,"char: %s \n", yytext); 
{STRING}			fprintf(yyout,"string: %s \n", yytext); 
{COMEN_UNICA}			fprintf(yyout,"Comentario de unica linea: %s \n", yytext); 
{COMEN_MULTIPLE}		fprintf(yyout,"Comentario multiple: %s \n", yytext);
[ \t]+               		
[\n]				yylineno++; 
.				fprintf(yyout,"error: %s %d \n", yytext, yylineno/2); 

%%
int main(int argc, char *argv[])
{
 if(argc != 3){
 printf("Parámetros incorrectos\n Uso:%s ejemplo.txt salida.txt\n", argv[0]);
 return 0;
 }
 yyin = fopen(argv[1], "rt");
 if(yyin == NULL){
 printf("Imposible abrir archive de entrada %s\n",argv[1]);
 return 0;
 }
 yyout= fopen(argv[2], "wt");
 if(yyout == NULL){
 printf("Imposible abrir archivo de salida %s\n",argv[2]);
 return 0;
 }
 fprintf(yyout,"Tabla de Resultados:\n\n"); 
 yylex();
 return 0;
}
