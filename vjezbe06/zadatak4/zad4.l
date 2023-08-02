%{
	#include<stdio.h>
%}

%option noyywrap
realan [+-]?[0-9]*[.][0-9]+
stringk [^'\n]+
string [']{stringk}[']

%%
program|var|for|to|do|end printf("Kljucna rec");
{realan} printf("Pronadjen je realan broj : %s", yytext);
{string} printf("String: %s", yytext);
%%

int main()
{
      yylex();
      return 0;
}
