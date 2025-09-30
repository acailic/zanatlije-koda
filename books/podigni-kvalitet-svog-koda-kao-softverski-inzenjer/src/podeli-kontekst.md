# Podeli kontekst

„Jednostavno znati šta se dešava“ ne postoji, pogotovo u softveru koji je haotičan i stalno se menja. Zato je kontekst presudan, naročito u pull requestu. Cilj je da objasnite zašto diff postoji i zašto izgleda baš tako.

Dobar kontekst odgovara na sledeća pitanja:
- Kakvu poslovnu vrednost donosi? Zašto uopšte radimo na zadatku? Ako postoji tiket, PRD ili dizajn dokument – linkujte ih.
- Koji je vaš izabrani pristup i zašto? Od bezbroj načina da napišete kod, objasnite zašto ste izabrali baš ovaj.
- Koje ste alternative razmatrali i zašto ste ih odbacili?
- Na šta ste se oslonili? Ako ste pratili postojeći modul, Stack Overflow ili raniji PR, recite to – recenzentu je korisno da zna.

Još jedan trik: komentarišite sopstveni PR. Ako je neki deo posebno zamršen ili kritičan, ostavite napomenu. Često nema načina da kod bude čitljiviji, ali bar možete objasniti „ovde sam morao da uradim hack zbog legacy-ja; otvoren sam za bolja rešenja“. Time kolegama štedite vreme i pozivate ih da vas izazovu – a najbolji inženjeri žele da im se kod rastavi kako bi naučili bolje obrasce.

Primer visokog standarda: rani PR iz internog Android projekta u kompaniji. Aplikacija je tada puštala video kroz YouTube web-view i nije imala full-screen. Kolega iz zajednice je poslao PR koji uvodi fullscreen podršku. Prvo je linkovao odgovarajući tiket, jasno opisao korisničku vrednost i objasnio pristup: korišćenje Kotlin koda, malo čišćenja i oslanjanje na ugrađeni `WebView`.

Zatim je pokrio poliranje i ivice scenarija: kada korisnik izađe iz full-screen prikaza, video ostaje sinhronizovan. Time je recenzentu dao sigurnost da je scenario razmotren. Komitovi su bili mali i fokusirani, sa jasnim opisima – ogroman plus.

Autor je detaljno opisao tehničku strategiju i alternative uz fer pros/cons analizu: direktna YouTube integracija bi koštala, kompleksniji okvir bi doneo više moći ali previše složenosti – klasično over-engineering razmišljanje. Dodao je i linkove ka Stack Overflow odgovorima koji su poslužili kao osnova.

Kao tehnički lead, kada vidim ovako pripremljen PR, odmah pomislim da radim sa jakim izvođačem. Ovakav nivo kvaliteta retko viđam čak i kod ranih seniora. Sledeći put kada šaljete PR, razmislite šta sve možete da dodate u kontekst sekciju. Plafon je veoma visok, a trud se višestruko isplati: tim brže razume šta ste uradili, lakše daje feedback i svi uče više.
