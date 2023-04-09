%option noyywrap

%{
int b_linija=0;
int b_karaktera=0; 
%}
 
%%
\n {b_linija++;}
. {b_karaktera++;}
%%

int main() {
    yylex();
    
    printf("# linija: %d\n", b_linija);
    printf("# karaktera: %d\n", b_karaktera);
    return 0;
}
