def provjera_automata(stanja, zavrsna, prelazi, niska):
    stanje = stanja[0]

    for znak in niska:
        if znak not in prelazi[stanje]:
            return False
        stanje = prelazi[stanje][znak]

    return stanje in zavrsna


if __name__ == "__main__":
    n = int(input("Unesite broj stanja: "))
    stanja = [input("Unesite oznaku za stanje %d: " % (i + 1)) for i in range(n)]

    m = int(input("Unesite broj zavrsnih stanja: "))
    zavrsna = [input("Unesite oznaku za zavrsno stanje %d: " % (i + 1)) for i in range(m)]

    print("Unesite prelaze u formatu: stanje1 znak_prelaza stanje2")
    prelazi = {}

    while True:
        unos = input()
        if unos == "":
            break
        stanje1, znak, stanje2 = unos.split()
        if stanje1 not in stanja or stanje2 not in stanja:
            print("Stanje nije validno!")
            continue

        if stanje1 not in prelazi:
            prelazi[stanje1] = {}
        prelazi[stanje1][znak] = stanje2
    
    print("Unesite nizove za provjeru:")
    while True:
        niska = input()
        if niska == "":
            break
        print("Automat %s datu nisku." % ("prihvata" if provjera_automata(stanja, zavrsna, prelazi, niska) else "odbija"))

