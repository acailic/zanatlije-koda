# Zanatlije Koda – Učenje na srpskom

Ovaj repozitorijum sadrži edukativne materijale na srpskom jeziku organizovane kao mdBook priručnici. Svaka knjiga živi u `books/<naziv-knjige>`, sa sopstvenim `book.toml` konfiguracionim fajlom i `src/` direktorijumom koji sadrži `SUMMARY.md` i poglavlja.

## Struktura

```
books/
  podigni-kvalitet-svog-koda-kao-softverski-inzenjer/
    book.toml
    src/
      README.md
      SUMMARY.md
      *.md
```

## Dostupna knjiga

- `books/podigni-kvalitet-svog-koda-kao-softverski-inzenjer` – lekcije i studije slučaja о unapređenju kvaliteta koda.

## Gradnja i pregled

- Lokalno izgradite sve knjige i generišite `public/` direktorijum: `scripts/build_books.sh` (zahteva `mdbook`).
- Pokrenite `mdbook serve --open` unutar željene knjige za lokalni pregled tokom pisanja.

## GitHub Pages

Workflow `.github/workflows/mdbook.yml` automatski gradi sve knjige pri svakom push-u na `main` i objavljuje ih na GitHub Pages. Krajnji HTML se nalazi u `public/`, gde `index.html` prikazuje listu dostupnih knjiga za čitanje u pregledaču.

Za ručno pokretanje objave koristite GitHub interfejs (Workflow dispatch), a zatim otvorite stranicu repozitorijuma na GitHub Pages (npr. `https://<korisnik>.github.io/<repo>/`).
