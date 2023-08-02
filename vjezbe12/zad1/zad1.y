%token BROJ
%left '+' '-'
%left '*' '/'
%left UMINUS
%left UPLUS

%%

s:izraz {printf("%d\n", $1);};

izraz:izraz'+'izraz {$$=$1+$3;}
    |izraz'-'izraz {$$=$1-$3;}
    |izraz'*'izraz {$$=$1*$3;}
    |izraz'/'izraz 
        {if($3==0) 
            yyerror("Djeljenje sa 0.\n");
        else
            $$=$1/$3;}
    |'('izraz')' {$$=$2;}
    |'-' izraz %prec UMINUS {$$=-$2;}
    |'+' izraz %prec UPLUS {$$=+$2;}
    |BROJ;

%%
#include "lex.yy.c"

void yyerror(char* s){
    printf("%s\n", s);
}

int main(){
    return yyparse();
    return 0;
}