%option noyywrap

realan [+-]?[0-9]*\.[0-9]+
strink [^'\n']+
string [']{strink}[']

 
%%
int|var|begin|end|to|do|for printf("ključna riječ");
{realan} printf("realan broj");
{string} printf("string");
%%

int main() {
    yylex();
    return 0;
}