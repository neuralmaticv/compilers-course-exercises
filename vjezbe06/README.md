# Vježbe 6 
### **Flex**

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

./a.out
```

**Napomena #1:** za izvršavanje komadi, potrebno je da se nalazite unutar odgovarajućeg direktorijuma  
**Napomena #2:** komentari se pišu u leksičkom analizatoru pomoću ` /* */` ali se prije "/*" unosi blanko znak  
**Napomena #3:** unos se prekida kombinacijom `CTRL+D`  
**Napomena #4:** za testiranje zadatka 5, možete navesti ulazni fajl za testiranje tako što ćete u terminalu unijeti:
```
./a.out < input.txt
```

