%token RECENICA RIJEC DATUM LZAGRADA DZAGRADA

%{
int br_recenica = 0;
int br_rijeci = 0;
%}

%start tekst

%%
tekst: /* empty */
    | tekst recenica { br_recenica++; }
    ;

recenica:
    RECENICA {
        // Each RECENICA token represents a sentence ending with a period.
        br_rijeci = 0;
    }
    | recenica rijec {
        br_rijeci++;
    }
    | recenica DATUM {
        // When encountering a date, you can add any specific logic you want for date handling here.
    }
    | LZAGRADA recenica DZAGRADA {
        // This rule handles sentences enclosed in parentheses.
        br_recenica++;
    }
    ;

rijec:
    RIJEC
    | LZAGRADA rijec DZAGRADA
    ;

%%


#include "lex.yy.c"

void yyerror(char *poruka) {
    printf("Greska %s\n",poruka);
}

int main() {
    return yyparse();
}