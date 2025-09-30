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

books_json = json.dumps(entries, ensure_ascii=False).replace("</", "<\\/")

template = """<!DOCTYPE html>
<html lang=\"sr\">
<head>
  <meta charset=\"utf-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
  <title>Zanatlije Koda – Biblioteka</title>
  <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">
  <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>
  <link href=\"https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap\" rel=\"stylesheet\">
  <style>
    :root { color-scheme: light dark; }
    * { box-sizing: border-box; }
    body { margin: 0; min-height: 100vh; font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; background: radial-gradient(circle at 18% 18%, #38bdf8 0%, #1d4ed8 40%, #0f172a 100%); display: flex; justify-content: center; align-items: flex-start; padding: clamp(2.2rem, 6vw, 3.8rem) clamp(1rem, 3vw, 2.4rem); }
    .page { width: min(1080px, 100%); background: rgba(255, 255, 255, 0.93); border-radius: 1.75rem; box-shadow: 0 32px 60px rgba(15, 23, 42, 0.32); backdrop-filter: blur(16px); padding: clamp(2.1rem, 3.5vw, 3.3rem); overflow: hidden; }
    header { position: relative; display: flex; flex-direction: column; gap: 0.85rem; margin-bottom: 2.2rem; }
    header::after { content: ''; position: absolute; inset: -70% auto auto -32%; width: 260px; height: 260px; background: radial-gradient(circle, rgba(59,130,246,0.22), transparent 65%); transform: rotate(20deg); opacity: 0.85; pointer-events: none; }
    header h1 { margin: 0; font-size: clamp(2.15rem, 4vw, 2.85rem); color: #0f172a; letter-spacing: -0.02em; }
    header p { margin: 0; color: #334155; max-width: 70ch; }
    .toolbar { display: flex; flex-wrap: wrap; gap: 1rem; align-items: center; justify-content: space-between; margin-bottom: 1.9rem; }
    .stat { display: inline-flex; align-items: center; gap: 0.6rem; padding: 0.6rem 1.25rem; border-radius: 999px; background: rgba(79, 70, 229, 0.14); color: #3730a3; font-weight: 600; letter-spacing: 0.03em; }
    .stat span { font-size: 1.05rem; }
    .search { position: relative; flex: 1 1 260px; max-width: 360px; }
    .search input { width: 100%; border-radius: 999px; padding: 0.7rem 1.2rem 0.7rem 2.7rem; border: 1px solid rgba(148, 163, 184, 0.35); background: rgba(255,255,255,0.9); font-size: 0.98rem; transition: box-shadow 0.2s ease, border-color 0.2s ease; color: #0f172a; }
    .search input:focus { outline: none; border-color: rgba(59, 130, 246, 0.55); box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.12); }
    .search svg { position: absolute; top: 50%; left: 1rem; width: 1rem; height: 1rem; transform: translateY(-50%); stroke: #64748b; }
    .library { display: grid; gap: 1.7rem; grid-template-columns: repeat(auto-fit, minmax(260px, 1fr)); }
    .card { border-radius: 1.15rem; background: linear-gradient(135deg, rgba(59,130,246,0.17), rgba(14,165,233,0.1)); border: 1px solid rgba(148,163,184,0.28); padding: 1.65rem; transition: transform 0.2s ease, box-shadow 0.2s ease, border-color 0.2s ease; position: relative; overflow: hidden; min-height: 188px; display: flex; }
    .card::before { content: ''; position: absolute; inset: 0; background: linear-gradient(120deg, rgba(59,130,246,0.24), transparent 60%); opacity: 0; transition: opacity 0.2s ease; }
    .card:hover { transform: translateY(-8px); box-shadow: 0 26px 48px rgba(15, 23, 42, 0.26); border-color: rgba(59,130,246,0.48); }
    .card:hover::before { opacity: 1; }
    .card__link { position: relative; z-index: 1; display: flex; flex-direction: column; color: inherit; text-decoration: none; width: 100%; }
    .card__title { margin: 0 0 0.8rem; font-size: 1.34rem; font-weight: 600; color: #0f172a; letter-spacing: -0.012em; display: flex; align-items: center; gap: 0.55rem; }
    .card__title::before { content: '📘'; font-size: 1.2rem; opacity: 0.85; }
    .card__desc { margin: 0; color: #475569; font-size: 0.99rem; line-height: 1.6; }
    .empty { margin: 2.4rem 0; color: #475569; font-style: italic; text-align: center; }
    .pager { margin-top: 2.8rem; display: flex; align-items: center; justify-content: center; gap: 1.6rem; }
    .pager[hidden] { display: none; }
    .pager__btn { appearance: none; border: none; border-radius: 999px; padding: 0.7rem 1.6rem; background: linear-gradient(135deg, #2563eb, #0ea5e9); color: white; font-weight: 600; cursor: pointer; box-shadow: 0 16px 38px rgba(37, 99, 235, 0.32); transition: transform 0.2s ease, box-shadow 0.2s ease, opacity 0.2s ease; }
    .pager__btn:disabled { opacity: 0.45; cursor: not-allowed; box-shadow: none; }
    .pager__btn:not(:disabled):hover { transform: translateY(-2px); box-shadow: 0 22px 48px rgba(37, 99, 235, 0.38); }
    .pager__counter { font-variant-numeric: tabular-nums; color: #1e293b; font-weight: 600; letter-spacing: 0.05em; }
    footer { margin-top: 3.4rem; font-size: 0.92rem; color: #6b7280; text-align: center; }
    @media (max-width: 720px) {
      body { padding: 2rem 1rem; }
      .page { border-radius: 1.3rem; padding: 2.1rem 1.4rem; box-shadow: 0 18px 34px rgba(15, 23, 42, 0.22); }
      header h1 { font-size: 2.15rem; }
      .toolbar { gap: 0.75rem; }
    }
    @media (prefers-color-scheme: dark) {
      body { background: radial-gradient(circle at 15% 20%, #1e3a8a 0%, #0f172a 55%, #020617 100%); color: #e2e8f0; }
      .page { background: rgba(15, 23, 42, 0.82); border: 1px solid rgba(148, 163, 184, 0.22); color: #e2e8f0; }
      header h1 { color: #f8fafc; }
      header p { color: #cbd5f5; }
      .stat { background: rgba(79, 70, 229, 0.24); color: #c7d2fe; }
      .search input { background: rgba(15, 23, 42, 0.65); color: #e2e8f0; border-color: rgba(148, 163, 184, 0.32); }
      .search svg { stroke: #94a3b8; }
      .card { background: linear-gradient(135deg, rgba(59,130,246,0.28), rgba(14,165,233,0.18)); border-color: rgba(59,130,246,0.38); }
      .card__title { color: #f8fafc; }
      .card__desc { color: #cbd5f5; }
      .pager__counter { color: #cbd5f5; }
      footer { color: #94a3b8; }
    }
  </style>
</head>
<body>
  <main class=\"page\">
    <header>
      <h1>Zanatlije Koda – Biblioteka</h1>
      <p>Birajte među internim priručnicima i čitajte ih direktno u pregledaču. Svaka knjiga sadrži praktične vodiče i studije slučaja na srpskom jeziku.</p>
    </header>
    <section class=\"toolbar\">
      <div class=\"stat\"><span id=\"book-count\"></span> dostupnih knjiga</div>
      <label class=\"search\">
        <svg viewBox=\"0 0 24 24\" focusable=\"false\" aria-hidden=\"true\"><circle cx=\"11\" cy=\"11\" r=\"7\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"1.6\"></circle><line x1=\"20\" y1=\"20\" x2=\"16.65\" y2=\"16.65\" stroke=\"currentColor\" stroke-width=\"1.6\" stroke-linecap=\"round\"></line></svg>
        <input id=\"search\" type=\"search\" placeholder=\"Pretraži knjige...\" autocomplete=\"off\" aria-label=\"Pretraži biblioteku\" />
      </label>
    </section>
    <section class=\"library\" id=\"book-list\"></section>
    <nav class=\"pager\" id=\"pager\" aria-label=\"Stranice biblioteke\">
      <button class=\"pager__btn\" type=\"button\" data-page=\"prev\">Prethodna</button>
      <span class=\"pager__counter\" id=\"page-counter\"></span>
      <button class=\"pager__btn\" type=\"button\" data-page=\"next\">Sledeća</button>
    </nav>
    <footer>
      <p>Powered by mdBook i GitHub Pages.</p>
    </footer>
  </main>
  <script type=\"application/json\" id=\"book-data\">BOOKS_JSON</script>
  <script>
    const BOOKS = JSON.parse(document.getElementById('book-data').textContent);
    const PAGE_SIZE = 6;
    let filteredBooks = Array.isArray(BOOKS) ? [...BOOKS] : [];
    let currentPage = 1;

    const listEl = document.getElementById('book-list');
    const pagerEl = document.getElementById('pager');
    const counterEl = document.getElementById('page-counter');
    const prevBtn = document.querySelector('[data-page="prev"]');
    const nextBtn = document.querySelector('[data-page="next"]');
    const searchInput = document.getElementById('search');
    const bookCountEl = document.getElementById('book-count');

    function escapeHtml(str) {
      return String(str).replace(/[&<>"']/g, (char) => ({
        '&': '&amp;',
        '<': '&lt;',
        '>': '&gt;',
        '"': '&quot;',
        "'": '&#39;'
      }[char]));
    }

    function makeCard(book) {
      const description = (book.description || '').trim() || 'Bez opisa.';
      const article = document.createElement('article');
      article.className = 'card';
      article.innerHTML = `\n        <a class="card__link" href="${escapeHtml(book.slug)}/">\n          <h2 class="card__title">${escapeHtml(book.title)}</h2>\n          <p class="card__desc">${escapeHtml(description)}</p>\n        </a>\n      `;
      return article;
    }

    function updatePager(totalPages) {
      counterEl.textContent = `${currentPage} / ${totalPages}`;
      prevBtn.disabled = currentPage === 1;
      nextBtn.disabled = currentPage === totalPages;
      pagerEl.hidden = totalPages <= 1;
    }

    function render() {
      bookCountEl.textContent = filteredBooks.length;

      if (!Array.isArray(filteredBooks) || filteredBooks.length === 0) {
        pagerEl.hidden = true;
        listEl.innerHTML = '<p class="empty">Još uvek nema objavljenih knjiga za zadate filtere.</p>';
        return;
      }

      const totalPages = Math.max(1, Math.ceil(filteredBooks.length / PAGE_SIZE));
      currentPage = Math.min(Math.max(currentPage, 1), totalPages);
      const start = (currentPage - 1) * PAGE_SIZE;
      const visible = filteredBooks.slice(start, start + PAGE_SIZE);

      listEl.innerHTML = '';
      for (const book of visible) {
        listEl.appendChild(makeCard(book));
      }

      updatePager(totalPages);
    }

    prevBtn.addEventListener('click', () => {
      currentPage -= 1;
      render();
    });

    nextBtn.addEventListener('click', () => {
      currentPage += 1;
      render();
    });

    document.addEventListener('keydown', (event) => {
      if (event.key === 'ArrowLeft') {
        currentPage -= 1;
        render();
      }
      if (event.key === 'ArrowRight') {
        currentPage += 1;
        render();
      }
    });

    searchInput.addEventListener('input', (event) => {
      const query = event.target.value.trim().toLowerCase();
      currentPage = 1;
      if (!query) {
        filteredBooks = [...BOOKS];
      } else {
        filteredBooks = BOOKS.filter((book) => {
          const title = (book.title || '').toLowerCase();
          const description = (book.description || '').toLowerCase();
          return title.includes(query) || description.includes(query);
        });
      }
      render();
    });

    render();
  </script>
</body>
</html>
"""

html = template.replace("BOOKS_JSON", books_json)
(publish_dir / "index.html").write_text(html, encoding="utf-8")
PY

echo "Sve knjige su izgrađene u $PUBLISH_DIR"
