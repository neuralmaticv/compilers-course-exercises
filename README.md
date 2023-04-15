# Vježbe iz predmeta Konstrukcija kompilatora


# Flex i yacc

**Flex** (Fast Lexical Analyzer Generator) i **yacc** (Yet Another Compiler Compiler) su alati za generiranje leksičkog i sintaksnog analizatora.

---

## Flex
Flex generiše leksički analizator koji obrađuje ulazni niz tekst i generiše tokene. Flex se sastoji od skupa pravila koja opisuju leksički analizator, pravila se definišu kao regularni izrazi, i odgovarajućih akcija napisanih u C-u. Prilikom analize ulaza, flex traži pojavljivanja niski koje odgovaraju regularnim izrazima i na osnovu tog prepoznavanja izvršava odgovarajuće akcije.

Flex fajl se završava ekstenzijom **.l** i sadrži tri dijela:
1. **Sekcija definicija** - definisanje globalnih varijabli, funkcija i makroa
```
%{
    #include <stdio.h>
    int brojac = 0;
%}
```
2. **Sekcija skupa pravila** - regularni izrazi
```
[0-9]+ { 
    printf("Broj: %s\n", yytext);
}
```
3. **Sekcija akcija** - korisnički definisane funkcije
```
%%
int main() {
    yylex();
    return 0;
}
%%
```

---
## Yacc

Yacc generiše parser koji se koristi za pretvaranje ulaznog teksta u sintaksno stablo. Pravila se definišu uz pomoć gramatika, i koristi se LALR (Look-Ahead Left-to-Right) parser.
