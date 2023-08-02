%token PROM
%left '+' '-'
%left '*' '/'
%left UMINUS /* ovo je za predznak */

/*
Racunanje kompleksnosti aritmetickog izraza po formuli A+2B+3C
A - broj binarnih operatora sabiranja i oduzimanja
B - broj unarnih operatora plus i minus
C - broj mnozenja i dijeljenja u izrazu
*/

%%
s: izraz {
    printf("Kompleksnost izraza je %d %d\n", $1);
};

    /*
    U .l smo definisali promjenljivu, a ne prepoznavanje brojeva jer ne racunamo njihove vrijednosti
    vec ih samo trebamo prepoznati
    */

izraz: 
      izraz '+' izraz {$$ = $1 + $3 + 1;};
    | izraz '-' izraz {$$ = $1 + $3 + 1;};
    | izraz '*' izraz {$$ = $1 + $3 + 3;};
    | izraz '/' izraz {
        if ($3 == 0) {
            yyerror("Nije dozvoljeno djeljenje sa nulom!\n");
        } else {
            $$ = $1 + $3 + 3;
        }
    }
    | '-' izraz {$$ = $2 + 2;};
    | '+' izraz {$$ = $2 + 2;};
    | '(' izraz ')' { $$ = $2;};
    | PROM { $$ = 0;};

%%

#include "lex.yy.c"

yyerror(char *s) {
    printf("GRESKA: %s\n", s);
}

int main() {
    return yyparse();
}

