# Chico State — Concrete Industry Management

Single-page static landing page for the CIM program's Patron and donor pitch.
No build step. Open `index.html` or serve the folder; that is the whole stack.

Client: Blue Flamingo · Job code **ECC-2602** · Fee $200.

## Layout
- `index.html` — the entire site (inline `<style>` + one inline `<script>`).
- `assets/img/temp/` — four temporary Unsplash photos + their own README. All
  four are placeholders. See "Swap point 2" below.
- `_verify/` — Playwright screenshots (git-ignored).
- `deploy.sh` — Vercel deploy for the client review link.
- `vercel.json` — `cleanUrls`, asset caching, and the `X-Robots-Tag` noindex
  header. The header comes off at launch.

## The page

**All copy on this page is the client's approved deck, verbatim.** See
"Copy" below for the one exception.

Seven sections, in order:

1. **Hero** — concrete copy panel + full-bleed photo, split at ≥980px. Four-tile
   stat strip on dark charcoal concrete underneath.
2. **About CIM** (`#about`) — H2, lede, two paragraphs, then the
   *From Classroom to Boardroom* H3 and its paragraph. Photo split; the photo
   stretches to the text column height. CTA: *Discover Chico State CIM* (outline).
3. **Patron Program** (`#patrons`) — H2, lede, paragraph, then the
   *More Than Financial Support* H3 and its paragraph, beside the photo. Below:
   the "Across CIM, Patron support can include:" line and seven icon + label
   tiles (inline SVG, no body text — the deck supplies none), then the
   both-sides paragraph in a highlighted note block.
   CTA: *Become a CIM Patron* (outline, large, centered).
4. **Why Support CIM** (`#why`) — H2 and lede, two-column prose, a full-width
   21:9 photo band, then the industry-partners paragraph in a highlighted note
   block. CTA: *Support Chico State CIM* (primary).
5. **Scholarship Feature** (`#scholarship`) — dark charcoal-concrete panel. H2
   across the top, then the giant `$1 million` in Golden Hour Yellow beside the
   three paragraphs, with the *A $1 Million Investment in the Next Generation*
   H3 as the stat's label. Serif tagline, then two CTAs.
6. **Board** (`#board`) — H2, H3, lede, paragraph, five placeholder profile
   cards. No CTA.
7. **Final CTA** (`#support`) — Chico Red panel, centered, closing serif line,
   two CTAs.

Sticky nav with a mobile drawer, then footer.

The giant `$1 million` is `white-space: nowrap`, so its maximum type size is
capped to what the left column can hold. Raising it without widening the column
pushes the number into the gutter.

## Brand

Chico State's published palette, used to the university's own rules.

| Token | Hex | Role |
|---|---|---|
| Chico Red | `#9D2235` | **Dominant.** Primary buttons, rules, eyebrows, the closing panel. |
| Cornerstone Gray | `#75787B` | Neutral. Graphic use and large text only — see contrast note. |
| Black / White | `#1c1d1f` / `#ffffff` | Primary neutrals. |
| Dusk Blue | `#043546` | Secondary — accent only. |
| Golden Hour Yellow | `#EBA70E` | Secondary — accent only. Stat numbers and the giant `$1 million`, both on dark panels. |
| Canyon Stone | `#D0D1C9` | Secondary — accent only. Body text on dark panels. |

Terracotta and Orchard Green are not used anywhere, per the university rule.

**Type.** Montserrat 400/500/600/700/800 (Google Fonts) stands in for the
brand's Gotham and carries everything. Georgia (system serif) stands in for
Masqualero and is used only for section ledes and the pull-quote. Headlines are
Montserrat 800, tight tracking, sentence case. Eyebrow labels are the only
uppercase on the page.

**Concrete texture.** Pure CSS/SVG, no image files. Two `feTurbulence` tiles —
one large-scale cloud at `baseFrequency 0.011` for the poured-slab mottling,
one fine tile at `0.75` for surface tooth — both built on a neutral `#808080`
base and blended with `overlay` over a concrete-gray gradient. That neutral base
is why it reads as poured concrete rather than TV static; keep the cloud layer's
frequency low. Faint form-tie and panel-seam hairlines sit on top
(`.seams` / `.ties`). **Never add crack or fracture patterns** — the client asked
for smooth poured concrete, no cracks.

### Contrast — measured, WCAG 2.1 AA

The full table is at the top of the stylesheet. The short version:

| Pair | Ratio | Verdict |
|---|---|---|
| Chico Red `#9D2235` on white | 7.74:1 | text OK |
| white on Chico Red | 7.74:1 | text OK |
| Chico Red on light concrete `#e6e6e2` | 6.07:1 | text OK |
| Chico Red on deep concrete `#bcbcb7` | ~4.1:1 | **graphic only** |
| Chico Red on charcoal `#2b2c2c` | 1.81:1 | **never** — red never carries text or a label on the dark panels |
| Cornerstone Gray `#75787B` on white | 4.44:1 | **fails** small text |
| `--gray-700 #5c5f62` on white | 6.43:1 | text OK — this is why body copy uses `--gray-700`, not the published Cornerstone |
| `--gray-700` on deep concrete `#d6d6d2` | 4.41:1 | **fails** — deep concrete carries `--ink` only (hero copy does) |
| `--ink #1c1d1f` on white / deep concrete | 16.87 / 8.94 | OK |
| Golden Hour `#EBA70E` on white | 2.09:1 | **never text on white** |
| Golden Hour on charcoal `#232424` | 7.46:1 | OK — dark panels only |
| white / Canyon Stone on charcoal | 14.01 / 9.10 | OK |

One deliberate exception is documented in the CSS: the red primary button on the
charcoal scholarship panel is 1.81:1 against its background, which is fine for
the label (white on red, 7.74:1) but not enough of a boundary under WCAG 1.4.11.
It carries a 1px white hairline for that reason. Do not remove it.

## Buttons

Site-wide, identical metrics in every section, so hierarchy reads the same
everywhere. 48px tall, 6px radius, 600 weight, 44px minimum tap target.

- **Primary** — filled Chico Red, white label. Every *"Support…"* CTA.
- **Secondary** — 2px outline. Chico Red on light, white on dark. Every
  *"Become a CIM Patron"* and *"Discover Chico State CIM"* CTA.
- On the red closing panel the primary inverts to white-filled with red text.

The Patron section's *Become a CIM Patron* is the section's main ask, so it is
`.btn--lg` and centered — but it keeps the secondary style. That rule is
site-wide; do not promote it to a filled red button.

## What is still open

### 1. Logo
The Chico State + CIM lockup was not delivered. The nav and footer carry a text
lockup instead: "Chico State" (Montserrat 800) + a thin Chico Red rule +
"Concrete Industry Management" on two tracked lines. Both are marked in the
source with:

```
<!-- LOGO SLOT: replace this text lockup with the supplied Chico State + CIM lockup (SVG preferred). Keep height ~44px in nav. -->
```

Replace the contents of `<a class="brand">` in **both** places. SVG preferred.
Keep it to about 44px tall in the nav; the footer copy is the same markup on a
dark background, so a version that works on both light and dark, or two files,
is what to ask for.

### 2. Photos
All four photographs are temporary Unsplash placeholders. Every one has alt
text starting **"Temporary placeholder photo —"** so nothing ships by accident:
grep for that string. Full details, sources and replacement notes are in
`assets/img/temp/README.md`.

### 3. Copy — closed, with one exception

The approved copy deck is in place, **verbatim**: em dashes, capitalization,
punctuation and curly apostrophes as supplied. Do not paraphrase or "tidy" it.

Where the drafted structure had elements the deck does not cover, those elements
were removed rather than filled with invented text. Gone: the material/business
callouts in About, the For students / For industry cards in Why Support, the
pull-quote and its attribution, and the seven Patron card descriptions (the
tiles are now icon + label only).

The **eyebrow labels** (`ABOUT CIM`, `THE PATRON PROGRAM`, `WHY SUPPORT CIM`,
`SCHOLARSHIP FEATURE`, `LEADERSHIP`, `SUPPORT THE PROGRAM`) are design elements,
not deck copy. None duplicates its H2.

**The one exception is the hero stat strip** — *Since 2007 / 100% / $80K / 50+*
and their labels. These are not in the deck; they came from csuchico.edu and the
original brief, and are flagged separately with the client. Either get them
confirmed or delete the `.stats` block; nothing else depends on it.

## CTA_LINKS

Every call to action is an `<a href="#">` carrying a `data-cta` key. Five keys:
`support`, `patron`, `discover`, `scholarship`, `students`. At the top of the
inline script:

```js
const CTA_LINKS = { support: "", patron: "", discover: "", scholarship: "", students: "" };
```

Paste the real destination URLs in. On load the script assigns them; anything
starting `http://` or `https://` also gets `target="_blank" rel="noopener"`.

Left empty, a key falls back to an on-page anchor so no button is ever dead:
`support`, `scholarship` and `students` point at `#support`; `patron` points at
`#patrons`; `discover` points at `#about`. That is the current state — **no
external URLs are set yet.**

## Board placeholder rule

The five board cards carry literal bracketed placeholders —
`[First Name Last Name]`, `[Board Title]`, `[Company / Organization]` — and a
neutral silhouette in place of a headshot. The source says so:

```
<!-- BOARD: placeholders per the brief. Do not launch until real names, titles, orgs and headshots are supplied. -->
```

Do not launch with brackets on the page.

## Accessibility

Mobile-first. Body 16px on mobile, 18px from 820px. Fluid type throughout via
`clamp()`, max width 1160px. One `<h1>`, no skipped heading levels, semantic
landmarks, a skip link, 3px visible focus rings, `aria-expanded` and
`aria-controls` on the drawer toggle, 44px minimum tap targets, and full
`prefers-reduced-motion` handling (the scroll reveal turns itself off and the
content renders immediately).

The scroll reveal is opt-in: the script adds `.js` to `<html>` and the hidden
state is scoped to `html.js .rv`. With JavaScript off, everything is visible.

Verified at 390 / 768 / 1280 with Playwright: no console errors, and no
horizontal scroll at 360px.

## Go-live checklist

- [ ] Replace the logo lockup in the nav **and** the footer.
- [ ] Replace all four photos and rewrite every alt text (grep
      `Temporary placeholder photo`). Delete `assets/img/temp/`.
- [ ] Replace the five board cards with real names, titles, orgs and headshots.
- [ ] Confirm or remove the four hero stat-strip figures — the only copy on the
      page that is not from the approved deck.
- [ ] Fill in `CTA_LINKS` with the five real destination URLs.
- [ ] **Remove the noindex in both places:**
      `<meta name="robots" content="noindex,nofollow" />` in `index.html`, and
      the `X-Robots-Tag` header block in `vercel.json`.
- [ ] Add the canonical tag with the live domain:
      `<link rel="canonical" href="https://<domain>/" />`, and set `og:url` to
      match.
- [ ] Add an `og:image` (1200×630) once real photography exists.
- [ ] Re-run the Playwright screenshots and re-check contrast if any color
      moved.

## Deploys

Production is git-connected: a push to `main` on Blue-Flamingo-Group/Chico-State-CIM deploys to https://chico-cim.vercel.app (Vercel project `chico-cim`, scope syronius-projects). The repo is public because Vercel's Hobby plan cannot connect a private org repo. `deploy.sh` is the manual fallback.
