%option noyywrap

%{
    int brOtvorenih = 0;
    int brZatvorenih = 0;
    int prvoOtvorena = 0;
    int flag = 1;
    /* flag koristim za provjeru slucaja kada imamo: ))(( */
%}

OTVOREA "("
ZATVORENA ")"
LINIJA [.]*\n
PREKID "q"

%%
{OTVOREA} {
    if (flag == 1) {
        flag = 0;
    }

    brOtvorenih++;
} 

{ZATVORENA} {
    if (flag == 1) {
        prvoOtvorena--;
        flag = 0;
    }

    brZatvorenih++;
    brOtvorenih--;
}

{LINIJA} {

    if ((brOtvorenih == 0) && (prvoOtvorena == 0)) {
        printf("Zagrade su uparene\n");
    } else {
        printf("Zagrade nisu uparene\n");
    }
    
    brOtvorenih = 0;
    brZatvorenih = 0;
    flag = 1;
    prvoOtvorena = 0;
}


{PREKID} {yyterminate();}
%%


int main() {
    yylex();
    return 0;
}
