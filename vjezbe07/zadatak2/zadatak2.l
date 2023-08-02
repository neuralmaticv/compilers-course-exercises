%option noyywrap

%{
     // lek analizator koji dodaje broj linije kodu

    int brojac1 = 0, brojac=0;    

    int brRijeci(char text[]) {
        int b = 0;
        for (int i = 0; text[i] != '\0'; i++) {
            if (text[i] == ' ') {
                b++;
            }
        }

        return ++b;
    }
%}

%option noyywrap
linija [^\n]*\n

%% 
{linija} {
    printf("%d %s\n", brojac1, yytext);
    printf("%d broj rijeci je %d\n", brojac, brRijeci(yytext));
    brojac1++;
}
%%

int main() {
    printf("*************************\n");
    yylex();
    return 0;
}
