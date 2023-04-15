%option noyywrap

%{
    int vrijednost = 0;
%}

hiljade M*
stotine CM|CD|DC*|C*
desetine XC|XL|LX*|X*
jedinice IX|IV|VI*|I*
prekid "quit"

%%
{hiljade} {
    if (yyleng > 3) {
        printf("Previse M\n");
    } else {
        vrijednost += 1000 * yyleng;
    }
}

{stotine} {
    if (!strcmp(yytext, "CM")) {
        vrijednost += 900;
    } else if (!strcmp(yytext, "CD")) {
        vrijednost += 400;
    } else if (yytext[0] == 'D') {
        if (yyleng > 4) {
            printf("Previse D\n");
        } else {
            vrijednost += 500 + (yyleng - 1) * 100;
        }
    } else if (yyleng > 3) {
        printf("Previse C\n");
    } else {
        vrijednost += yyleng * 100;
    }
}

{desetine} {
    if (!strcmp(yytext, "XC")) {
        vrijednost += 90;
    } else if (!strcmp(yytext, "XL")) {
        vrijednost += 40;
    } else if (yytext[0] == 'L') {
        if (yyleng > 4) {
            printf("Previse L\n");
        } else {
            vrijednost += 50 + (yyleng - 1) * 10;
        }
    } else if (yyleng > 3) {
        printf("Previse X\n");
    } else {
        vrijednost += yyleng * 10;
    }
}

{jedinice} {
    if (!strcmp(yytext, "IX")) {
        vrijednost += 9;
    } else if (!strcmp(yytext, "IV")) {
        vrijednost += 4;
    } else if (yytext[0] == 'V') {
        if (yyleng > 4) {
            printf("Previse V\n");
        } else {
            vrijednost += 5 + (yyleng - 1);
        }
    } else if (yyleng > 3) {
        printf("Previse I\n");
    } else {
        vrijednost += yyleng;
    }
}

{prekid} {
    yyterminate();
}
%%

int main() {
    yylex();
    printf("Vrijednost rimskog broja je %d\n", vrijednost);
    return 0;
}
