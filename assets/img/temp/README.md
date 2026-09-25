# Temporary photos — REPLACE BEFORE LAUNCH

None of these are the client's photographs. Three are free stock images
(Unsplash / Pexels) standing in so the layout can be reviewed with real pictures
in it. **One — `about-generated-lab.jpg` — is AI-generated** (Higgsfield, model
`z_image`, 2026-09-25): it depicts nothing that actually happened and nobody who
actually exists, and it must not ship.

Every alt text begins **"Temporary"** — `Temporary placeholder photo —` for the
stock images, `Temporary AI-generated placeholder —` for the generated one — so
`grep -n 'alt="Temporary' index.html` finds all four.

Compressed to sit at or around ~300KB each. Two are from Unsplash and one from
Pexels; all are free-license.

| File | Used in | Source | Replace with |
|---|---|---|---|
| `hero-concrete-pour.jpg` | Hero, right-hand full-bleed panel | https://images.unsplash.com/photo-1541888946425-d81bb19240f5 | A wide Chico State CIM shot: students on an active pour, a finishing crew, or a completed concrete structure. Needs to read at ~1300×930 and crop well at `object-position: center 56%`. |
| `about-generated-lab.jpg` | §2 About CIM, right column | **AI-GENERATED** — Higgsfield, model `z_image`, 2026-09-25. Not stock, not a photograph. | CIM students in the concrete lab or classroom — cylinder testing, slump test, mix design work. **This one is not a photo of anything real and must be replaced with actual program photography before launch.** Portrait 1200×1600, so the two breakpoints crop on opposite axes: desktop crops horizontally (full height, Y inert), mobile crops vertically (full width). Anchored `object-position: center 25%`, and below 900px this one photo takes a square frame (`aspect-ratio: 1/1`) so the hard hat and the whole cylinder both fit. Re-check both when the photo changes. |
| `patron-mixer-pour.jpg` | §3 Patron Program, left column | https://www.pexels.com/photo/37121352/ (Pexels, free license) | A Patron company at work: batch plant, mixer fleet, precast yard. Crop anchor is `.split__frame--patron img { object-position: center 45% }`. |
| `why-jobsite-team.jpg` | §4 Why Support CIM, left column | https://images.unsplash.com/photo-1626885930974-4b69aa21bbf9 | A CIM graduate or intern on a jobsite with a Patron-company team. Two or three people, working, not posed. |

## Replacing one

1. Drop the new file in `assets/img/` (not `temp/`).
2. Update the `src` in `index.html`.
3. **Rewrite the alt text** — it must stop starting with "Temporary".
4. Keep `width`/`height` roughly right so the page does not shift while loading.
5. Aim for ≤300KB. `sips -Z 1500 -s format jpeg -s formatOptions 62 in.jpg --out out.jpg`.

Delete this folder once all four are replaced.

## Board headshots

There are no headshot files. The five board cards use a CSS circle with a
neutral silhouette icon, built inline — nothing to download and nothing to
replace until real photographs arrive. See the `BOARD:` comment in
`index.html`.
