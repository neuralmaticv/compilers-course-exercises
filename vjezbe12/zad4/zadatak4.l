%option noyywrap


prom [a-z0-9]+
cijeli [0-9]+
bjelina [ \t\n]
bjeline {bjelina}+

%% 
    // {cijeli} {
    //     yylval = atoi(yytext);
    //     return BROJ;
    // }

{prom} {return PROM;}

{bjeline} ;

. return yytext[0];
