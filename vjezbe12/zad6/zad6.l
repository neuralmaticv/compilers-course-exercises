%option noyywrap

%{
    int brRecenica = 0;
    int brRijeci = 0;
%}

recenica [A-Z][^.!?]*[.!?]
rijec [a-zA-Z]+


%%
{rijec} {brRijeci++;}
{recenica} {brRecenica++; printf("Recenica\n");}
(0[1-9]|[12][0-9]|3[01])[/](0[1-9]|1[012])[/][0-9]{4} {printf("Date\n");}
"(" return ZAGRADA1;
")" return ZAGRADA2;
. ;



