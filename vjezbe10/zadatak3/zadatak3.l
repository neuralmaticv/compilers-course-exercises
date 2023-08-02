%option noyywrap

%{
    // Ovo se moze navesti i posebnom fajlu, sa .h ekstenzijom
    // .h fajl se onda ukljucuje sa %include "ime_fajla.h" u sekciji
    #define WHILE 257
    #define DO 258
    #define BEG 259
    #define END 260
    #define SEMICOLON 261
    #define VAR 262
    #define NUM 263
    #define EQ 264
    #define ASSIGN 265
    int brReda = 0;
%}

ID [a-zA-Z][a-zA-Z0-9]*
NUM [1-9][0-9]*

%%
while|WHILE { return WHILE; }
do|DO { return DO; }
begin|BEGIN { return BEG; }
end|END { return END; }
";" { return SEMICOLON; }
{ID} { return VAR; }
{NUM} { return NUM; }
"==" { return EQ; }
":=" { return ASSIGN; }
\n printf("Zavrsena analiza reda %d\n", brReda++);
[ \t]+ { /* preskoci bjeline */ }
. printf("Nepoznati karakter %c u redu %d.\n", yytext[0], brReda);
%%
