%{
int registar[26];
int baza;    
%}

%token CIFRA, SLOVO
%left '+' '-'
%left '*' '/'
%left UMINUS
%left UPLUS

%%
program: iskaz
        |program iskaz;

iskaz:izraz ';' {printf("%d;\n", $1);}
        |SLOVO '=' izraz ';' {registar[$1]=$3; printf("%c=%d;\n", $1+'a', $3);};

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
    |'+' izraz %prec UPLUS {$$=$2;}
    |SLOVO {$$=registar[$1];}
    |broj;

broj:CIFRA {$$=$1;baza=($1==0)?8:10;}
    | broj CIFRA {$$=$1*baza+$2};
%%


#include "lex.yy.c"

void yyerror(char* s){
    printf("%s\n", s);
}

int main(){
    yyin=stdin;
    return yyparse();
    return 0;
}