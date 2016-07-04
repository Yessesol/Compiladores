/* A Bison parser, made by GNU Bison 3.0.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2013 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_ANALIZADORSINTACTICO_TAB_H_INCLUDED
# define YY_YY_ANALIZADORSINTACTICO_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    TIPO_VARIABLE = 258,
    IF = 259,
    THEN = 260,
    ELSE = 261,
    WHILE = 262,
    DO = 263,
    PRINTF = 264,
    SCANF = 265,
    RETURN = 266,
    IDENTIFICADOR = 267,
    IGUAL = 268,
    DOS_PUNTOS = 269,
    SEPARADOR = 270,
    CARACTERES_ESPECIALES = 271,
    OP_LOGICO = 272,
    OP_COMP = 273,
    OP_COMP2 = 274,
    PAREN_A = 275,
    PAREN_C = 276,
    LLAVE_A = 277,
    LLAVE_C = 278,
    CORCH_A = 279,
    CORCH_C = 280,
    ENTERO_POSITIVO = 281,
    ENTERO_NEGATIVO = 282,
    FLOTANTE = 283,
    BOOL = 284,
    CARACTER = 285,
    STRING = 286,
    PUNTO_COMA = 287
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_ANALIZADORSINTACTICO_TAB_H_INCLUDED  */
