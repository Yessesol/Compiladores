%{
#include <stdlib.h>
void yyerror(char *);
#include "analizadorsintactico.tab.h"
%}
%option yylineno
%option lex-compat
TIPO_VARIABLE "char"|"int"|"float"|"bool"|"string" 
CARACTERES_ESPECIALES "&"
OP_LOGICO  "+"|"-"|"*"|"/"
OP_COMP  ">="|"<="|"<"|">"
OP_COMP2  "!="|"=="
IDENTIFICADOR  [a-z][a-zA-Z0-9]*
FUNCION  {IDENTIFICADOR}"()"
ENTERO_POSITIVO [0-9]+
ENTERO_NEGATIVO  -[0-9]+
FLOTANTE  {ENTERO_POSITIVO}"."[0-9]+
BOOL "true"|"false"
CARACTER  "\'"[^\n]"\'"
STRING  "\""[^\n]*"\""
COMEN_UNICA  "//".*
COMEN_MULTIPLE  "/*"[^"/"]*"*/"
DOS_PUNTOS ":"
PUNTO_COMA ";"
LLAVE_A "{"
LLAVE_C "}"
ELSE "else"
DO "do"


%%
{TIPO_VARIABLE} 		return TIPO_VARIABLE;
"if" 				return IF;
"then"  			return THEN;
{ELSE}  			return ELSE;
"while"  			return WHILE;
{DO}  				return DO;
"printf"		        return PRINTF;
"scanf"				return SCANF;
"return"			return RETURN;
{IDENTIFICADOR}			return IDENTIFICADOR; 
"="  				return IGUAL; 	
{DOS_PUNTOS}     		return DOS_PUNTOS; 
","				return SEPARADOR;
{CARACTERES_ESPECIALES}		return CARACTERES_ESPECIALES;
{OP_LOGICO}  			return OP_LOGICO;
{OP_COMP}			return OP_COMP;
{OP_COMP2}			return OP_COMP2;
"("	 			return PAREN_A;
")"  				return PAREN_C;
{LLAVE_A}  			return LLAVE_A;
{LLAVE_C}  			return LLAVE_C;
"["	                        return CORCH_A;
"]"	                        return CORCH_C;
{ENTERO_POSITIVO}		return ENTERO_POSITIVO;
{ENTERO_NEGATIVO}     		return ENTERO_NEGATIVO;
{FLOTANTE}     		return FLOTANTE;
{BOOL}     		return BOOL;
{CARACTER}			return CARACTER; 
{STRING}			return STRING;
{PUNTO_COMA}                    return PUNTO_COMA;



{COMEN_UNICA}			 
{COMEN_MULTIPLE}		
[ \t]+               		
[\n]				yylineno++; 
.				fprintf(yyout,"error: %s %d \n", yytext, yylineno/2); 
%%

/*int main(int argc, char *argv[])
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
}*/

int yywrap(void)
{
return 1;
}
