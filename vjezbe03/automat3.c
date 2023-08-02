#include <stdio.h>
#include <ctype.h>

enum StateType
{
    stanjeA,
    stanjeB,
    stanjeC,
    stanjeD,
    stanjeE
};

int main()
{
    enum StateType stanje = stanjeA;
    char znak;

    printf("Unesite nisku:\n");
    znak = getchar();

    while (znak == '0' || znak == '1')
    {
        switch (stanje)
        {
        case stanjeA:
            if (znak == '0')
            {
                stanje = stanjeB;
            }
            else if (znak == '1')
            {
                stanje = stanjeC;
            }
            break;
        case stanjeB:
            if (znak == '0')
            {
                stanje = stanjeB;
            }
            else if (znak == '1')
            {
                stanje = stanjeD;
            }
            break;
        case stanjeC:
            if (znak == '0')
            {
                stanje = stanjeB;
            }
            else if (znak == '1')
            {
                stanje = stanjeC;
            }
            break;
        case stanjeD:
            if (znak == '0')
            {
                stanje = stanjeB;
            }
            else if (znak == '1')
            {
                stanje = stanjeE;
            }
            break;
        case stanjeE:
            if (znak == '0')
            {
                stanje = stanjeB;
            }
            else if (znak == '1')
            {
                stanje = stanjeC;
            }
            break;
        }

        znak = getchar();
    }

    if (stanje == stanjeE && znak == '\n')
    {
        printf("Niska je prihvacena\n");
    }
    else
    {
        printf("Niska nije prihvacena\n");
    }

    return 0;
}