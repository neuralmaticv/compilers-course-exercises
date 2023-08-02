#include <stdio.h>
#include <ctype.h>

enum Stanja
{
    S0,
    S1,
    S2,
};

int main()
{
    enum Stanja stanje = S0;
    printf("Unesite nisku: ");
    char karakter = getchar();

    while (karakter == '0' || karakter == '1')
    {
        switch (stanje)
        {
        case S0:
            if (karakter == '0')
            {
                stanje = S1;
            }
            else if (karakter == '1')
            {
                stanje = S2;
            }
            break;
        case S1:
            if (karakter == '0')
            {
                stanje = S1;
            }
            else if (karakter == '1')
            {
                stanje = S2;
            }
            break;
        case S2:
            if (karakter == '0')
            {
                stanje = S1;
            }
            else if (karakter == '1')
            {
                stanje = S2;
            }
            break;
        }

        karakter = getchar();
    }

    if (karakter == '\n' && stanje == S2)
    {
        printf("Prihvaceno\n");
    }
    else
    {
        printf("Odbijeno\n");
    }
}
