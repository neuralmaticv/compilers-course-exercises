%{
    int slova = 0, rijeci = 0, duzina = 0, najduza = 0;
    double prosjek;
%}


%option noyywrap
rijec [a-zA-Z]+
prekid [.!?]

%%
{rijec} {
    rijeci++;
    duzina = yyleng;
    slova += duzina;
    if (duzina > najduza) najduza = duzina;
    // printf(yytext);
}

{prekid} yyterminate();

%%


int main() {
    printf("*************************\n");
    yylex();
    printf("Max duzina rijeci %d\n", najduza);
    printf("Prosjecna duzina rijeci %.2f\n", ((float)slova/rijeci));
    return 0;
}
