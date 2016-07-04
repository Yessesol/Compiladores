%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token TIPO_VARIABLE
%token IF
%token THEN
%token ELSE
%token WHILE
%token DO
%token PRINTF
%token SCANF
%token RETURN
%token IDENTIFICADOR
%token IGUAL
%token DOS_PUNTOS
%token SEPARADOR
%token CARACTERES_ESPECIALES
%token OP_LOGICO
%token OP_COMP
%token OP_COMP2
%token PAREN_A
%token PAREN_C
%token LLAVE_A
%token LLAVE_C
%token CORCH_A
%token CORCH_C
%token ENTERO_POSITIVO
%token ENTERO_NEGATIVO
%token FLOTANTE
%token BOOL
%token CARACTER
%token STRING
%token PUNTO_COMA
%%
prog: 
	prog declaracionGlobal
	|prog funciones
	|prog declaracionLocal
	|prog controlIf
	|prog controlIfElse
	|prog controlWhile
	|prog controlDoWhile
	|prog asignacion
	|prog operacionesRetorno
	|prog operacionesEntradaSalida
	|prog expresionLogica
	|	
;
declaracionGlobal:
		TIPO_VARIABLE DOS_PUNTOS IDENTIFICADOR
		|TIPO_VARIABLE IDENTIFICADOR CORCH_A ENTERO_POSITIVO CORCH_C
		;
funciones:
		TIPO_VARIABLE IDENTIFICADOR DOS_PUNTOS PAREN_A PAREN_C
		|TIPO_VARIABLE IDENTIFICADOR DOS_PUNTOS PAREN_A parametros PAREN_C
		;
parametros: 	
		TIPO_VARIABLE DOS_PUNTOS IDENTIFICADOR
		|TIPO_VARIABLE DOS_PUNTOS IDENTIFICADOR SEPARADOR parametros
		;
declaracionLocal:
		TIPO_VARIABLE DOS_PUNTOS IDENTIFICADOR PUNTO_COMA
		;

controlIf:
	IF PAREN_A expresionLogica PAREN_C THEN comando
	|IF PAREN_A expresionLogica PAREN_C THEN LLAVE_A LLAVE_C
	|IF PAREN_A expresionLogica PAREN_C THEN LLAVE_A comando LLAVE_C
	
;
controlIfElse:
	IF PAREN_A expresionLogica PAREN_C THEN comando ELSE comando
	|IF PAREN_A expresionLogica PAREN_C THEN comando ELSE comando controlIfElse
	;
controlWhile: 
	WHILE PAREN_A expresionLogica PAREN_C DO comando
	 |WHILE PAREN_A expresionLogica PAREN_C DO comando controlWhile
	;
controlDoWhile: 
	DO comando WHILE PAREN_A expresionLogica PAREN_C
	|DO comando WHILE PAREN_A expresionLogica PAREN_C controlDoWhile
	;
expresionLogica: IDENTIFICADOR OP_COMP IDENTIFICADOR 
		|IDENTIFICADOR OP_COMP ENTERO_POSITIVO
		|IDENTIFICADOR OP_COMP ENTERO_NEGATIVO
		|IDENTIFICADOR OP_COMP2 STRING
		|IDENTIFICADOR OP_COMP2 CARACTER
		|IDENTIFICADOR OP_COMP2 IDENTIFICADOR 
		|IDENTIFICADOR OP_COMP2 ENTERO_POSITIVO
		|IDENTIFICADOR OP_COMP2 ENTERO_NEGATIVO
		;

comando: 
	asignacion
	|operacionesEntradaSalida
        |operacionesRetorno
	|asignacion comando
	|operacionesEntradaSalida comando
        |operacionesRetorno comando 	
	;
operacionesRetorno: 	
		RETURN IDENTIFICADOR PUNTO_COMA
		|RETURN BOOL PUNTO_COMA
		|RETURN ENTERO_POSITIVO PUNTO_COMA
		|RETURN ENTERO_NEGATIVO PUNTO_COMA
		;
operacionesEntradaSalida: PRINTF PAREN_A STRING PAREN_C PUNTO_COMA
			|PRINTF PAREN_A STRING SEPARADOR IDENTIFICADOR PAREN_C PUNTO_COMA
			|SCANF PAREN_A STRING SEPARADOR IDENTIFICADOR PAREN_C PUNTO_COMA
			;
asignacion:	IDENTIFICADOR IGUAL IDENTIFICADOR PUNTO_COMA
		|IDENTIFICADOR IGUAL ENTERO_POSITIVO PUNTO_COMA
		|IDENTIFICADOR IGUAL ENTERO_NEGATIVO PUNTO_COMA
		|IDENTIFICADOR CORCH_A ENTERO_POSITIVO CORCH_C IGUAL ENTERO_POSITIVO PUNTO_COMA
                |IDENTIFICADOR CORCH_A ENTERO_POSITIVO CORCH_C IGUAL ENTERO_NEGATIVO PUNTO_COMA
		|IDENTIFICADOR CORCH_A ENTERO_POSITIVO CORCH_C IGUAL STRING PUNTO_COMA
		|IDENTIFICADOR CORCH_A ENTERO_POSITIVO CORCH_C IGUAL CARACTER PUNTO_COMA
		;
%%
void yyerror(char *s) { 
    fprintf(stderr, "%s\n", s);}
int main(void) { 
    yyparse(); 
    return 0; 
}
