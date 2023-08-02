%option noyywrap
cijeli [0-9]+
%%
{cijeli} {yylval = atoi(yytext); return BROJ;}
[ \t] ;
. return yytext[0];
