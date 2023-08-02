#include <stdio.h>
#include <stdlib.h>
// Gramatika je
// S -> AB | rB
// A -> pSq | eps
// B -> qA

// Deklaracija cjelobrojne promjenljive nailazeci koja uzima vrijednosti iz skupa izbora za pravila sa istom lijevom stranom
unsigned char nailazeci;

void greska()
{
    printf("Greska");
    exit(1);
}

// poredi cjelobrojni argument sa trenutnom vrijednoscu promjenljive nailazeci
// i poziva leksicki analizator tj. getchar()
void uporedi(unsigned char x)
{
    if (x == nailazeci)
        nailazeci = getchar();
    else
        greska();
}

// Deklaracija funkcija
void S(), A(), B();

// definicija funkcije za neterminal S
// S-> AB | rB
void S()
{
    if (nailazeci == 'r')
    {
        uporedi('r');
        B();
    }
    else
    {
        A();
        B();
    }
}

void A()
{
    if (nailazeci == 'p')
    {
        uporedi('p');
        S();
        uporedi('q');
    }
    else
        ;
}

void B()
{
    if (nailazeci == 'q')
    {
        uporedi('q');
        A();
    }
    else
    {
        greska();
    }
}

void analiza()
{
    nailazeci = getchar();
    S();
    if (nailazeci != '\n')
        greska();
}

int main()
{
    printf("unesite nisku: ");
    analiza();
    printf("Niska je sintaksno ispravna");
}