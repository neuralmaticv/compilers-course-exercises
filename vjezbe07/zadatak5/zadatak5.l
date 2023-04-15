%option noyywrap

slovo [a-zA-Z]
cifra [0-9]
ident {slovo}({slovo}|{cifra})*

%%
{ident} {
    if (yyleng == 1) {
        printf("-> identifikator duzine 1\n");
    } else if (yyleng > 10) {
        printf("-> identifikator duzine vece od 10\n");
    }
}
%%

int main() {
    yylex();
    return 0;
}
