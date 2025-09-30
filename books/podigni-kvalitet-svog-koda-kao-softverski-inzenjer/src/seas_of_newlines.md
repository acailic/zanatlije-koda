# Mora praznih redova

Ovaj antipattern je bukvalan: između svake sitne promene ubacimo gomilu praznih linija. Deluje kao sitnica, ali vidim je često. Ideja je da prazni redovi razdvajaju logičke celine – da između bloka A i bloka B napravimo „pauzu“ kako bi mozak stigao da promeni kontekst.

U praksi, rezultat je ogromna, razvučena datoteka koju je teže čitati – kao i kod previše komentara. Ako vam treba jasnija granica, pravi način je modularizacija: izdvojte blok u zasebnu metodu, helper klasu, manager ili delegat. Koristite alate koje već imate da kod podelite na komponente koje svaka rade jednu stvar dobro.

Kada naiđem na more praznih redova, pitam se gde je zapravo kod. Ako primetite ovaj obrazac u bazi, uklonite ga. I vi i vaše kolege – a i buduće verzije vas – bićete zahvalni, a kvalitet koda će porasti.
