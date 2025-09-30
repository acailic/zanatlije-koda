# Prigrli bol

Hajde da pričamo o jednoj od mojih omiljenih tema kada razmišljamo o tome kako postati bolji softverski inženjer, posebno u pogledu kvaliteta rada, a to je: prigrli bol.

Ideja je da je najbolji način da naučite i zaista urezate koncepte u svoj mozak to da napravite grešku, jer tek tada možete iskreno da shvatite zašto bi stvari trebalo da se rade na bolji način. Zato je najbolji način da naučite da pišete dobar kod taj da prvo pišete loš kod.

Kao što sam već mnogo puta rekao, nema prečica. Ne možete preskočiti fazu lošeg koda. To je jednostavno nemoguće. Možete je ubrzati, o čemu govorimo u ovom kursu, možete smanjiti trajanje faze lošeg koda, ali ne možete je u potpunosti izbeći, jer da biste zaista stekli veštinu morate razumeti osnovne principe.

Put je važniji od odredišta – kliše, ali istinit i ovde primenjiv.

Zato preporučujem da uvek tražite svetlu stranu kada stvari krenu loše.

Kada vaš kod počne da se ruši, kad imate bag u produkciji, korisnici se žale, teško ga je proširiti, dobijete zahtev za funkciju i gledate svoj kod misleći „Bože, ovo će biti užasno teško da dodam“ – to je dobra stvar.

Ili kolege ne mogu da pročitaju vaš kod. Sećate se početka kursa kada su drugovi govorili: „Aleks, nemam pojma šta tvoj kod radi, teško mi je da ga pregledam i nadogradim.“ Sve to jeste neprijatno, ali dobra strana je što su to prilike da naučite.

Jer napisali ste loš kod ili kod koji je loš na neki način, a sada imate priliku da ga popravite i naučite kako se piše dobar kod. Napišite kod koji je bolji u aspektu koji želite da unapredite, bilo da je to debagovanje, stabilnost ili čitljivost.

Kada je u pitanju učenje, ideja zadržavanja znanja je ključna.

Lako je da koncept uđe na jedno uho a izađe na drugo, zar ne? Dok pasivno čitate knjigu, pogled lako sklizne preko stranica jer niste potpuno prisutni. Pročitate poglavlje, a nakon toga se gotovo ničega ne sećate.

Dok učite, pa i na ovom kursu, cilj treba da vam bude da maksimalno povećate verovatnoću zadržavanja informacija.

Zapitajte se: kakve su šanse da moj mozak za tri meseca i dalje pamti koncepte iz tog obrazovnog resursa i ume da ih primeni? Da biste to maksimalno povećali, pravite greške.

Kada pogrešite, napišete loš kod, ljudi vam se žale – bilo kolege, bilo korisnici – tada zaista učite kako da kod učinite boljim, jer mozak govori: „Ne želim ponovo ovo da doživim, ne želim da me ponovo kritikuju.“

Suprotno tome, video sam mnogo inženjera, često slabijih izvođača, koji se plaše da se suoče s bolom.

Napišu kod, oprezno prođu kroz srećan tok i odahnu kada radi. Pošalju PR, a da ne odvoje vreme da pročešljaju detalje, da prođu kroz ivice scenarija, da pokušaju namerno da slome kod i uvere se da je čvrst. To bi trebalo da radite, jer ne možete zauvek da bežite od problema.

Ako je vaš kod pun rupa, kad-tad će se to otkriti.

Zato bih čak promenio mantru iz „prigrli bol“ u „aktivno traži bol i izazovi ga“ – pronađi ta problematična mesta što je ranije moguće i namerno ih aktiviraj. To rade najbolji inženjeri.

Hajde da pogledamo razumevanje kroz vreme. Na x-osi je razumevanje koda, na y-osi je vrednost koju donosite kao softverski inženjer. Ovo je okvir kojim se vodim.

Stepen razumevanja nivoa 1 je: ovaj kod pravi ovu funkcionalnost. Tako svi počinjemo.

Samo kopirate kod iz tutorijala, unesete sitne izmene, pokrenete ga i radi. Kažete: „Super, to je to.“ Vaše razumevanje je: kada ubacim kod X, dobijem funkciju Y.

Nivo 2 je: kod radi, ali zaista shvatate šta se dešava ispod haube. Razumete različite potkomponente API-ja koje pozivate i način na koji međusobno sarađuju da bi funkcionalnost zaživela.

Cilj je nivo 3. Ovaj kod pravi ovu funkcionalnost, ovo je kako radi ispod površine, a evo i zašto su ovi API-jevi dizajnirani na taj način i kako je sve izgledalo ranije.

Kod se stalno razvija. U webu se nekad ručno pisao HTML i CSS, pa su došli JavaScript, jQuery, Bootstrap, a danas React i Tailwind.

Ako razumete stari, nezgrapni način, novi način, i osetite bol tog starog pristupa pre nego što pređete na elegantan savremeni, onda zaista razumete kako taj tehnološki stek funkcioniše.

To je cilj, jer inženjeri koji poseduju takav nivo razumevanja donose neverovatnu vrednost organizaciji: nose kontekst koji je potreban za otklanjanje teških problema i izgradnju složenih funkcionalnosti.

Usput, nivo 3 razumevanja – to je sistemski dizajn.

Ako želite da budete dobri u sistemskom dizajnu, morate imati nivo 3 razumevanja tehnološkog steka za koji ga radite.

Evo primera kako sam ja došao do takvog razumevanja i zašto mi je prolazak kroz bol pomogao da shvatim jednu ključnu stvar u Android inženjeringu.

Verovatno najvažniju stvar kada radite na korisničkim aplikacijama kao što su Robinhood ili Instagram.

Najbitnije kod Android UI-ja je kako da iscrtate listu. Svaka aplikacija negde ima listu.

ListView je originalni način za prikaz liste u Androidu. Mladi Aleks, pre više od deset godina, pisao je ListView-e i to je radilo jer sam samo želeo da nešto proradi.

Bio sam student, nasmejan.

Onda shvatim: ako sadržajna aplikacija ima više od sto stavki u listi, sve počinje da šteka.

E sad osećam bol. Kako da ga uklonim?

Moram da naučim koncept recikliranja prikaza.

Osnovna ListView implementacija je spora jer, ako imate sto stavki, renderuje svih sto u memoriji.

Samo deset je vidljivo, a ostale su van ekrana, ali i dalje zauzimaju resurse, pa zato aplikacija usporava.

Recikliranje prikaza znači da renderujete stavke na zahtev.

Ako je deset stavki vidljivo, u memoriji je samo tih deset. Kada se pomerite, stare stavke se sklanjaju, resursi se recikliraju za nove.

U suštini, svaki put kada se prikaže nova stavka, vi zapravo ponovo koristite staru.

Ako imate stavke od 1 do 10 i skrolujete, stavka 1 odlazi sa ekrana i postaje stavka 11.

To je elegantan, „lenji“ način iscrtavanja interfejsa.

To je jedno od ključnih načela u Androidu; pitam to i na intervjuima kao tehnički lead.

Na kraju sam naučio da implementiram recikliranje prikaza ručno u svom ListView modulu.

Bio sam ponosan: sada i sa sto stavki lista glatko skroluje, korisnicima je bolje.

Zatim shvatim da postoji ugrađena komponenta u Androidu: RecyclerView.

To je zapravo ListView sa već ugrađenom infrastrukturom za recikliranje.

Pomislio sam: „Vau, ovo je super!“

I opet – zato što sam osetio bol, zaista razumem šta ListView radi i zašto je bitan. To je nivo 3 razumevanja.

Nivo 1 bi bio da samo sledite tutorijal koji vam kaže da koristite RecyclerView jer je najnoviji, a da ne razumete zašto.

To ide i dalje. Tokom deset godina u Silicijumskoj dolini radio sam sa svim mogućim tehnološkim stekovima.

Radim i iOS, radio sam i web.

Sada znam da svaki front-end stek mora da prikazuje liste.

Moram da razmišljam o recikliranju prikaza.

Kada učim druge oblasti, unapred razmišljam o tom fundamentalnom konceptu kvaliteta i performansi.

To ubrzava moje učenje, jer ne moram da otkrivam problem reaktivno; proaktivno ga očekujem.

Kad pokušam da nacrtam listu na iOS-u, vodim računa da i tamo postoji recikliranje, jer želim brze, performantne aplikacije.

Vidite kako me organski put učenja i bol koji su korisnici osetili vodi do nivoa 3 razumevanja ovog sržnog Android koncepta.

Ovako nešto me čini veoma dobrim Android inženjerom.
