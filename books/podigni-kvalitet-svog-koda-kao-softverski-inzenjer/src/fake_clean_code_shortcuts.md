# Lažne prečice ka „čistom“ kodu

Kada pitate iskusnog inženjera za univerzalni recept, često ćete čuti: „Zavisi.“ Softver je stvar konteksta. Retko postoji jedno savršeno rešenje – uvek su tu kompromisi. I svaki put iznova vidim kako ljudi traže prečicu do „čistog koda“.

Pojam čistog koda zvuči privlačno: neka biblioteka, pattern ili jezik koji će svuda raditi i magično poboljšati kvalitet. Ali takva stvar ne postoji. Nema jedne tehnologije koju možete nakalemiti na bilo koji sistem i proglasiti posao završenim. Ono što odlično funkcioniše u jednom kodnom bazenu može biti katastrofa u drugom. Na sopstvenoj koži sam to osetio prelazeći između Mete/Instagrama i Robinhooda – isti stil rada ne možete bez razmišljanja preneti.

Sve je stvar kompromisa: ako je rešenje „10/10“ u jednoj kategoriji, često je „6/10“ u drugoj. Kao u RPG igrama – ne možete imati maksimalnu snagu i inteligenciju istovremeno. Zato moramo da vagamo.

Nekoliko tipičnih zabluda:
- **„Moramo imati najnoviji, najmoderniji framework.“** Novi okvir često nema dokumentaciju, Stack Overflow niti ChatGPT nemaju dobre odgovore, a kompleksnost je visoka. Kultura, obim i potrebe FANG kompanija nisu isti kao u vašoj. Kopiranje „proverenog“ rešenja retko radi bez prilagođavanja.
- **„Što kraće, to bolje.“** Pisati superkoncizan kod može delovati pametno, ali često skriva složenu magiju ispod haube – teško je debagovati, performanse stradaju, a kada se pojavi bug, morate prokopati tri sloja apstrakcije da biste pronašli uzrok.
- **„Ubacimo najnoviji tehnološki buzzword.“** Generativna AI, LLM-ovi, mašinsko učenje… Sve to može biti sjajno, ali unosi dodatnu složenost i retko postoji dobar vodič za stvarne probleme. Video sam PM-a koji je želeo ML da bi personalizovao redosled opcija u podešavanjima – a dovoljno je bilo dodati pretragu. Dodatna tehnologija donela bi veći binarni fajl, sporiju aplikaciju i manje kontrole za korisnika.

Sve su to tipični impulsi ka over-engineeringu. Remedija je ista: razmišljajte o krajnjem korisniku. Kako ovo konkretno poboljšava iskustvo? Ako odgovor ne postoji, prečica je lažna.
