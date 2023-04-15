%option noyywrap

slovo [AEJKMOT]
cifra [0-9]
tablica {slovo}{cifra}{2}-{slovo}-{cifra}{3}

%%

{tablica} {
    printf("Tablica: %s", yytext);
}

%%

int main () {
    yylex();
    return 0;
}