%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int sum = 0;
%}

%option noyywrap

%%

[1-9][0-9]* {
                int decimal_value = atoi(yytext);
                printf("Decimal: %d\n", decimal_value);

                sum += decimal_value;
}

0[0-7]* {
            int octal_value = strtol(yytext, NULL, 8);
            printf("Oct: %d\n", octal_value);

            sum += octal_value;
}

0[xX][0-9a-fA-F]+ {
                    int hex_value = strtol(yytext, NULL, 16);
                    printf("Hex: %d\n", hex_value);
                    
                    sum += hex_value;
}

. ;  /* Ignorisi ostale karaktere */

%%

int main(void) {
    yylex();
    printf("Suma = %d\n", sum);
    return 0;
}

