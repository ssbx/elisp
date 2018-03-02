%{
#include "y.tab.h"
%}

%option case-sensitive
%option ansi-definitions
%option noyywrap
%option 8bit
%option stack

%%

\(				{ return '('; }
\)				{ return ')'; }
[a-z][[:alpha:]]* 		{ return SYMBOL; }
[[:digit:]] 			{ return DIGIT; }
[[:digit:]]\.[[:digit:]] 	{ return FLOAT; }
\"(\\.|[^"\\])*\"		{ printf("%s\n", yytext); return STRING; }

%%
