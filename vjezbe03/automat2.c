#include <stdio.h>
#include <ctype.h>

#define greska()              \
    {                         \
        printf("\nGreska\n"); \
    }

int main()
{
    int stanje = 1;
    char znak;

    printf("Unesite nisku:\n");
    znak = getchar();

    while (znak == 'a' || znak == 'b' || znak == 'c')
    {
        switch (stanje)
        {
        case 1:
            if (znak == 'a')
            {
                stanje = 1;
            }
            else if (znak == 'b')
            {
                stanje = 2;
            }
            else if (znak == 'c')
            {
                stanje = -1;
                greska();
            }
            break;
        case 2:
            if (znak == 'a')
            {
                stanje = -1;
                greska();
            }
            else if (znak == 'b')
            {
                stanje = -1;
                greska();
            }
            else if (znak == 'c')
            {
                stanje = 2;
            }
            break;
        }

        znak = getchar();
    }

    if (stanje == 2 && znak == '\n')
    {
        printf("Niska je prihvacena\n");
    }
    else
    {
        printf("Niska nije prihvacena\n");
    }

    return 0;
}
