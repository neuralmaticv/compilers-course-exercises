%token ZAGRADA1 ZAGRADA2    

%left ZAGRADA1

%%
program: srule {printf("OK\n");}
    ;
    
srule: srule ZAGRADA1 srule ZAGRADA2
    | ;

%%

#include "lex.yy.c"

yyerror(char *s)
{
    fprintf(stderr, "%s\n", s);
}

main()
{
    yyparse();
}
