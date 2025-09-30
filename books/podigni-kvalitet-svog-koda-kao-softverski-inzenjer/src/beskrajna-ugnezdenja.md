# Beskrajna ugnježdenja

Previše ugnježdenih `if/else` blokova je jedan od najfrustrirajućih antipattern-a: kod se razvlači udesno, moraš da skroluješ i horizontalno, i vertikalno. Kontrolni tokovi su već sami po sebi zahtevni, a kada sve spakuješ u jedan blok, čitanje postaje bolno.

Zamislimo nekoliko primera i kako ih popraviti:
- **Rani povratak**: umesto `if (...) { ... }`, prvo proveri neuspeh i odmah vrati rezultat. Smanjuje dubinu, iako dodaje liniju-dve.
- **Spajanje uslova**: ako proveravaš isti objekat (npr. `data != null` i `!data.isEmpty()`), objedini uslov sa `&&`. Manje uvlaka, isti efekat.
- **Pazi na logiku**: kada uslovi proveravaju različite objekte (npr. `lesson.id` i `activity`), ne smeš sve u jedan `if`. Ako ID fali, treba da prekineš bez obzira da li imaš `activity`. Previše optimizacije ugnježdenja može promeniti ponašanje.

Uvek razmišljaj u terminima pseudokoda na engleskom: šta je broj 1 stvar koju moraš da uradiš, šta sledeće, koje grananje te izbacuje iz funkcije. Sve što možeš da izdvojiš u pomoćne metode ili klase – uradi. Manje uvučenog koda znači jasniji tok, manje bugova i lakši review.
