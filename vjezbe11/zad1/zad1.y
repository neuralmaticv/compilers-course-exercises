%{
#include <stdio.h>  
 // Parser za definisanu gramatiku  
%}

%token WHILE DO BEG END SEMI EQ DODELA PROM BROJ

%%
S : naredba {printf("Ispravna naredba\n");};

naredba : while_naredba
        | begin_naredba
        | naredba_dodjele;


while_naredba : WHILE iskaz DO naredba;


begin_naredba : BEG naredba1 END SEMI;


naredba_dodjele : PROM DODELA izraz SEMI;


naredba1 : naredba | naredba naredba1;


iskaz : izraz EQ izraz;


izraz : BROJ | PROM;
%%


#include "lex.yy.c"

void yyerror(char* s){
    printf("%s\n", s);
}

int main(){
    return yyparse();
}
