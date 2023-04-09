%option noyywrap

realan [+-]?[0-9]*\.[0-9]+
 
%%
{realan} printf("Unesen je realan broj");
%%

int main() {
    yylex();
    return 0;
}
