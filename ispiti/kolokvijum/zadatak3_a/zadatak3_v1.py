unos = input("Unos:")

automat = {
    1:{'1':1,'0':2},
    2:{'1': 1, '0':3},
    3:{'1': 2, '0':4},
    4:{'1':5, '0':-1},
    5:{'1':5, '0':6},
    6:{'1':5, '0':7},
    7:{'1':5, '0':-1}
}

stanje = 1

for s in unos:
    # print("stanje ", stanje)
    # print("prelaz", s)
    stanje = automat[stanje][s]
    if stanje == "-1":
        break
    

if stanje in [4,5,6,7]:
    print("Rijec se prihvata.")
else: 
    print("Rijec se odbija.")
    