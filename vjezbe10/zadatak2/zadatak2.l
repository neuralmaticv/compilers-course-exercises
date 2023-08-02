%option noyywrap

%{
#define NCIO 257
#define IDENT 258
%}

slovo [A-Za-z]
cifra [0-9]
bjelina [ \t\n]
ident {slovo}({slovo}|{cifra})*
ncio [1-9]{cifra}*
prazno {bjelina}+

%%
{ident} {return IDENT;}
{ncio} {return NCIO;}
{prazno}
. {return yytext[0];}
%%