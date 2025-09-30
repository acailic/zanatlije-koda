# Uvek ga popravi bar malo

Ostavi kodnu bazu boljom nego što si je zatekao. To je princip koji donosi ogroman povrat jer se mali dobici sabiraju. Ako svaki dan napraviš napredak od 1%, posle godinu dana si 37 puta bolji – ekstreman primer, ali ideja je jasna. Dok prolaziš kroz kod, registruj bolne tačke. Još bolje ako su tvoje, jer tako popravljaš sopstveni loš kod i najviše učiš.

Zadaci se često ponavljaju. Ako si backend inženjer i dodaješ novi endpoint, verovatno ćeš reciklirati raniji kod. Iskoristi priliku: pogledaj ga „svežim očima“. Šta je danas jasno da je moglo bolje? Koji obrazac sada znaš, a tada nisi? Možeš li da skineš višak linija bez gubitka čitljivosti? Da preimenuješ promenljive i razbiješ monolitnu klasu? Jesi li propustio edge case koji si kasnije naučio kroz review? Može li biti brže?

Primer: ukloni višak ID-jeva, preimenuj promenljive u smislenije, prebaci legacy API na moderni, podeli „God objekat“ u manje module. Jednim prolaskom dobiješ uredniji, brži i održiviji modul.

Ovo je strategija koju koristim celom karijerom. Svaki put kada bih radio na funkciji i kroz nju prolazio kroz legacy kod, usput bih sređivao nered – bilo u istom PR-u, bilo u malom zasebnom. Inženjere koje sam mentorisao, naročito u Meti, učio sam istom principu i timovi su to obožavali. Veliki refaktori u ogromnim kodnim bazama često su nemogući; zato se oslanjamo na sitne, stalne popravke. Ako se ponašaš kao izviđač koji uvek ostavi šumu čistijom nego što ju je našao, ljudi će to primetiti – i to je put ka reputaciji, dobrim ocenama i napredovanju.
