%option noyywrap

slovo [AEJKMOT]
cifra [0-9]
staraTablica {cifra}{3}-{slovo}-{cifra}{3}
novaTablica {slovo}{cifra}{2}-{slovo}-{cifra}{3}

%%
{novaTablica} {
    printf("Nova registarska tablica: %s\n", yytext);
}

{staraTablica} {
    printf("Stara registarska tablica: %s\n", yytext);

    if (yytext[0] == yytext[1] && yytext[1] == yytext[2] && yytext[2] == yytext[6] && yytext[6] == yytext[7] && yytext[7] == yytext[8]) {
        printf("Sve cifre su jednake - diplomatska tablica visokog ranga\n");
    } else if (yytext[0] == yytext[6] && yytext[1] == yytext[7] && yytext[2] == yytext[8]) {
        printf("Desna i lijeva strana su jednake - diplomatska tablica srednjeg ranga\n");
    } else if (yytext[0] == yytext[8] && yytext[1] == yytext[7] && yytext[2] == yytext[6]) {
        printf("Desna i lijeva strana su simetricne - diplomatska tablica niskog ranga\n");
    } else {
        printf("Tablica nije diplomatska\n");
    }
}

%%

int main () {
    yylex();
    return 0;
}
