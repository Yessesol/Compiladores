%{
#include <stdio.h>
PALABRAS_RESERVADAS = "int"|"float"|"bool"|"char"|"String"|"if"|"then"|"else"|"while"|"do"|"input"|"output"|"return"
CARACTERES_ESPECIALES = "<="|";"|":"|"("|")"|"{"|"}"|"+"|"-"|"*"|"/"|"<"|">"|"="|"!"|"&"|"$"
OP_COMP = ">="|"<="|"!="|"&&"|"||"|"=="
IDENTIFICADOR = [a-z][_a-zA-Z0-9]*
FUNCION = {ID}"()"
ENTERO = -?[0-9]+
FLOTANTE = {ENTERO}"."[0-9]+
BOOL = true|false
CARACTER = '[^ \n\t]'
STRING = \"[^\n\t]+\"
COMEN_UNICA = "//".*
COMEN_MULTIPLE = "/*"[^"/"]*"*/"
%}
%%
{PALABRAS_RESERVADAS}		fprintf(yyout,"Palabra reservada: %s \n", yytext);
{CARACTERES_ESPECIALES}		fprintf(yyout,"Caracter especial: %s \n", yytext); 
{OP_COMP}			fprintf(yyout,"Operador compuesto: %s \n", yytext); 
{IDENTIFICADOR}			fprintf(yyout,"Identificador: %s \n", yytext); 
{FUNCION}			fprintf(yyout,"Funcion: %s \n", yytext); 
{ENTERO}			fprintf(yyout,"int: %s \n", yytext); 
{FLOTANTE}			fprintf(yyout,"float: %s \n", yytext); 
{BOOL}				fprintf(yyout,"bool: %s \n", yytext); 
{CARACTER}			fprintf(yyout,"char: %s \n", yytext); 
{STRING}			fprintf(yyout,"string: %s \n", yytext); 
{COMEN_UNICA}			fprintf(yyout,"Comentario de unica linea: %s \n", yytext); 
{COMEN_MULTIPLE}		fprintf(yyout,"Comentario multiple: %s \n", yytext);
[ \n\t]+                /*Se saltara los espacios*/
.			fprintf(yyout,"error: %s \n", yytext); 

%%
main( argc, argv){
int argc;
char **argv;
++argv, --argc;
if (argc > 0)
yyin=fopen(argv[0],"r");
else
yyin=stdin;
yylex();
}
