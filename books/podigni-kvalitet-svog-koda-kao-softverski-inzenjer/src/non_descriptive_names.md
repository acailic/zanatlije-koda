# Neopisni nazivi

Imena znače. Iako deluje banalno, većina obrazaca lošeg imenovanja svodi se na to da smo lenji ili da pretpostavljamo da svi razumeju naš žargon. Većina fakultetskih zadataka, tutorijala i Stack Overflow primera koristi očajne nazive (`str`, `arr`, `doStuff`). Ako ih samo kopiramo, u kod uvodimo maglu.

„Štednja vremena“ kratkim imenima zapravo troši vreme svima koji kasnije čitaju kod – uključujući i tvoju buduću verziju. Dovoljno je da svaka promenljiva, metoda i klasa dobiju smislen naziv; taj „sitni“ dobitak se gomila i čini kod enormno čitljivijim.

Kako pametno ulagati vreme?
- **Klase**: razmišljaj najviše. One definišu granice sistema – naziv mora jasno da kaže šta modul radi.
- **Metode/funkcije**: sledeći prioritet. Ime treba da otkriva efekat, ne samo tip povratne vrednosti (`calculateMonthlyFee`, ne `doCalc`).
- **Promenljive i parametri**: ne preskači ih, ali nemoj ni da se svađaš oko sitnica; cilj je da kontekst bude razumljiv bez gledanja u implementaciju.

Primer: funkcija koja razdvaja rečenice i kapitalizuje ih. Umesto `s` i `sb`, koristi `sentence`, `output`, `startIndex`, `endIndex`. For petlja tada bukvalno čita kao engleska rečenica. Dodaj kratak komentar gde pomaže i odmah dobijaš 20–30% više čitljivosti za minut posla.

Pravilo: piši kao da tim upravo dobija novog pripravnika koji ništa ne zna o internom žargonu. Kod je već dovoljno složen; nema razloga da ga dodatno zamućujemo tajanstvenim kraticama. Iako nije engleski, može (i treba) da mu bude što bliži.
