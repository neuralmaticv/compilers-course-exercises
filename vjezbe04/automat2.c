#include <stdio.h>
#include <ctype.h>
#define greska()            \
    {                       \
        printf("Greska\n"); \
    };

enum Stanja
{
    S0,
    S1,
    S2,
    S3,
    SG
};

int main()
{
    enum Stanja stanje = S0;
    printf("Unesite nisku: ");
    char karakter = getchar();

    while (karakter == 'a' || karakter == 'b' || karakter == 'c')
    {
        switch (stanje)
        {
        case S0:
            if (karakter == 'a')
            {
                stanje = S1;
            }
            else if (karakter == 'b')
            {
                stanje = S2;
            }
            else
            {
                stanje = SG;
                greska();
            }
            break;
        case S1:
            if (karakter == 'a')
            {
                stanje = S1;
            }
            else if (karakter == 'b')
            {
                stanje = S2;
            }
            else if (karakter == 'c')
            {
                stanje = S3;
            }
            else
            {
                stanje = SG;
                greska();
            }
            break;
        case S2:
            if (karakter == 'a')
            {
                stanje = S1;
            }
            else if (karakter == 'b')
            {
                stanje = S2;
            }
            else
            {
                stanje = SG;
                greska();
            }
            break;
        case S3:
            // ili != EOF
            if (karakter != '\n')
            {
                stanje = SG;
                greska();
            }
            break;
        }

        karakter = getchar();
    }

    if (karakter == '\n' && stanje == S3)
    {
        printf("Prihvaceno\n");
    }
    else
    {
        printf("Odbijeno\n");
    }
}
