#include <stdio.h>
#include <stdlib.h>

// da smo koristili poseban .h fajl, ovde bi bio #include "zadatak3.h"
#include "lex.yy.c"

void iskaz(void);
void izraz(void);

extern int brReda;   // definisano u lex.yy.c
extern char *yytext; // definisano u lex.yy.c
int ukupnoGresaka = 0;
int nailazeci;

#define greska(x)                                                                   \
    {                                                                               \
        printf("Greska na liniji %d\n %s umjesto lekseme %s\n", brReda, x, yytext); \
        ukupnoGresaka++;                                                            \
    }
#define uporedi(x) \
    (              \
        x == nailazeci) // vraća 1 ako je uspješno, 0 ako nije
#define citaj()              \
    {                        \
        nailazeci = yylex(); \
    } // čita sljedeću leksemu

void naredba()
{
    if (uporedi(WHILE))
    {
        citaj();
        iskaz();

        if (!uporedi(DO))
        {
            greska("Ocekivano DO");
        }

        citaj();
        naredba();

        if (!uporedi(SEMICOLON))
            greska("Ocekivano ;");
        citaj();
        return;
    }
    else if (uporedi(BEG))
    {
        citaj();

        do
        {
            naredba();
            if (!uporedi(SEMICOLON))
            {
                greska("Ocekivano ;");
            }
            citaj();
        } while (!uporedi(END));

        citaj();
        return;
    }
    else if (uporedi(VAR))
    {
        citaj();

        if (!uporedi(ASSIGN))
        {
            greska("Ocekivano :=");
        }

        citaj();
        izraz();

        return;
    }
    else
    {
        greska("Neispravna naredba");
    }
}

void izraz()
{
    if (!uporedi(NUM))
    {
        greska("Ocekivan broj");
    }
    citaj();
}

void iskaz()
{
    izraz();

    if (!uporedi(EQ))
    {
        greska("Ocekivano ==");
    }

    citaj();
    izraz();
}

int main(int argc, char **argv)
{
    if (argc > 1)
    {
        yyin = fopen(argv[1], "r");
    }
    else
    {
        yyin = stdin;
    }

    citaj();
    naredba();

    if (ukupnoGresaka == 0)
    {
        printf("Ispravan program\n");
        printf("Nema sintaksnih gresaka\n");
    }
    else
    {
        printf("Broj gresaka: %d\n", ukupnoGresaka);
    }
}
