#include <stdio.h>
#include <stdlib.h>

int nailazeci;

// NAPOMENA:
// U C-u, karakter se predstavlja pomocu '' navodnika
// a "" predstavlja string i npr. "a" == a + '\0' i duzina je 2, 'a' == a i duzina je 1
// zbog toga je potrebno koristiti '' za karaktere, a ne "" jer cemo uvijek imati gresku u zadataku
void greska()
{
    fprintf(stderr, "Greska\n");
    exit(1);
}

void uporedi(int x)
{
    if (x == nailazeci)
    {
        nailazeci = getchar();
    }
    else
    {
        greska();
    }
}

void S()
{
    if (nailazeci == '[')
    {
        printf("S->[SX]\n");
        uporedi('[');
        S();
        X();
        uporedi(']');
    }
    else if (nailazeci == 'a')
    {
        printf("S->a\n");
        uporedi('a');
    }
}

void X()
{

    if (nailazeci == '+')
    {
        printf("X->+SY\n");
        uporedi('+');
        S();
        Y();
    }
    else if (nailazeci == '-')
    {
        printf("X->Yb\n");
        uporedi('-');
        S();
        X();
        uporedi('c');
        uporedi('b');
    }
    else if (nailazeci == 'b')
    {
        printf("X->Yb\n");
        uporedi('b');
    }
    else
    {
        ; // epsilon
    }
}

void Y()
{
    if (nailazeci == '-')
    {
        printf("Y->-SXc\n");
        uporedi('-');
        S();
        X();
        uporedi('c');
    }
    else
    {
        ; // epsilon
    }
}

void analiza()
{
    nailazeci = getchar();
    S();
    if (nailazeci == '\n')
    {
        printf("Rijec je prihvacena\n");
    }
    else
    {
        printf("Rijec nije prihvacena\n");
        greska();
    }
}

int main()
{
    // poziv gcc -o zadatak1.exe zadatak1.c
    printf("Unesite rijec: ");
    analiza();
    return 0;
}
