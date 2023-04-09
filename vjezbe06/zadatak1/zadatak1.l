%option noyywrap

%%
[ \t]+ putchar(' '); { /* umjesto svih razmaka i tabulara stavi jedan razmak */}
[\t]$
%%

int main() {
    yylex();
    return 0;
}
