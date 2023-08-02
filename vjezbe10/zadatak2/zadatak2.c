#include <stdio.h>
#include <stdlib.h>
#include "lex.yy.c"
// Napisali smo specifikaciju za leksicki analizator koji prepoznaje
// identifikatore i cijele brojeve

// Za gramatiku
// Izraz -> Sabirak NastavakI
// NastavakI -> + Sabirak NastavakI | - Sabirak NastavakI | eps
// Sabirak -> Faktor NastavakS
// NastavakS -> * Faktor NastavakS | / Faktor NastavakS | eps
// Faktor -> + Faktor | - Faktor | ProstFaktor
// ProstFaktor -> ( Izraz ) | NCIO | IDENT

int nailazeci;

void greska()
{
    printf("Greska");
    exit(1);
}

void uporedi(int x)
{
    // umjesto getchar() koristimo yylex() koji je definisan u lex.yy.c
    if (x == nailazeci)
        nailazeci = yylex();
    else
        greska();
}

void izraz(), nastavakI(), sabirak(), nastavakS(), faktor(), prostfaktor();

void izraz()
{
    sabirak();
    nastavakI();
}

void nastavakI()
{
    if (nailazeci == '+')
    {
        uporedi('+');
        sabirak();
        nastavakI();
    }
    else if (nailazeci == '-')
    {
        uporedi('-');
        sabirak();
        nastavakI();
    }
    else
        ;
}

void sabirak()
{
    faktor();
    nastavakS();
}

void nastavakS()
{
    if (nailazeci == '*')
    {
        uporedi('*');
        faktor();
        nastavakS();
    }
    else if (nailazeci == '/')
    {
        uporedi('/');
        faktor();
        nastavakS();
    }
    else
        ;
}

void faktor()
{
    if (nailazeci == '+')
    {
        uporedi('+');
        faktor();
    }
    else if (nailazeci == '-')
    {
        uporedi('-');
        faktor();
    }
    else
    {
        prostfaktor();
    }
}

void prostfaktor()
{
    if (nailazeci == NCIO)
        uporedi(NCIO);
    else if (nailazeci == IDENT)
        uporedi(IDENT);
    else if (nailazeci == '(')
    {
        uporedi('(');
        izraz();
        uporedi(')');
    }
    else
        greska;
}

void analiza()
{
    // poziv leksickog analizatora
    nailazeci = yylex();
    izraz();

    // CTRL+D | CTRL+Z | CTRL+C, EOF==0
    if (nailazeci != 0)
        greska();
}

int main()
{
    printf("Unesite nisku: ");
    analiza();
    printf("Niska je sintaksno ispravna\n");
}