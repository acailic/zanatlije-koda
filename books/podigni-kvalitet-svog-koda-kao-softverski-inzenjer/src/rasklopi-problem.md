# Rasklopi problem

Posao softverskog inženjera je da rešava teške probleme, ali to ne znači da moraju ostati zastrašujući. Tajna je u dekompoziciji: razbij veliki zadatak na manje komade. Ako i dalje deluje zastrašujuće, razbij ga još.

Produktivnost se zasniva na jasnoći. Što su ti radni paketi precizniji i fokusiraniji, to ćeš se brže kretati. Na kraju treba da dobiješ niz malih zadataka, idealno PR po PR, uz jasnu sliku kako će izgledati tvoj stek commit-ova.

Veština dekompozicije pomaže svuda: u kodiranju, debagovanju (praćenje toka kroz sistem), delegiranju (kao tehnički lead deliš posao na pod-zadatke koje kolege mogu paralelno da rade) i u sistemskom dizajnu (veliki projekti zahtevaju da posebno promisliš svaku komponentu pre nego što uopšte napišeš kod).

Primer: implementiraš login. To zvuči zastrašujuće, naročito junioru. Razbij ga: prvo UI polje za email, pa validaciju email-a; zatim UI za lozinku, pa validaciju lozinke; na kraju mrežni poziv koji vraća token. Svaku stavku možeš dalje cepati – npr. dugme za prikaz lozinke u plaintextu je poseban mini-zadatak; mrežni sloj može imati zasebne PR-ove za uspeh i različite greške.

Kada sve razložiš, lakše je razmišljati o graničnim slučajevima, kvalitet koda raste, a juniori dobijaju zadatke koje zaista mogu da savladaju. Što dalju karijeru gradiš, projekti postaju veći (6, 12, 24 meseca). Bez vrhunske dekompozicije nema napretka. Zato vežbaj: manji komadi, jasni koraci, fokus na kvalitet.
