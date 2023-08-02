rijec = str(input("Unesite nuku rijec:"))

# prelazi
automat = {1:{"0":2, "1":1},
           2:{"0":3, "1":1},
           3:{"0":4, "1":2},
           4:{"0":-1, "1":5},
           5:{"0":6, "1":5},
           6:{"0":7, "1":5},
           7:{"0":-1, "1":5}
}

# pocetno stanje
stanje = 1

# iteriramo kroz rijec i provjeravamo prelaze
for simbol in rijec:
    print(stanje)
    if stanje == -1:
        break
    stanje = automat[stanje][simbol]

# ako smo dosli u stanje 4, koje je zavrsno, prihvatamo rijec
if stanje in [4,5,6,7]:
    print("Rijec je prihvacena.")
else:
    print("Rijec nije prihvacena.")
    