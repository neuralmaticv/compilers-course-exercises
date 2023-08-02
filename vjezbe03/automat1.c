#include <stdio.h>
#include <ctype.h>

enum StateType
{
    START,
    DRUGO,
    TRECE
};

int main()
{
    enum StateType stanje = START;
    char znak;

    printf("Unesite nisku:\n");
    znak = getchar();

    while (znak == 'a' || znak == 'b')
    {
        switch (stanje)
        {
        case START:
            if (znak == 'a')
            {
                stanje = DRUGO;
            }
            else if (znak == 'b')
            {
                stanje = TRECE;
            }
            break;
        case DRUGO:
            if (znak == 'a' || znak == 'b')
            {
                stanje = DRUGO;
            }
            break;
        case TRECE:
            if (znak == 'a' || znak == 'b')
            {
                stanje = TRECE;
            }
            break;
        }

        znak = getchar();
    }

    if (stanje == DRUGO && znak == '\n')
    {
        printf("Niska je prihvacena\n");
    }
    else
    {
        printf("Niska nije prihvacena\n");
    }

    return 0;
}