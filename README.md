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
All four images are temporary placeholders. Three are free stock (Unsplash /
Pexels). **The About image, `about-generated-classroom.jpg`, is AI-generated** —
Higgsfield, model `z_image`, 2026-09-25 — not stock and not a photograph of
anything real. It stands in only so the slot can be reviewed, and **must be
replaced with actual program photography before launch**; a generated
classroom of students is not something a university can publish as its own.

Every alt text starts with **"Temporary"** (`Temporary placeholder photo —` for
the stock images, `Temporary AI-generated placeholder —` for the generated one),
so `grep -n 'alt="Temporary' index.html` finds all four and nothing ships by
accident. Sources, crop anchors and replacement notes are in
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

## Motion

Three moments, plus the existing subtle scroll reveal. Every one runs **once**,
uses transform/opacity only, and ends on the static layout. All start-states are
scoped to `html.js` (the inline script sets that class), so with JavaScript off
the page renders finished.

1. **Hero entrance, on load.** Eyebrow -> H1 -> lede -> paragraph -> buttons fade
   and rise 14px in sequence (600ms each, 90ms stagger, ease-out). The red divider
   between the copy panel and the photo draws in as the headline lands (700ms).
   The hero photo makes one slow push-in, scale 1 -> 1.05 over 14s, then holds.
   The page settles in about a second.
2. **Stat strip count-up**, once, when the strip enters the viewport. `100%`,
   `$80K` and `50+` count from zero over 1.2s with an ease-out, so they decelerate
   into the final value. **`Since 2007` deliberately does not count** — walking a
   founding year up from an earlier number puts years on screen that are not true.
   It fades up with the group instead.
3. **The `$1,000,000` moment**, once, when the scholarship panel enters view. The
   gold rule under the number draws left to right (900ms) while the figure counts
   from `$0` to `$1,000,000` over 1.4s. **It ends on the number**, because the
   number is what is counting — there is no word to resolve into. The deck's H3
   label, *A $1 Million Investment in the Next Generation*, sits under the rule.

**How the counters stay honest.** The finished strings live in the DOM. Each
counter reads the element's own text, walks a number up to it, then writes the
original string back — so no-JS, reduced motion and the final animated frame are
byte-identical. No figure is generated from a number held in the script.

**No layout shift.** `.stat__n` and `.schol__n` use `font-variant-numeric:
tabular-nums`, so the digits hold a steady width while they spin. `.schol__n` is
`white-space: nowrap`, so its type size is capped to what the left column can
hold: `$1,000,000` is a good deal wider than `$1 million` was, so the clamp is
`clamp(44px, 7.3vw, 76px)` against a `1.14fr` column. Measured at 360, 390, 430,
600, 768, 820, 900, 920, 960, 1024, 1100, 1280 and 1440 — one line everywhere,
with at least 44px of slack at the tightest breakpoint. Raising the cap or
narrowing the column without re-measuring will clip a digit.

The gold rule is the `::before` of the H3 label, whose `max-width: 32ch` lands it
at the width of the counted figure at desktop, so it reads as the number's
underline. Re-check it if the figure or the type scale changes.

**Reduced motion.** Under `prefers-reduced-motion: reduce` every moment resolves
straight to its end state and no JS animation runs: hero copy fully visible with
the divider drawn, hero photo unscaled at its intended crop, stat figures as
written, and the scholarship panel with its gold rule drawn and `million` at full
opacity.

**Nothing else animates.** In particular the concrete texture never moves. Do not
add motion elsewhere; the restraint is the point.

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
- [ ] Replace all four images and rewrite every alt text (grep
      `alt="Temporary`). Delete `assets/img/temp/`.
- [ ] **Replace the AI-generated About image** (`about-generated-classroom.jpg`)
      with real program photography. This one is not negotiable — it is a
      synthetic instructor teaching a synthetic class.
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
