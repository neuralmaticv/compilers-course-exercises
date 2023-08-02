%option noyywrap

%{
    #include <stdlib.h>
    #include <math.h>

    // atoi(string) = integer
    // atof(string) = float

    // lek. analizator omoguciti da se primjenjuje na datoteku
    // main(int argc, char *argv[])
    // argc - broj argumenata
    // argv - argumenti, argv[0] je ime programa, argv[1] je prvi argument
%}

cifra [0-9]
ident [a-z][a-z0-9]*


%%
{cifra}+ {printf("Cijeli broj: %d\n", atoi(yytext));};
{cifra}+\.{cifra}* {printf("Realni broj: %f\n", atof(yytext));};

if|then|begin|end|procedure|function|var|integer {printf("Ključna riječ: %s\n", yytext);};

{ident} {printf("Identifikator: %s\n", yytext);};

"+"|"-"|"*"|"/" {printf("Operator: %s\n", yytext);};

":=" {printf("Operator dodjele: %s\n", yytext);};

"("|")" {printf("Zagrada: %s\n", yytext);};

[ \t\n]
. {printf("Nepoznati znak: %s\n", yytext);};
%%

int main(int argc, char *argv[]) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");

        if (yyin == NULL) {
            printf("Ne mogu otvoriti datoteku %s\n", argv[1]);
            exit(1);
        }
    } else {
        yyin = stdin;
    }
    
    yylex();
  
    return 0;
}

