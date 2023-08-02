#include <stdio.h>
#include <ctype.h>

enum Stanja
{
    S0,
    S1,
    S2,
    S3,
    S4,
    SG
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
                stanje = S2;
            }
            else if (karakter == '1')
            {
                stanje = S3;
            }
            break;
        case S2:
            if (karakter == '0')
            {
                stanje = S0;
            }
            else if (karakter == '1')
            {
                stanje = S4;
            }
            break;
        case S3:
            if (karakter == '0')
            {
                stanje = S2;
            }
            else if (karakter == '1')
            {
                stanje = S3;
            }
            break;
        case S4:
            if (karakter == '0')
            {
                stanje = S2;
            }
            else if (karakter == '1')
            {
                stanje = SG;
            }
            break;
        case SG:
            printf("Greska\n");
            break;
        }

        karakter = getchar();
    }

    if (karakter == '\n' && stanje == S3 || stanje == S4)
    {
        printf("Prihvaceno\n");
    }
    else
    {
        printf("Odbijeno\n");
    }
}