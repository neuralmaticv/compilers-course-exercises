%option noyywrap

maloSlovo [a-z]
slova [a-zA-Z]
cifra [0-9]
ident {maloSlovo}({slova}|{cifra})*

%%
{ident} {
    return IDENT;
}

WHEN|when {
    return WHEN;
}

THEN|then {
    return THEN;
}
ELSE|else {
    return ELSE;
}

";" {
    return COL;
}

[ \t\n] {}

. {}
