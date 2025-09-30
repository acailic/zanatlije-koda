# Znoji se oko detalja: naglasi ivice scenarija

Sledeći princip za bolji kod je: obrati pažnju na detalje i eksplicitno istakni granične slučajeve. Softver je oblast u kojoj greške bole. Zašto? Prvo, jer je izuzetno skalabilan – nekoliko kompanija danas opslužuje više od milijardu ljudi. Dodavanje infrastrukture je često samo pitanje budžeta. Drugo, kod koji izguramo u produkciju istog trena postaje stvarnost za sve korisnike (pogotovo na backendu). Dakle, ili isporučujemo vrednost svima odjednom, ili svima odjednom pravimo problem.

Većina problema krije se van glavne staze scenarija. Taj „srećan“ tok je obično brz i lagan; đavo se krije u detaljima. Ako želimo visoko kvalitetan kod, moramo proaktivno da pronađemo i zatvorimo te rupe. Biti pedantan izuzetno vredi – u softveru i u životu. U velikim kompanijama to je presudno: bug koji pogađa 0,25% korisnika može značiti milion ljudi.

Zato gurajte softver do granica u svakoj fazi: planiranja, pisanja koda, code review-a i testiranja. Koristite sopstveni proizvod. Dok sam radio na Instagramu, iako privatno ne volim društvene mreže, namerno sam postao aktivan da bih probavao neobične tokove, klikao dugmad pogrešnim redosledom, unosio „čudne" vrednosti. Na skali od dve milijarde korisnika garantovano postoji neko ko će upasti u svaku zamislivu čudnu situaciju.

Promenite način razmišljanja:
- Nemojte pretpostaviti da korisnici znaju kako se vaš proizvod koristi.
- Nemojte pretpostaviti da neće grešiti (ili pokušavati da vas sruše).
- Nemojte pretpostaviti da imaju vrhunski telefon, stabilnu mrežu ili da čitaju onboarding poruke. Ljudi preskaču tekst, pažnja je kratka.

Uzmite suprotno: zamislite da imaju najgori uređaj, da ignorišu uputstva i da namerno testiraju granice. Tek tada ćete isporučiti zaista otpornu aplikaciju.

Definišuća crta lošeg inženjera je bežanje od teških problema. Happy flow je lak; verovatno vam uzima 20–30% posla. Preostalih 70% je u detaljima: dizajnu, skaliranju, graničnim slučajevima. Dobri inženjeri ne beže od tog rada – oni trče ka njemu. Ako želite da budete u toj kategoriji, naviknite se da problemi budu nezgodni i da ih rešavate temeljno.
