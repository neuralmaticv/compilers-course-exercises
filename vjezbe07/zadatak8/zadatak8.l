%option noyywrap

%{
    #define I_CONST 1
    #define F_CONST 2
%}

cifra [0-9]
predznak [+-]?

%%

{predznak}{cifra}+ {
    // cjelobrojna konstanta
    return I_CONST;
}

{predznak}{cifra}+\.{cifra}*([eE]{predznak}{cifra}+)? {
    // realna konstanta
    return F_CONST;
}

. {
    // prazna akcija
}

\n ;

%%

int main(void) {
    // tokeni se predstavljaju cjelobrojnim vrijednostima
    int token;

    // pozivamo funkciju sve dok ima tokena na ulazu, kada lexer dodje do EOF, vraca 0
   
    while((token = yylex()) != 0) {
        // ispisujemo token i njegovu vrijednost
        switch(token) {
            case I_CONST:
                printf("Pronadjena cjelobrojna konstanta %s\n", yytext);
                break;
            case F_CONST:
                printf("Pronadjena realna konstanta %s\n", yytext);
                break;
        }
    }
  
    return 0;
}

