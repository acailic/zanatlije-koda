# Studija slučaja: ivice scenarija na signup formi

Signup forma deluje jednostavno, ali čim zagrebeš, iskače more edge case-ova. Hajde da ih prođemo kroz tri sloja.

**Ulazi (frontend):**
- Polja prazna.
- Lozinka slaba, preduga ili ne poklapa se sa „potvrdi lozinku“.
- Email već postoji ili nije validan (`gmay.lcom`).

**Mrežni sloj (backend/API):**
- DDoS ili skripte koje otvaraju hiljade naloga.
- Dupli klik na submit (dvostruko kreiranje naloga).
- Spori odgovor servera → treba spinner ili neki loading state.
- API pada ili vraća grešku; UI mora da prikaže poruku i dozvoli retry.
- „Email harvesting“: ako svima kojima je email u bazi kažeš „već postoji“, olakšavaš zloupotrebe.

**Okruženje korisnika:**
- Mobilni ekran, landscape mod, kratki viewport (submit dugme odlazi van ekrana).
- Tamni režim (zaboravljeni stilovi nestanu u pozadini).
- Egzotični ili zastareli browser, agresivni ad-blocker, nedostupna JavaScript funkcija.

To je već 20+ slučajeva, a još nismo pomenuli dodatna polja, opcije prijave preko Google-a, captcha itd. Zato edge case analizu treba raditi sistematično: razmišljaj o podacima, mreži, platformi i neobičnom ponašanju korisnika. Tek kad „smrtno ozbiljno“ prođeš kroz svaki sloj, signup forma je zaista spremna.
