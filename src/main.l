
%{
#include <stdio.h>
%}

SPECIAL ([^a-zA-Z0-9]{-}[.,\n ])
NORM [a-zA-Z0-9]
BASE ({NORM}[\.\-\_A-Za-z0-9]*)?{NORM}+@({NORM}[\.\-\_A-Za-z0-9]*)?{NORM}+ 

%%
\n ;
{BASE}{SPECIAL} ;
{BASE}\.\ [^A-Z] ;
{BASE},\ [^a-z] ;
{BASE}	printf("%s\n", yytext);
. ;
EOF 	return 0;
%%


int main() {
	yylex();
	return 0;
}
