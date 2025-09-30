# Mit o „boljem“ kodu

Česta zabluda: brzina isporuke i kvalitet su suprotstavljeni. „Ako pišem pažljivo, biću spor; ako brzo bacam kod, više ću isporučiti.“ Realnost je drugačija.

Na početku karijere kriva možda deluje kao da bolji kvalitet usporava. Ali u praksi, kada kod nije dobar, review traje duže, pojave se bugovi, vraćaš se kodu, krpiš ga, prolaziš kroz više iteracija. Brzina tek tada pada. Kada unaprediš kvalitet, ciklus postaje kraći: PR brže prolazi, CI ne puca, nema produkcijskih požara.

Naravno, postoji tačka gde preterivanje sa perfekcionizmom počinje da koči napredak. Međutim, 70–80% puta postoji ogromna površina niskovisećih plodova: pažljivo planiranje, jasan kontekst, test plan, `one diff, one thesis`. Sve to podiže kvalitet i istovremeno ubrzava isporuku. Tek kada kreneš da juriš „10/10 savršenstvo“ na sitnicama, ulaziš u zonu opadajućih prinosa.

Uporedi dva scenarija:
- **„Brzi“ ali nepažljiv inženjer**: kod napiše brzo, ali review traje, CI puca, popravljaju se neshvaćeni granični slučajevi, pojavljuju se hotfix-evi. Vreme odlazi na saniranje posledica.
- **Iskusan inženjer**: duže ulaže u pripremu i pisanje, ali review prolazi munjevito, nema regresija, nema naknadnih vatri. Krajnji rezultat: brže je isporučio.

Zato kažemo da su kvalitet i brzina zapravo najbolji prijatelji – dokle god ne sklizneš u perfekcionistički ekstrem. Fokusiraj se na praksu koja podiže kvalitet i uklanja prepreke, umesto na brzopletost koja kasnije jede vreme.
