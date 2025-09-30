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
import json
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

data_json = json.dumps(entries, ensure_ascii=False).replace("</", "<\\/")

css_block = """
    :root { color-scheme: light dark; }
    * { box-sizing: border-box; }
    body { margin: 0; min-height: 100vh; font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; background: radial-gradient(circle at 20% 20%, #38bdf8 0%, #1d4ed8 40%, #111827 100%); display: flex; justify-content: center; align-items: flex-start; padding: clamp(2.5rem, 6vw, 3.5rem) clamp(1rem, 3vw, 2rem); }
    .page { width: min(1100px, 100%); background: rgba(255, 255, 255, 0.92); border-radius: 1.6rem; box-shadow: 0 28px 48px rgba(15, 23, 42, 0.28); backdrop-filter: blur(14px); padding: clamp(2rem, 3vw, 3.25rem); }
    header { display: flex; flex-direction: column; gap: 0.75rem; margin-bottom: 1.6rem; }
    header h1 { margin: 0; font-size: clamp(2.1rem, 4vw, 2.75rem); color: #0f172a; letter-spacing: -0.02em; }
    header p { margin: 0; color: #334155; max-width: 68ch; }
    .library { display: grid; gap: 1.6rem; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); }
    .card { border-radius: 1.1rem; background: linear-gradient(135deg, rgba(59,130,246,0.14), rgba(14,165,233,0.1)); border: 1px solid rgba(148, 163, 184, 0.25); padding: 1.6rem; transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease; position: relative; overflow: hidden; min-height: 168px; }
    .card::after { content: ''; position: absolute; inset: 0; background: linear-gradient(160deg, rgba(59,130,246,0.14), transparent 55%); opacity: 0; transition: opacity 0.2s ease; }
    .card:hover { transform: translateY(-6px); box-shadow: 0 22px 44px rgba(15, 23, 42, 0.22); border-color: rgba(59, 130, 246, 0.5); }
    .card:hover::after { opacity: 1; }
    .card__link { display: block; color: inherit; text-decoration: none; position: relative; z-index: 1; height: 100%; }
    .card__title { margin: 0 0 0.75rem; font-size: 1.32rem; font-weight: 600; color: #0f172a; letter-spacing: -0.01em; }
    .card__desc { margin: 0; color: #475569; font-size: 0.97rem; line-height: 1.58; }
    .empty { margin: 2rem 0; color: #475569; font-style: italic; text-align: center; }
    .pager { margin-top: 2.6rem; display: flex; align-items: center; justify-content: center; gap: 1.6rem; }
    .pager[hidden] { display: none; }
    .pager__btn { appearance: none; border: none; border-radius: 999px; padding: 0.65rem 1.45rem; background: linear-gradient(135deg, #2563eb, #0ea5e9); color: white; font-weight: 600; cursor: pointer; box-shadow: 0 14px 36px rgba(37, 99, 235, 0.28); transition: transform 0.2s ease, box-shadow 0.2s ease, opacity 0.2s ease; }
    .pager__btn:disabled { opacity: 0.45; cursor: not-allowed; box-shadow: none; }
    .pager__btn:not(:disabled):hover { transform: translateY(-2px); box-shadow: 0 20px 44px rgba(37, 99, 235, 0.38); }
    .pager__counter { font-variant-numeric: tabular-nums; color: #1e293b; font-weight: 500; letter-spacing: 0.04em; }
    footer { margin-top: 3.2rem; font-size: 0.9rem; color: #6b7280; text-align: center; }
    @media (max-width: 720px) {
      body { padding: 2.25rem 1rem; }
      .page { border-radius: 1.25rem; padding: 2.1rem 1.35rem; box-shadow: 0 20px 32px rgba(15, 23, 42, 0.2); }
      header h1 { font-size: 2.1rem; }
      .card { padding: 1.35rem; }
    }
    @media (prefers-color-scheme: dark) {
      body { background: radial-gradient(circle at 15% 20%, #1e3a8a 0%, #0f172a 55%, #020617 100%); color: #e2e8f0; }
      .page { background: rgba(15, 23, 42, 0.8); border: 1px solid rgba(148, 163, 184, 0.22); color: #e2e8f0; }
      header h1 { color: #f8fafc; }
      header p { color: #cbd5f5; }
      .card { background: linear-gradient(135deg, rgba(59,130,246,0.24), rgba(14,165,233,0.14)); border-color: rgba(59,130,246,0.4); }
      .card__title { color: #f8fafc; }
      .card__desc { color: #cbd5f5; }
      .pager__counter { color: #cbd5f5; }
    }
""".strip()

js_block = """
    const BOOKS = JSON.parse(document.getElementById('book-data').textContent);
    const PAGE_SIZE = 6;
    let currentPage = 1;
    const listEl = document.getElementById('book-list');
    const pagerEl = document.getElementById('pager');
    const counterEl = document.getElementById('page-counter');
    const prevBtn = document.querySelector('[data-page="prev"]');
    const nextBtn = document.querySelector('[data-page="next"]');

    function makeCard(book) {
      const description = (book.description || '').trim() || 'Bez opisa.';
      const article = document.createElement('article');
      article.className = 'card';
      article.innerHTML = `
        <a class="card__link" href="${book.slug}/">
          <h2 class="card__title">${book.title}</h2>
          <p class="card__desc">${description}</p>
        </a>
      `;
      return article;
    }

    function render() {
      if (!Array.isArray(BOOKS) || BOOKS.length === 0) {
        pagerEl.hidden = true;
        listEl.innerHTML = '<p class="empty">Još uvek nema objavljenih knjiga.</p>';
        return;
      }
      const totalPages = Math.max(1, Math.ceil(BOOKS.length / PAGE_SIZE));
      currentPage = Math.min(Math.max(currentPage, 1), totalPages);
      const start = (currentPage - 1) * PAGE_SIZE;
      const visible = BOOKS.slice(start, start + PAGE_SIZE);
      listEl.innerHTML = '';
      for (const book of visible) {
        listEl.appendChild(makeCard(book));
      }
      counterEl.textContent = `${currentPage} / ${totalPages}`;
      prevBtn.disabled = currentPage === 1;
      nextBtn.disabled = currentPage === totalPages;
      pagerEl.hidden = totalPages === 1;
    }

    prevBtn.addEventListener('click', () => { currentPage -= 1; render(); });
    nextBtn.addEventListener('click', () => { currentPage += 1; render(); });
    document.addEventListener('keydown', (event) => {
      if (event.key === 'ArrowLeft') { currentPage -= 1; render(); }
      if (event.key === 'ArrowRight') { currentPage += 1; render(); }
    });

    render();
""".strip()

index_html = [
    "<!DOCTYPE html>",
    "<html lang=\"sr\">",
    "<head>",
    "  <meta charset=\"utf-8\">",
    "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">",
    "  <title>Zanatlije Koda – Biblioteka</title>",
    "  <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">",
    "  <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>",
    "  <link href=\"https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap\" rel=\"stylesheet\">",
    "  <style>",
    css_block,
    "  </style>",
    "</head>",
    "<body>",
    "  <main class=\"page\">",
    "    <header>",
    "      <h1>Zanatlije Koda – Biblioteka</h1>",
    "      <p>Birajte među internim priručnicima i čitajte ih direktno u pregledaču. Svaka knjiga sadrži praktične vodiče i studije slučaja na srpskom jeziku.</p>",
    "    </header>",
    "    <section class=\"library\" id=\"book-list\"></section>",
    "    <nav class=\"pager\" id=\"pager\" aria-label=\"Stranice biblioteke\">",
    "      <button class=\"pager__btn\" type=\"button\" data-page=\"prev\">Prethodna</button>",
    "      <span class=\"pager__counter\" id=\"page-counter\"></span>",
    "      <button class=\"pager__btn\" type=\"button\" data-page=\"next\">Sledeća</button>",
    "    </nav>",
    "    <footer>",
    "      <p>Powered by mdBook i GitHub Pages.</p>",
    "    </footer>",
    "  </main>",
    "  <script type=\"application/json\" id=\"book-data\">" + data_json + "</script>",
    "  <script>",
    js_block,
    "  </script>",
    "</body>",
    "</html>",
]

(publish_dir / "index.html").write_text("\n".join(index_html), encoding="utf-8")
PY

echo "Sve knjige su izgrađene u $PUBLISH_DIR"
