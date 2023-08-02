%option noyywrap

cifra [0-9]
realan [+|-| ]?{cifra}*\.{cifra}+([eE][+|-]?{cifra}*)?

%%
{realan} {printf("Realan broj: %s\n", yytext);}
%%

int main() {
    yylex();
    return 0;
}
