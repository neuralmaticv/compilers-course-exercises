 // lek analizator koji dodaje broj linije izvrsnom kodu
%{
    int brojac = 0;    

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
    printf("%d %s\n", brojac, yytext);
    // printf("%d %d\n", brojac, brRijeci(yytext));
    brojac++;
}
%%

int main() {
    printf("*************************\n");
    yylex();
    return 0;
}
