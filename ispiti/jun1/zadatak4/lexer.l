%option noyywrap

maloSlovo [a-z]
velikoSlovo [A-Z]
slova [a-zA-Z]
cifra [0-9]
datum [0-9]{2}[/][0-9]{2}[/][0-9]{4}

%%
 // zavrsava se sa tackom
{velikoSlovo}{slova}*\. {
    printf("Recenica: %s\n", yytext);
    return RECENICA;
}

{velikoSlovo}{slova}* {
    printf("Rijec: %s\n", yytext);
    return RIJEC;
}

{datum} {
    return DATUM;
}

[(] {
     return LZAGRADA;
}
[)] {
    return DZAGRADA;
}

\n {}                             

[ \t]+ {}   
                           
. {}
