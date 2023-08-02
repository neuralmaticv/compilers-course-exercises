%{
	#include<stdio.h>
%}

%option noyywrap

%%
[ \t]+ putchar(' ');
[ \t]$ 
 /* ignorisemo one na kraju tako sto ne definisemo akciju*/
%%

int main()
{
      yylex();
      return 0;
}