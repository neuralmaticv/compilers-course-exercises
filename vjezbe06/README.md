# Vježbe 6 
### **Lex i yacc**

Potrebno je da instalirate flex.

### **Zadaci:**
Napisati leksički analizator
1. koji kompresuje razmake i tabulare na jedan razmak, i odbacuje sve što se nalazi na kraju pročitane linije.
2. koji prepoznaje identifikatore i vraća informaciju o dužini identifikatora.
3. koji ispisuje i identifikuje pojavljivanje realnih brojeva.
4. koji prepoznaje cijele brojeve, realne brojeve, identifikatore, stringove i neke ključne riječi (npr. int, var, begin, end, to, do, for, itd.)
5. koji broji karaktere i linije.
   
### Izvršavanje zadataka:

```
flex naziv_zadatka.l

gcc lex.yy.c

a.out

```

**Napomena:** za izvršavanje komadi, potrebno je da se nalazite unutar odgovarajućeg direktorijuma
