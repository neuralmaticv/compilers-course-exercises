%option noyywrap

%{
    #include <stdlib.h>
    #include <math.h>

    #define KLJUC 1
    #define IDEN 2
    #define I_CONST 3
    #define F_CONST 4
    #define OP 5
    #define RO 6
    #define INT 7
    #define OD 8
    #define Z 9
    #define INTER 10
    #define NN 11
%}

cifra [0-9]
ident [a-z][a-z0-9]*

%%
{cifra}+ {return I_CONST;}
{cifra}+"."{cifra}+ {return F_CONST;}

if|then|begin|end|procedure|function|var|integer {return KLJUC;};

{ident} {return IDEN;};

"+"|"-"|"*"|"/" {return OP;};

":=" {return OD;};

"<"|"<="|">"|">="|"="|"!=" {return RO;};

"("|")"|"["|"]" {return Z;};

[.,:;] {return INTER;}

[ \t\n] 
. {return NN;};
%%

int main(int argc, char *argv[]) {
    int token;

    if (argc > 1) {
        yyin = fopen(argv[1], "r");

        if (yyin == NULL) {
            printf("Ne mogu otvoriti datoteku %s\n", argv[1]);
            exit(1);
        }
    } else {
        yyin = stdin;
    }
    
    yylex();

    while ((token = yylex()) != 0) {
        switch(token){
            case I_CONST:
                printf("I_CONST\t%d\n", atoi(yytext));
                break;
            case F_CONST:
                printf("F_CONST\t%f\n", atof(yytext));
                break;
            case KLJUC:
                printf("Ključna riječ\t%s\n", yytext);
                break;
            case IDEN:
                printf("Identifikator\t%s\n", yytext);
                break;
            case OP:
                printf("Operator\t%s\n", yytext);
                break;
            case OD:
                printf("Operator dodjele\t%s\n", yytext);
                break;
            case RO:
                printf("Relacioni operator\t%s\n", yytext);
                break;
            case Z:
                printf("Zagrada\t%s\n", yytext);
                break;
            case INTER:
                printf("Interpunkcijski znak\t%s\n", yytext);
                break;
            case NN:
                printf("Nepoznato\t%s\n", yytext);
                break;  
        }
    }

    return 0;
}
