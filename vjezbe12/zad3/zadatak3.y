%token BROJ
%left '+' '-'
%left '*' '/'
%left UMINUS /* ovo je za predznak */

%%
s: izraz {
    printf("Vrijednost izraza je %d\n", $1);
};

izraz: 
      izraz '+' izraz {$$ = $1 + $3;};
    | izraz '-' izraz {$$ = $1 - $3;};
    | izraz '*' izraz {$$ = $1 * $3;};
    | izraz '/' izraz {
        if ($3 == 0) {
            yyerror("Nije dozvoljeno djeljenje sa nulom!\n");
        } else {
            $$ = $1 / $3;
        }
    }
    | '-' izraz {$$ = - $2;};
    | '(' izraz ')' { $$ = $2;};
    | BROJ;

%%

#include "lex.yy.c"

yyerror(char *s) {
    printf("GRESKA: %s\n", s);
}

int main() {
    return yyparse();
}

