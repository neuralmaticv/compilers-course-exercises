%option noyywrap
cijeli [0-9]+
slovo [a-z]+
%%
{cijeli} {yylval = atoi(yytext); return BROJ;}
{slovo} {yylval = strdup(yytext); return TEKST;}
: {return DVOTACKA;}
\n { return EOL;}
[ \t] ;
. { return yytext[0];}
