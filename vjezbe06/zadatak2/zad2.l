%{
	#include<stdio.h>
%}

%option noyywrap
slovo [a-z A-Z]
cifra [0-9]
ident {slovo}({slovo}|{cifra})* 

%%
{ident} printf("|%s| = %d\n", yytext, yyleng);
%%

int main()
{
      yylex();
      return 0;
}