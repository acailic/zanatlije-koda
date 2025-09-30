# Komentarisani kod kao „keš“

Tokom kursa stalno ponavljamo: nema univerzalno čistih obrazaca. Ali postoje obrasci koji su gotovo uvek loši. Jedan od njih je „keširanje“ koda komentarima. Vidim ga iznova: funkcija se uklanja, ali „možda će nam opet trebati“, pa je razvlače kroz `//`. Ili je inženjer proveo nedelju na nekom pristupu, morao da ga odbaci, ali ne želi da izbriše „dragocen“ kod koji je napisao. Rezultat je zombirani blok koji samo otežava čitanje fajla.

Verujte, „dan kada će nam opet zatrebati“ gotovo nikad ne dođe. U međuvremenu, svaki prolazak kroz fajl postaje teži, pogotovo kada na jednom mestu imate više takvih grozdova. Deluje naivno, ali ovaj antipattern viđam u realnim kodnim bazama, i to često.

Što je najgore, razlog za njegovo postojanje je iluzija: imamo verzionisanje. Bilo da je Git, Mercurial ili nešto treće – ništa se zapravo ne gubi. Svaka ozbiljna firma koristi verzionu kontrolu, a ako ne, treba da se zabrinete. Dakle, nema potrebe da čuvate kod u komentarima „za svaki slučaj“ – istorija commita ga već čuva.

Čak i kada se dogodi retka situacija da treba vratiti stari kod, Git čini to trivijalnim. Dok sam radio na Taro aplikaciji, jednom sam morao da vratim mali UI modul: prošetao sam kroz istoriju commit-a, pronašao tačno onu promenu koja ga je obrisala, kopirao relevantne delove i vratio ih. Dve minute posla.

Nasuprot tome, svaki dodatni prolazak kroz fajl koji sadrži gomilu zakomentarisanih blokova povećava kognitivno opterećenje: treba razlikovati šta je aktivno, šta nije i da li nešto slučajno treba vratiti. Taj trošak se nakuplja mnogo brže nego što bi ikada uštedeli time što je kod „pri ruci“.

Zato – naučite verzionisanje i koristite ga. Ako se kod više ne izvršava, obrišite ga. Komentari nisu skladište.
