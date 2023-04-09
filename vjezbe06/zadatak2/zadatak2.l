%option noyywrap

slovo [a-zA-Z]
cifra [0-9]
identifikator {slovo}({slovo}|{cifra})*

%%
{identifikator} printf("|%s| = %d\n", yytext, yyleng);
%%

int main() {
    yylex();
    return 0;
}
