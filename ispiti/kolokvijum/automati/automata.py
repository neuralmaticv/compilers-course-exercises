class DFA:
    def __init__(self, Q, Sigma, delta, q0, F) -> None:
        self.Q = Q # set stanja
        self.Sigma = Sigma # set simbola
        self.delta = delta # funkcija prelaza kao dict (rjecnik)
        self.q0 = q0 # pocetno stanje
        self.F = F # skup zavrsnih stanja
    
    def __repr__(self) -> str:
        return f'DFA({self.Q}, {self.Sigma}, {self.delta}, {self.q0}, {self.F})'
    
    def run(self, word):
        q = self.q0 # inicijalno stanje
        
        # dok rijec nije prazna, iteriraj kroz rijec
        while word != '':
            # u stanju si q, preko pravila na osnovu karaktera predji u novo stanje
            q = self.delta[(q, word[0])]

            # citaj naredni karakter tj. izbrisi prvi simbol rijeci
            word = word[1:]

        # Ako je q u skupu zavrsnih stanja, vrati True, u suprotnom vrati False
        return q in self.F
    
    def DFA_to_NFA(self):
        # stanja pretvaramo u skupove stanja
        delta_n = {qx: {qq} for qx, qq in self.delta.items()}
        return NFA(self.Q, self.Sigma, delta_n, {self.q0}, self.F)    


class NFA:
    def __init__(self, Q, Sigma, delta, S, F) -> None:
        self.Q = Q # set stanja
        self.Sigma = Sigma # set simbola
        self.delta = delta # relacija prelaska
        self.S = S # skup pocetnih stanja
        self.F = F # skup zavrsnih stanja
    
    def __repr__(self) -> str:
        return f'NFA({self.Q}, {self.Sigma}, {self.delta}, {self.S}, {self.F})'
    
    # ako nemamo skupa, vrati prazan skup
    def do_delta(self, q, x):
        try:
            return self.delta[(q, x)]
        except KeyError:
            return set({})
        

    def run(self, word):
        P = self.S # skup pocetnih stanja

        while word != '':
            # trebamo napraviti novi skup stanja u koje mozemo preci
            Pnew = set({})

            # iteriramo kroz stanja koja su u trenutnom skupu
            # i primjenjujemo funkciju prelaska na njih, te dodajemo u novi skup tako sto koristimo uniju
            #  | => unija
            for q in P:
                Pnew = Pnew | self.do_delta(q, word[0])
            
            word = word[1:]
            P = Pnew
        
        # nakon procesiranje cijele rijeci
        # ako je presjek skupa zavrsnih stanja i skupa stanja u kojima se nalazimo razlicit od praznog skupa, vrati True
        # presjek ne smije biti prazan skup
        return (P & self.F) != set({})
    
    def NFA_to_DFA(self):
        # TODO: implementirati pretvaranje NFA u DFA
        pass


if __name__ == '__main__':
    # (0, "1"):0 => ako si u stanju 0, preko prelaza "1" ides u 0
    D0 = DFA({0, 1, 2, 3, 4}, {"0", "1"},
            {(0, "1"):0, (0, "0"):1,
             (1, "0"):2, (1, "1"):4,
             (2, "0"):3, (2, "1"):4,
             (3, "1"):3, (3, "0"):4,
             (4, "0"):4, (4, "1"):4},
             0, {3})

    word = input("Unos za DFA:")
    print(D0.run(word))

    # imamo relaciju prelaska
    # (0, "1"):{0, 1} => ako si u stanju 0, preko prelaza "1" mozes preci u stanje 0 ili 1
    N0 = NFA({0, 1, 2}, {"0", "1"},
             {(0, "0"):{0},
              (0, "1"):{0, 1},
              (1, "0"):{2},
              (1, "1"):{2}},
              {0}, {2})
    
    word = input("Unos za NFA:")
    print(N0.run(word))

