# AGENTS.md

## Project overview

Static archive of "高级网页设计" (Advanced Web Design) class practice pages for 苟津源.
Each lesson is a standalone HTML exercise built with **native HTML/CSS/JS**. There is no
framework, bundler, package manager, test suite, or lint step.

## Running locally

- Serve the folder with the bundled UTF-8 server: `python _serve.py` → http://localhost:8000
  (it forces `charset=utf-8` on HTML responses).
- Opening HTML files directly also works, but relative links and `data.js` load more reliably via the server.

## Layout

- `index.html` — homepage / lesson directory (hand-maintained list of links, hero + lesson grid).
- `*.html` + matching `*.css` — individual lessons (e.g. `layout004.html` + `layout004.css`).
  Some lessons keep all CSS in a `<style>` block instead of a separate file.
- Lesson pages include: `html_basic`, `about`, `pic_above_text`, `layout004`,
  `layout_homework`, `css3004`, `dataType004`, `form`, `grid004`, `stack`, `svg004`,
  `JS_obj_fun`, `iconfont-1`–`iconfont-4`.
- `starter-level1-0819gjy.html`, `starter-level2-0819gjy.html` — scoreboard exercises
  (level 1 basic, level 2 full dashboard). Both have completed JS that reads `data.js`;
  the target render lives on Netlify (`target.html` is not in this repo) — match it 1:1.
- `data.js` — shared data source; defines `SUBJECTS` / `STUDENTS` and exposes them as
  `window.SUBJECTS` / `window.STUDENTS`.
- `data.sql` — MySQL schema for the resume/job demo.
- `cdn/` — locally vendored libraries (`fa-all.min.css`, `lucide.min.js`, `webfonts/`).
- `img/img/` — photos, sprites (`dot.gif`, `spirit.gif`) and Chinese-named demo images.
- `img/font/` — iconfont kit (`iconfont.css/js/woff2/ttf/json`, `demo_index.html`).
- `skills/frontend-design/SKILL.md` — design guidance to follow for aesthetic changes.
- `gjy_prompt.md` — append-only prompt log (see workflow rule below).
- `.screenshots/` — temporary visual-review artifacts.

## Conventions

- **Native only / no external CDN.** Do not add `<script src="https://...">` or remote font/CSS links.
  If a library is needed, download it into `cdn/` and reference it locally.
- **Naming prefix for new code:** CSS class names, IDs, and JS variable names should start with `wy_`
  (rule from `gjy_prompt.md`, record 1; applies to code written from that point on — older files predate it).
- **Link back home:** every new HTML page must link to `index.html` (typically a "返回首页 / 返回课堂目录" link).
- **Update the homepage:** when adding a lesson page, add its card/link to the lesson grid in `index.html`.
- **Language:** UI copy is Chinese; HTML uses `lang="zh-CN"`. Match the existing tone and visual style.
- **Data:** reuse `data.js` (`STUDENTS` / `SUBJECTS`) rather than duplicating score data inline.
- **Encoding:** all files are UTF-8 without BOM. Keep it that way; the bundled server forces
  `charset=utf-8` and Chinese copy will break otherwise.

## Prompt-log workflow (required)

Before acting on a user request, append an entry to `gjy_prompt.md`. Never overwrite prior entries.
Each entry records: timestamp, model used, and the prompt content, in the existing `## 记录 N` format.

## Design work

For new pages or redesigns, read `skills/frontend-design/SKILL.md` and follow its process
(design plan → critique against the brief → build → self-critique). Prefer distinctive,
subject-specific choices over templated defaults.

## Verification

- No automated tests or lint. Verify by serving the page and checking it in a browser.
- For the starter-level exercises, compare rendered output against the Netlify
  `target.html` page (not committed here) for 1:1 parity.
