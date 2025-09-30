# Sve na jednom mestu

„Bog klasa“ je klasični antipattern. Lako je upasti u zamku: kratkoročno je jednostavno, sve je u jednom fajlu, nema razmišljanja o vezama. Ali dugoročno dobijate monstruma sa hiljadama linija. U Instagram Android aplikaciji postojala je klasa za Stories koja je narasla na skoro 16.000 linija; godinama smo je „topili“. iOS tim je imao sličan slučaj.

Šta se dešava kada sav kod stavite u jedan fajl? Fajl postaje nečitljiv, build usporava (nema modularnog keširanja), tim gubi produktivnost. Kratkoročni „brži razvoj“ pretvara se u dugoročnu paralizu.

Bolje rešenje je modularizacija i razmišljanje kroz interfejse / delegate. Primer: u Taro Android aplikaciji, `CoachFragment` upravlja Taro GPT iskustvom. Ako direktno u njega ubacite svu logiku za prepoznavanje govora, klasa se naduvava. Umesto toga, kreiramo `SpeechToTextManager` koji brine o svim edge case-ovima (permisioni, pauze, prekidi). Fragment implementira jednostavan interfejs `onTextSpoken` i dobija tekst kada je spreman.

Ovakva podela čini kod čitljivijim, testabilnijim i lakšim za proširivanje. Jedan od najboljih saveta koje sam dobio u Meti bio je: „Razmišljaj kroz interfejse.“ Kada modul uredno uradi jednu stvar i jasno komunicira sa drugima, gradite sistem koji može da raste.
