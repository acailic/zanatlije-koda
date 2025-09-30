# Jedan diff, jedna teza

Ulazimo u PR taktike koje možeš primeniti već sutra. Ako usvojiš navike iz ovog poglavlja, kao junior si već na pola puta do mid-levela – a ni seniori često ne rade sve kako treba.

Osnovno pravilo: `one diff, one thesis`. Svaki PR treba da radi jednu jasnu stvar. To znači mali, fokusirani diff, idealno do ~250 značajnih linija. Kada odeš na 500 ili 1000 linija, gotovo sigurno si spakovao previše.

Zašto je to bitno?
- **Brže pišeš**: mali zadaci se završavaju za dan, ne za dve nedelje.
- **Lakše se review-uju**: manje koda → jednostavniji pregled → brže odobrenje.
- **Kvalitet raste**: kada je obim manji, lakše je pokriti granične slučajeve, definisati kontekst i pripremiti dobar test plan.

Kako znaš da je PR fokusiran? Postavi sebi pitanja: mogu li komponentu izdvojiti u poseban PR? Da li se mixuju UI, backend, refaktor i cleanup? Ako da, podeli. Granica je elastična, ali cilj je da svaka jedinica rada ima jasnu „tezu“ – šta tačno isporučuje.

Ova navika olakšava život svima: tebi, review-erima, QA-u i budućim čitaocima koda. I nema boljeg načina da pokažeš profesionalizam nego da sa svakim PR-om isporučiš jednu čistu, zaokruženu misao.
