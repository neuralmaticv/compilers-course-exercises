%{
	#include<stdio.h>
%}

%option noyywrap
realan [+-]?[0-9]*[.][0-9]+

%%
{realan} printf("Jeste");
%%

int main()
{
      yylex();
      return 0;
}