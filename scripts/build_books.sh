#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BOOKS_DIR="$ROOT_DIR/books"
PUBLISH_DIR="$ROOT_DIR/public"

rm -rf "$PUBLISH_DIR"
mkdir -p "$PUBLISH_DIR"

if ! command -v mdbook >/dev/null 2>&1; then
  echo "mdbook is not installed. Install it with 'cargo install mdbook'." >&2
  exit 1
fi

shopt -s nullglob
book_paths=("$BOOKS_DIR"/*)
shopt -u nullglob

if [ ${#book_paths[@]} -eq 0 ]; then
  echo "No books found in $BOOKS_DIR" >&2
  exit 1
fi

for book_path in "${book_paths[@]}"; do
  [ -d "$book_path" ] || continue
  slug="$(basename "$book_path")"
  echo "Building $slug"
  mdbook build "$book_path"
  mkdir -p "$PUBLISH_DIR/$slug"
  cp -R "$book_path/book/." "$PUBLISH_DIR/$slug/"
done

export MDBOOK_ROOT="$ROOT_DIR"
python <<'PY'
import html
import os
from pathlib import Path
import tomllib

root = Path(os.environ["MDBOOK_ROOT"]).resolve()
books_dir = root / "books"
publish_dir = root / "public"
publish_dir.mkdir(exist_ok=True)

entries = []
for book_path in sorted(books_dir.iterdir()):
    if not book_path.is_dir():
        continue
    meta = {
        "slug": book_path.name,
        "title": book_path.name.replace('-', ' ').title(),
        "description": "",
    }
    book_toml = book_path / "book.toml"
    if book_toml.exists():
        data = tomllib.loads(book_toml.read_text(encoding="utf-8"))
        book_meta = data.get("book", {})
        meta["title"] = book_meta.get("title", meta["title"])
        meta["description"] = book_meta.get("description", "")
    entries.append(meta)

index_html = [
    "<!DOCTYPE html>",
    "<html lang=\"sr\">",
    "<head>",
    "  <meta charset=\"utf-8\">",
    "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">",
    "  <title>Zanatlije Koda – Biblioteka</title>",
    "  <style>",
    "    :root { color-scheme: light dark; }",
    "    body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; margin: 2rem auto; max-width: 60rem; line-height: 1.6; padding: 0 1.5rem; }",
    "    h1 { font-size: 2.2rem; margin-bottom: 1rem; }",
    "    .library { display: grid; gap: 1.5rem; }",
    "    .book { border: 1px solid rgba(148, 163, 184, 0.4); border-radius: 0.75rem; padding: 1.5rem; transition: transform 0.15s ease, box-shadow 0.15s ease; background: rgba(255,255,255,0.6); backdrop-filter: blur(8px); }",
    "    .book:hover { transform: translateY(-4px); box-shadow: 0 10px 25px rgba(15, 23, 42, 0.15); }",
    "    .book-title { font-size: 1.4rem; font-weight: 600; margin: 0 0 0.4rem; color: #111827; text-decoration: none; }",
    "    .book-desc { margin: 0; color: #4b5563; }",
    "    @media (prefers-color-scheme: dark) {",
    "      body { background: #0f172a; color: #e2e8f0; }",
    "      .book { background: rgba(15, 23, 42, 0.7); border-color: rgba(148, 163, 184, 0.2); }",
    "      .book-title { color: #f8fafc; }",
    "      .book-desc { color: #cbd5f5; }",
    "    }",
    "    footer { margin-top: 3rem; font-size: 0.9rem; color: #6b7280; }",
    "  </style>",
    "</head>",
    "<body>",
    "  <h1>Zanatlije Koda – Biblioteka</h1>",
    "  <p>Odaberite knjigu i čitajte je direktno u pregledaču.</p>",
    "  <div class=\"library\">",
]

for entry in entries:
    index_html.extend([
        "    <article class=\"book\">",
        f"      <a class=\"book-title\" href=\"{html.escape(entry['slug'])}/\">{html.escape(entry['title'])}</a>",
        f"      <p class=\"book-desc\">{html.escape(entry['description'])}</p>",
        "    </article>",
    ])

index_html.extend([
    "  </div>",
    "  <footer>",
    "    <p>Powered by mdBook i GitHub Pages.</p>",
    "  </footer>",
    "</body>",
    "</html>",
])

(publish_dir / "index.html").write_text("\n".join(index_html), encoding="utf-8")
PY

echo "Sve knjige su izgrađene u $PUBLISH_DIR"
