rijec = str(input("Unesite nuku rijec:"))

# prelazi
automat = {1:{'a':2, 'b':3},
           2:{'a':2, 'b':2},
           3:{'a':3, 'b':3}}

# pocetno stanje
stanje = 1

# iteriramo kroz rijec i provjeravamo prelaze
for slovo in rijec:
    print(stanje)
    stanje = automat[stanje][slovo]

# ako smo dosli u stanje 2, koje je zavrsno, prihvatamo rijec
if stanje == 2:
    print("Rijec je prihvacena.")
else:
    print("Rijec nije prihvacena.")
    