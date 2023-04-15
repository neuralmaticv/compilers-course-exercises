%{
    int brojac = 0;
    int linijaBezKomentara = 0;  
%}

%option noyywrap
komentar "/*".*"*/"
bjelina [ \t]
novalinija [\n]
prekid "quit"

%% 
{komentar} ;
{bjelina} ;

{novalinija} {
    if (brojac > 0) {
        linijaBezKomentara++;
        brojac = 0;
    }
}

. {brojac++;}

{prekid} {
    yyterminate();
}

%%

int main() {
    yylex();
    printf("%d linije bez komentara\n", linijaBezKomentara);
    return 0;
}
