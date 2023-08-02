%{
    #include <ctype.h>
    int registri[26];
    int baza;
%}

%token CIFRA SLOVO
%left '|'
%left '&'
%left '+' '-'
%left '*' '/'
%left UMINUS

%%
program: iskaz
    | program iskaz
    ;

iskaz: izraz ';' {printf("%d\n", $1);}
    | SLOVO '=' izraz ';' {registri[$1] = $3; printf("%c=%d;\n", $1+'a', $3);};
    ;

izraz: '(' izraz ')'
    {$$ = $2;}
    | izraz '+' izraz
    {$$ = $1 + $3;}
    | izraz '-' izraz
    {$$ = $1 - $3;}
    | izraz '*' izraz
    {$$ = $1 * $3;}
    | izraz '/' izraz
    {$$ = $1 / $3;}
    | izraz '%' izraz
    {$$ = $1 % $3;}
    | izraz '&' izraz
    {$$ = $1 && $3;}
    | izraz '|' izraz
    {$$ = $1 || $3;}
    | '-' izraz 
    {$$ = -$2;}
    | SLOVO
    {$$=registri[$1];}  
    | broj;

broj: CIFRA
    {$$ = $1; baza=($1 == 0) ? 8 : 10;}
    | broj CIFRA
    {$$ = baza * $1 + $2;}

%%

#include "lex.yy.c"

yyerror(char *s)
{
    printf("%s\n", s);
}

int main() {
    return yyparse();
}
