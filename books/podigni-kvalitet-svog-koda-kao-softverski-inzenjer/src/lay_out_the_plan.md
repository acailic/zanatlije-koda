# Postavi plan

Iscrtaj plan. Taj savet sjajno oslikava ovaj mim ovde. Jedna je od mojih omiljenih video-igara, Red Dead Redemption 2, a lik na slici, Dutch, u igri je „čovek sa planom“. To je taj kontekst. Ali isto tako, postavljanje plana presudno je i za softverske inženjere koji žele da pišu dobar kod.

Dakle, pratite li pažljivo? Pitam zato što, da biste postavili plan, morate da radite stvari o kojima smo ranije govorili: da razložite zadatak i razmislite o ivicama scenarija.

Gde zapisati plan? Uglavnom postoje dva mesta. Prvo, možete ga staviti direktno u task ili tiket koji vam je dodeljen, u okviru alata za upravljanje projektima koji vaša kompanija koristi. Drugo je dizajn dokument.

Moj savet: za lakše zadatke, one koji više liče na task nego na projekat, samo unesite plan u sam tiket – ne treba da pravite poseban artefakt. Ali ako je zadatak veći, recimo duži od dve nedelje, a pogotovo ako prelazi mesec, ja bih napravio neki vid dizajn dokumenta. Ako plan zbijete u tiket, preplaviće vas količina detalja. Na tom horizontu verovatno se već bavite sistemskim dizajnom: ima mnogo razmišljanja na visokom nivou koje nema veze sa konkretnim linijama koda.

Šta uneti u plan? Ponovo ista „sastojci“: razloženi koraci koji će se grubo preslikati na niz pull requestova – ili na stek diffova, kako smo to zvali u Meti – zatim edge case-ovi i opšta strategija. Kako menjam data model? Kako izgleda šema novog modela koji dodajem u bazu? Kako izgleda API endpoint, koja je URL ruta, koje parametre prima? Koje klase menjamo? Takva pitanja.

Kada opisujete pristup i tražite povratnu informaciju od tima, pokušajte, kad god ima smisla, da predložite dve opcije. Time razgovor postaje zdraviji: deluje da nudite izbore, umesto da gurate kolege u jedino rešenje koje ste smislili. Kad ljudi imaju opcije, lakše je raditi trade-off analizu, uporediti pristupe i stići do boljeg ishoda. Naravno, nekad postoji samo jedno razumno rešenje, pa treba proceniti od slučaja do slučaja – ne morate na silu izmišljati dve opcije ako druga jednostavno ne postoji.

Kada ovo uradite, podelite plan sa timom. Sve što nije trivijalno – dakle, sve što nije posao za dan ili dva – vredno je timskog fidbeka, pogotovo ako ste junior. Ako ste novi u timu, tek ste promenili kompaniju ili ste na početku karijere, ogromno je da rano dobijete povratnu informaciju o tehnici, jer, iskreno, kao nov inženjer često ćete grešiti – bilo zbog manjka iskustva, bilo zato što ne poznajete postojeći sistem.

Ovakva rana „socializacija“ ubrzaće vaše učenje. Mnogo je bolje da plan doterate dok još niste napisali ni jednu liniju koda. Grozno je voditi veliku raspravu u code review fazi: već ste uložili vreme da napišete kod, a kolege vas pitaju „Zašto si ovo ovako uradio?“ i vraćaju vas na početak. Sav taj rad bi završio u kanti, što svima onemoguća.

Evo primera planiranja sa Tara. Pre par meseci radili smo na anonimnim komentarima na Taro forumu. Funkcionalnost izgleda ovako: postoji kućica „komentariši anonimno“, a kada je čekirate, dobijete nasumični identitet dinosaurusa, jer zajednicu zovemo tarodaktilima. Priča o tome je tema za neki drugi video.

Kako sam postavio plan za taj zadatak? Prvo sam popisao zahteve: opštu strategiju, data model i korisničko iskustvo. Na sreću, funkcija je bila relativno jednostavna – praktično jedan bool flag na objektu diskusije – ali odmah razmišljate i o edge case-ovima.

Ako neko komentariše anonimno, većina korisnika verovatno neće pokušati da klikne na avatar i pogleda profil, jer je lice anonimno. Ali morate obezbediti da, ako neko ipak klikne, identitet ne „procure“. U suprotnom biste uništili svrhu anonimnosti. Vidite kako sam unapred razmišljao o svim načinima na koje stvari mogu da se izjalove, i to je dovelo do uspešnog lansiranja funkcije.

Naravno, to nije jedino što je ušlo u Asana task dok sam skicirao projekat. Predstavio sam opcije. Razmišljali smo između dva pravca – to je više produkt-dilema nego čisto tehnička, ali ima posledice. Jedna je bila da održimo dinosaur-temu i sinhronizujemo se sa brendom tarodaktila, a druga da korisnika prikažemo generičnije, kao „korisnog Taro člana“ ili „podržavajućeg Taro člana“.

Vodili smo odličnu diskusiju u Taro timu o tome koji pravac da izaberemo, jer, ponovo, kada imate više opcija, razgovor je kvalitetniji.

Na kraju sam napravio i eksplicitno poglavlje o edge case-ovima. Pošto smo funkciju prvo izbacili na webu, morali smo da proverimo da li će nešto slomiti mobilnu aplikaciju. Mobile zapravo nema podršku da se pogledaju profili – logika za učitavanje profila je komplikovana. Analizirali smo i zaključili da je sve bezbedno sve dok je identitet zapisan u data modelu.

Još jedna ivica scenarija: šta se dešava kada komentarišete sopstveno pitanje? To se često dešava na Tarou, ljudi žele da zahvale zajednici na dobrim odgovorima. Tu anonimnost nema smisla, jer je i pitanje već anonimno. Bilo bi čudno da se originalni autor odjednom „pretvori“ u dinosaurusa. Zato smo odlučili da onemogućimo anonimne komentare na sopstveno pitanje.

Dakle, plan je obuhvatio temeljnu pokrivenost edge case-ova, ali i razmišljanje unapred: kakva proširenja bismo mogli da radimo? Ako postoji nešto što je verovatno na kratki rok, bolje je da to odmah uzmemo u obzir i pišemo kod tako da se lako proširi. Kad dođe trenutak za ta proširenja, nećemo trošiti mesece – kod će već moći da podnese buduće funkcije.
