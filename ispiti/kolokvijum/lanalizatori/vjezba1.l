 // opcije
%option noyywrap

 /*
 // Varijable
%{

%} 
 */

 // Regularni izrazi
DIGIT [0-9]
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*

 // akcije za regularne izraze
%%
[ \n\r\t]+ { /* ignorisi praznine */}

"if" {
    printf("IF ");
}

"while" {
    printf("WHILE ");
}

"print" {
    printf("PRINT ");
}

{IDENTIFIER} { printf("Identifikator\n"); }
{DIGIT}+ { printf("Broj\n"); }

<<EOF>> {printf("\n***************** EOF *****************\n"); return 0;}

%%

 // C ili C++ kod
 // sa CTRL+D saljemo EOF
int main() {
    yylex();
    return 0;
}
 