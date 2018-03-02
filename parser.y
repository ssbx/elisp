%{
#include <stdio.h>
#include "lex.yy.h"

void
yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
}

%}

%token DIGIT FLOAT STRING SYMBOL

%%

arg: DIGIT | FLOAT | STRING | SYMBOL | expr;
args: | args arg;
expr:  '(' SYMBOL args ')';

%%

int main(int argc, char *argv) {
	return yyparse();
}
