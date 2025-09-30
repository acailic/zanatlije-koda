# Kvalitet koda nije statičan

Još jedan razlog zašto je teško „zakucati“ kvalitet koda: isti kod može biti odličan jednog dana, a nekoliko godina kasnije postane teret, čak i ako se nije menjao. Kako proizvodi rastu, menja se broj korisnika, timova, zahteva – a s tim i kriterijumi kvaliteta. Kod koji je savršen za startup od dva inženjera postaje kočnica kada na istom modulu radi 50 ljudi ili ga koristi 100 miliona korisnika.

Zaključak: moraš stalno da se prilagođavaš. „Što te je dovelo dovde, neće te odvesti dalje“ – ali isto tako, „što je druge odvelo tamo, ne mora pomoći tebi“. Ne možeš kopirati tuđe arhitekture bez konteksta.

Zamisli dva sistema:
- Monolit, nula testova, bez bekapa, sve u plaintextu, nema rate limit-a – i to za 10 miliona korisnika. Ludost, zar ne?
- Mikroservisi, 90% test pokrivenost, višeslojni bekapi, keširani buildovi, end-to-end enkripcija, DDoS zaštita – i to za 1.000 korisnika. Takođe ludost.

Prvi scenario je opasan jer zanemaruje razmere. Drugi je opasno preterivanje: troši vreme na infrastrukturu pre nego što si dokazao da proizvod vredi. Dok tražiš product-market fit, treba ti najjednostavnije, najbrže rešenje. Tek kada obim i rizik narastu, isplati se ulagati u tešku infrastrukturu.

Zato je kvalitet koda putovanje, ne destinacija. Stalno procenjuj kontekst i prilagođavaj se – to je jedini način da ostaneš relevantan inženjer.
