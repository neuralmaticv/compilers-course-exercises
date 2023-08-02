#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#define greska()            \
    {                       \
        printf("Greska\n"); \
        exit(0);            \
    };

int nailazeciTerminal;

void poredjenje(int terminal)
{
    if (terminal == nailazeciTerminal)
    {
        nailazeciTerminal = getchar();
    }
    else
    {
        greska();
    }
}

void S(), A(), B();

void S()
{
    // NIJE DOBRO, gramatiku je potrebno prebaciti u LL1 oblik
    A();
    B();
}

void A()
{
    if (nailazeciTerminal == 'a')
    {
        poredjenje('a');
        A();
    }
    else if (nailazeciTerminal == 'b')
    {
        poredjenje('b');
    }
    // else {
    //     greska();
    // }
}

void B()
{
    if (nailazeciTerminal == 'a')
    {
        poredjenje('a');
    }
    else if (nailazeciTerminal == 'b')
    {
        poredjenje('b');
        B();
    }
    //  else {
    //     greska();
    // }
}

int main(int argc, char **argv)
{
    printf("Unesite rijec: ");
    nailazeciTerminal = getchar();

    S();

    if (nailazeciTerminal == '\n')
    {
        printf("Rijec se prihvata\n");
    }
    else
    {
        printf("Rijec se ne prihvata\n");
    }

    return 0;
}
