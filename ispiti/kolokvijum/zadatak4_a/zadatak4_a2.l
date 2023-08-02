%option noyywrap

%{
int parentheses_count = 0;
%}

%%
[\(\)] { 
        if (yytext[0] == '(')
            parentheses_count++;
        else if (yytext[0] == ')')
            parentheses_count--;

        if (parentheses_count < 0) {
            fprintf(stderr, "Zagrade nisu uparene\n");
            exit(1);
        }
}

.   ;  /* Ignorisi ostale karaktere */

%%

int main(void) {
    yylex();

    if (parentheses_count > 0 || parentheses_count < 0) {
        fprintf(stderr, "Zagrade nisu uparene\n");
        return 1;
    } else {
        printf("Zagrade su uparene\n");
    }

    return 0;
}

