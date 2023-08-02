%token BROJ TEKST DVOTACKA EOL
%left '+' '-'
%left '*' '/'
%left UMINUS
%left UPLUS


%{
 int izrazi_veci_od_5 = 0;
%}
%%

datoteka: linije 
        {
            printf("Broj zadataka: %d\n", $1);
            printf("Broj izraza cija je vrijednost veca od 5: %d\n", izrazi_veci_od_5);
        }
        ;

linije: linija
        {
            $$= 1;
        }
    |linije linija
        {
            $$= $1+1;
        }
        ;

linija : BROJ TEKST DVOTACKA izraz EOL
        {
            printf("Zadatak: %d\t", $2);
            printf("Rezultat: %d\n\n", $4);
            if ($4 > 5)
                izrazi_veci_od_5++;
        }
        ;

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


/*
Pokretanje:
flex zadatak.l
bison zadatak.y
gcc zadatak.tab.c -o zadatak
./zadatak < test.txt

*/
