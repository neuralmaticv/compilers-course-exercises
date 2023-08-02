%option noyywrap

slovo [A-Za-z]
cifra [0-9]
broj [1-9]{cifra}*
prom {slovo}({slovo}|{cifra})*

%%

while {return WHILE;}
do {return DO;}
begin {return BEG;}
end {return END;}
:= {return DODELA;}
= {return EQ;}
; {return SEMI;}
{broj} {return BROJ;}
{prom} {return PROM;}

