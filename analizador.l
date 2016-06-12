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
{"salir"}		{bye();return 0;}
{CARACTERES_ESPECIALES}		{	return new TokenClass("Caracter especial", yytext()); }
{OP_COMP}		{	return new TokenClass("Operador compuesto", yytext()); }
{BOOL} {	return new TokenClass("bool", yytext()); }
{IDENTIFICADOR}		{	return new TokenClass("Identificador", yytext()); }
{FUNCION}		{	return new TokenClass("Funcion", yytext()); }
{ENTERO}		{	return new TokenClass("int", yytext()); }
{FLOTANTE}		{	return new TokenClass("float", yytext()); }
{CARACTER}		{	return new TokenClass("char", yytext()); }
{STRING}		{	return new TokenClass("string", yytext()); }

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
