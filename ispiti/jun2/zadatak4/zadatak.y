%token IDENT WHEN THEN ELSE COL

%%
naredba: dio1 dio2 {
    printf("Naredba se prihvata\n");
}

dio1: dio1 WHEN IDENT THEN sql
    | WHEN IDENT THEN sql

sql: sql IDENT COL
    | IDENT COL

dio2: ELSE sql
    | ;

%%


#include "lex.yy.c"

void yyerror(char *poruka) {
    printf("Greska %s\n",poruka);
}

int main() {
    return yyparse();
}