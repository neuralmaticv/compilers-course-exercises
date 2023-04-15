%option noyywrap

%{
    int brojKaraktera = 0;
    int linijeBezKomentara = 0;
    int brojac = 0;
    double prosjek;
%}

komentar "/*".*"*/"
bjelina [ \t]
novalinija [\n]
prekid "quit"

%%
{komentar} ;
{bjelina} ;

{novalinija} {
    if (brojac > 0) {
        linijeBezKomentara++;
        brojac = 0;
    }
}

. {
    brojKaraktera++;
    brojac++;
}

{prekid} {
    yyterminate();
}

%%

int main() {
    yylex();
    prosjek = brojKaraktera / linijeBezKomentara;
    printf("Prosjecan # karaktera po linijama koje ne sadrze samo komentare je %.2f\n", prosjek);
    return 0;
}
