%option noyywrap

slovo [a-z]
cifra [0-9]
bjelina [ \t]+

%% 
{slovo} {
    yylval = yytext[0] - 'a';
    return SLOVO;
}

{cifra} {
    yylval = yytext[0] - '0';
    return CIFRA;
}

{bjelina} ;

. return yytext[0];
