%option noyywrap

cifra [0-9]
slovo [a-z]
bjelina [ \t]+

%%
{cifra} {yylval = yytext[0]-'0'; return CIFRA;}

{slovo} {yylval = yytext[0]-'a'; return SLOVO;}

{bjelina} ;

. return yytext[0];
