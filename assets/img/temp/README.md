# Temporary photos — REPLACE BEFORE LAUNCH

None of these are the client's photographs. They are free Unsplash images
standing in so the layout can be reviewed with real pictures in it. Every one
has alt text beginning **"Temporary placeholder photo —"**, so a quick search
of `index.html` for that string finds all four.

Downloaded at `?w=1500&q=62` and re-compressed with `sips` to sit at or under
~300KB each.

| File | Used in | Unsplash source | Replace with |
|---|---|---|---|
| `hero-concrete-pour.jpg` | Hero, right-hand full-bleed panel | https://images.unsplash.com/photo-1541888946425-d81bb19240f5 | A wide Chico State CIM shot: students on an active pour, a finishing crew, or a completed concrete structure. Needs to read at ~1300×930 and crop well at `object-position: center 56%`. |
| `about-student-plans.jpg` | §2 About CIM, right column | https://images.unsplash.com/photo-1581092160562-40aa08e78837 | CIM students in the concrete lab or classroom — cylinder testing, slump test, mix design work. Portrait-friendly crop (fills a tall column at desktop). |
| `patron-industrial-site.jpg` | §3 Patron Program, left column | https://images.unsplash.com/photo-1531834685032-c34bf0d84c77 | A Patron company at work: batch plant, mixer fleet, precast yard. **Compromise noted:** no suitable batch-plant or mixer-truck photo was available under the free license, so this is an industrial reinforced-concrete site instead. This slot most wants a real client photo. |
| `why-jobsite-team.jpg` | §4 Why Support CIM, left column | https://images.unsplash.com/photo-1626885930974-4b69aa21bbf9 | A CIM graduate or intern on a jobsite with a Patron-company team. Two or three people, working, not posed. |

## Replacing one

1. Drop the new file in `assets/img/` (not `temp/`).
2. Update the `src` in `index.html`.
3. **Rewrite the alt text** — it must stop saying "Temporary placeholder photo".
4. Keep `width`/`height` roughly right so the page does not shift while loading.
5. Aim for ≤300KB. `sips -Z 1500 -s format jpeg -s formatOptions 62 in.jpg --out out.jpg`.

Delete this folder once all four are replaced.

## Board headshots

There are no headshot files. The five board cards use a CSS circle with a
neutral silhouette icon, built inline — nothing to download and nothing to
replace until real photographs arrive. See the `BOARD:` comment in
`index.html`.
