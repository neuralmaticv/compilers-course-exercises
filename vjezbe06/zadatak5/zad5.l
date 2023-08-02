%option noyywrap

%{
	#include<stdio.h>
    int bl=0, bc=0;
%}

%%
\n {++bl;++bc;}
. ++bc;
%%

int main()
{
      yylex();
      printf("%d, %d", bl, bc);
      return 0;
}
