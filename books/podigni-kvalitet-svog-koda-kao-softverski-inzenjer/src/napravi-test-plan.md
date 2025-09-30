# Napravi test plan

Od svih taktika za bolji pull request, test plan je najlakša, a donosi ogromnu vrednost. Tu naviku sam pokupio još u PayPal-u: jedan stariji inženjer me naučio da svaku izmenu ispratim jasnim planom testiranja. Kada sam kasnije došao u Courier, tim ga nije koristio – počeo sam da prilažem test planove i praksa se brzo proširila.

Test plan je odgovor na pitanje: kako znamo da izmena radi? To je ponovljiv način da pokreneš novu funkcionalnost, isprobaš je i pokažeš drugima šta se dešava. U suštini, to je demo – a ljudi vole vizuelne dokaze. Video, GIF ili snimak ekrana odmah pokaže šta se promenilo; recenzent ne mora da čita kod da bi video korisničku vrednost.

Za frontend je jednostavno: snimi kako otvaraš ekran koji si dodao, prođi kroz tok i pokaži rezultate. Ako neko kasnije treba da proveri funkcionalnost, samo sledi korake iz snimka. Za backend treba malo kreativnosti: možeš priložiti logove, pokazati odgovore API-ja u Postmanu, ili demonstrirati promenu kroz ceo stack – npr. dodavanje novog polja u JSON i render na klijentu. Bitno je da postoji artefakt koji jasno otkriva kako se kod aktivira i šta radi.

Dobar test plan gradi poverenje: recenzent vidi da je kod „izvozan“, da su ivice scenarija pokrivene i da neće završiti u produkciji kao eksplozija. Buduće kolege će ti biti zahvalne – posle šest meseci, kada se vrate na stari kod, video im tačno pokaže kako da reprodukuju tok bez lutanja.

Primer: rani PR za internu Android aplikaciju u kompaniji koji je dodavao fullscreen podršku za YouTube webview. Autor je priložio screenshot pre i posle, a zatim i kratak video. Još bolji primer je PR za moju aplikaciju Random Name Picker (preko milion korisnika). Mentee je dodao mogućnost uklanjanja slike sa imena i poslao detaljan video: uklanjanje slike, provera da su opcije nestale, vraćanje slike, testiranje u landscape modu – sve što je moglo da pođe po zlu pokriveno je u snimku.

Takav test plan meni kao revieweru pruža mir: jasno je da je funkcionalnost proverena i da unapređuje iskustvo. Ako možeš da snimiš video – uradi to, posebno za funkcionalnosti sa mnogo ivica scenarija. Možeš čak dodati vremenske oznake ili više kratkih snimaka i spakovati ih u tabelu. Takva pažnja prema detaljima odaje inženjera koji brine o kvalitetu i korisniku.
