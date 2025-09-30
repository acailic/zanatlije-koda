# Previše komentara

„Previše komentara“ je još jedan antipattern koji se često uči na fakultetu. I ja sam ga pokupio na UCLA. Kada tek otkrijete da kod može da sadrži rečenice na engleskom koje objašnjavaju šta se dešava, deluje sjajno: „Biću fin, sve ću iskomentarisati.“ Kako sazrevate, shvatite da možete ozbiljno preterati.

Fakulteti to rade da bi bili sigurni da studenti razumeju. Ima smisla, jer većina brucoša nema gotovo nikakvo realno iskustvo, pa im treba objašnjenje svake linije. Ideja glasi: „Ako ostavim gomilu komentara, kod će biti najlakši za razumevanje; praviću uslugu sebi i timu.“

Stvarnost je drugačija. Kada 50% i više linija koda prati komentar, datoteka postaje duža, teža za čitanje i kroz nju je prava muka probijati se. Podseća na „keširanje komentara“ o kojem smo ranije pričali – i dobrih stvari može biti previše, a kod komentara je prag veoma nizak. Mnogo je bolje napisati čitljiv kod koji se sam objašnjava i jednostavno izostaviti komentar. Najbolje kodne baze s kojima sam radio imaju možda 5–10% komentara, često i manje, jer kod teče prirodno: uz dobra imena promenljivih i metoda, deluje skoro kao engleski ili pseudokod.

Ako pišete kvalitetan kod – zbog toga ovaj kurs i postoji – ne treba vam gomila komentara. Pogledajmo primer. Desno je klasičan „školski“ kod: dve promenljive `a` i `b` (naravno, užasnih imena), rezultat i ispis. Svaki blok ima komentar. Ali i bez komentara jasno je da `a = 5` i `b = 7` inicijalizuju promenljive, da `a + b` sabira i da `print(result)` štampa vrednost. Komentari ne dodaju novu informaciju. Ako želite bolju čitljivost, popravite imena.

Ja bih to prepravio u metodu `printSum`: iz potpisa je jasno da prima dva broja, kod ih sabira, čuva zbir u privremenoj promenljivoj radi čitljivosti i zatim ga ispisuje. Kod je kraći, nema komentare, a intuitivno ime metode nosi objašnjenje. Sa devet linija spustili smo se na četiri i sve je preglednije.

Dakle, ako primetite da ostavljate gomilu komentara, verovatno ih koristite kao štake jer kvalitet koda nije dovoljno dobar. Ako sledite ostale savete iz kursa, komentar vam ne treba da bi kolege shvatile šta kod radi.
