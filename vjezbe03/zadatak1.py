niska = input("Unesite nisku:")

stanja = {
    1: {'a':2, 'b':3},
    2: {'a':2, 'b':2},
    3: {'a':3, 'b':3}
}

stanje = 1
zavrsnaStanja = [2]
print("Pocetno stanje ", stanje)

for c in niska:
    try:
        stanje = stanja[stanje][c]
    except:
        print("Greska - nedozvoljen prelaz: ", c)
        stanje = -1
        break
    print(stanje)


if (stanje in zavrsnaStanja):
    print("Prihvacena niska")
else:
    print("Niska se odbija")