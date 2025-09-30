# Kako da vodite migracije

Hajde da pričamo o konkretnom scenariju: kako da izvedete migraciju. U velikim kompanijama to je česta situacija. Kodna baza stari, problemi se gomilaju i lako je pomisliti da je vreme za totalni rewrite. Moj savet je: ako radite veliki refaktoring, odradite ga globalno.

Razlog je jednostavan – konzistentnost je presudna za čitljivost i razumevanje. Ako biram između kodne baze u kojoj je pola fajlova na novom, modernom obrascu, a pola na starom, i one koja je 100% legacy, izabraću drugu. Bar je dosledna: ne skačem iz fajla u fajl pitajući se zašto sve izgleda kao da su ga pisale dve potpuno različite firme. Prvi tehnički lead s kojim sam radio u Robinhoodu rekao mi je: „Radije ću raditi u dosledno lošoj kodnoj bazi nego u onoj koja napola glumi da je dobra.“ To savršeno ilustruje legendarna rečenica iz serije „Parks and Recreation“: „Nikada ne uradi dve stvari na pola – uradi jednu do kraja.“

Još jedan razlog da refaktori budu globalni jeste način na koji pišu novi inženjeri. Novi možete biti na dva načina: ili ste iskusni, ali ste tek došli u tim i tek upoznajete stek, ili ste junior koji se još uvek snalazi. Tok rada izgleda ovako: dobiješ zadatak, pronađeš komad postojećeg koda koji radi nešto slično, iskopiraš ga u svoj PR, malo ga prilagodiš i pošalješ na review. Ako dodajete novi API endpoint, verovatno ćete uzeti poslednji koji je tim dodao, promenićete parametre i URL, i to je to. Logika ostaje uglavnom ista.

To znači da se obrasci neverovatno brzo šire, jer se ogroman deo posla svodi na copy-paste. Novi ljudi nemaju luksuz da sednu i temeljno razumeju svaki detalj: njihov cilj je da se onboarding završi i da što pre donesu vrednost. I to je sasvim u redu.

Ali, ako ste tehnički lead koji vodi refaktoring, morate imati ovo na umu. Ako stari kod ostane negde u ćošku, novi inženjer će ga neminovno pronaći, kopirati i tako ponovo raširiti legacy obrazac. Dovoljno je da se to desi nekoliko puta i dobili ste onu užasnu „50/50“ kodnu bazu u kojoj je svaka druga datoteka potpuno drugačija.

Zato je zaključak jednostavan: ako se prihvatite refaktora – završite ga. Odradite ga globalno, uklonite stari obrazac i tek tada uvedite novi. U suprotnom ćete stvoriti haos koji je gori od početnog stanja.
