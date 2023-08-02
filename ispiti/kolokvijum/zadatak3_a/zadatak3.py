unos = input("Unos:")

automat = {
    1:{'1':1,'0':2},
    2:{'1': None, '0':3},
    3:{'1': None, '0':4},
    4:{'1':4, '0':None},
}

stanje = 1

for s in unos:
    print("stanje ", stanje)
    print("prelaz", s)
    stanje = automat[stanje][s]
    

if stanje == 4:
    print("Rijec se prihvata.")
else: 
    print("Rijec se odbija.")