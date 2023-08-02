#include <stdio.h>
#include <ctype.h>

enum Stanja
{
    A,
    B,
    C,
    D,
    E
};

int main()
{
    enum Stanja stanje = A;
    printf("Unesite nisku: ");
    char karakter = getchar();

    while (karakter == 'a' || karakter == 'b')
    {
        switch (stanje)
        {
        case A:
            if (karakter == 'a')
            {
                stanje = B;
            }
            else if (karakter == 'b')
            {
                stanje = C;
            }
            break;
        case B:
            if (karakter == 'a')
            {
                stanje = B;
            }
            else if (karakter == 'b')
            {
                stanje = D;
            }
            break;
        case C:
            if (karakter == 'a')
            {
                stanje = B;
            }
            else if (karakter == 'b')
            {
                stanje = C;
            }
            break;
        case D:
            if (karakter == 'a')
            {
                stanje = B;
            }
            else if (karakter == 'b')
            {
                stanje = E;
            }
            break;
        case E:
            if (karakter == 'a')
            {
                stanje = B;
            }
            else if (karakter == 'b')
            {
                stanje = C;
            }
            break;
        }

        karakter = getchar();
    }

    if (karakter == '\n' && stanje == E)
    {
        printf("Prihvaceno\n");
    }
    else
    {
        printf("Odbijeno\n");
    }
}
