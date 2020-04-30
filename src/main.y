%{

#include <stdio.h>
#include <stdlib.h>

void yyerror(char *c);
int yylex(void);

%}

%token '{' '}' INT STR ':' ',' '[' ']' EOFILE

%%

ARQUIVO:
        JSON EOFILE { printf("VALIDO"); }
        ;

JSON:
        PROGRAMA {}
        |
        ;

PROGRAMA:
        '{' CONTEUDO '}' {}
        ;

CONTEUDO:
        STR ':' STR {}
        | STR ':' INT {}
        | STR ':' PROGRAMA {}
        | CONTEUDO ',' CONTEUDO {}
        | STR ':' LISTA {}
        ;

LISTA:
        '[' CONT ']' {}
        ;

CONT:
        ELEMENTO {}
        |
        ;

ELEMENTO:
        INT {}
        | STR {}
        | ELEMENTO ',' ELEMENTO {}
        ;

%%

void yyerror(char *s) { printf("INVALIDO\n"); }

int main() {
  yyparse();
  return 0;

}
