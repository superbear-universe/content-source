# Superbear Universe — content-source

Single source of truth for all Superbear Universe **text**. Media lives on SynologyDrive (`Writing/sb-universe/`), not here.

## Layout

| Folder | Published? | What goes here |
|---|---|---|
| `stories/` | **Yes** | Finished stories, one `.md` per story, with Jekyll front matter |
| `characters/` | **Yes** | Public character sheets |
| `lore/` | **Yes** | Public lore pages |
| `assets/images/<slug>/` | **Yes** | Only the images a published story embeds (`001.png`, `002.png`, …). Older folders (`ch14-tbd`, `p-ch01`, `a-ch01`) keep their names because stories link to them |
| `workshop/` | No | Everything else: outlines, WIP drafts, unpublished sheets, archive, tools |

The website deploy (`superbear-universe/website` → `deploy.yml`) copies only the four published folders. Anything outside them never reaches the site.

## Rules

1. **Stable slugs.** A story's slug is its published filename (`stories/the-old-bear.md`). Its working folder is `workshop/stories/the-old-bear/`. Never rename a published file (it breaks URLs).
2. **One canonical file.** The published `.md` *is* the latest version. No `-v2`, `-final`, `-revised` copies — git history is the version history.
3. **Per story folder** in `workshop/stories/<slug>/`:
   - `outline.md` — the framework / plan
   - `draft.md` — only while the story is unpublished
   - other planning notes with plain names (`design-questions.md`, `motivation.md`)
   - `_archive/` — superseded drafts kept for reference (frozen; don't edit)
4. **Publishing** = move `workshop/stories/<slug>/draft.md` → `stories/<slug>.md`, add front matter, add images to `assets/images/<slug>/`, merge the PR.
5. **Branch per story**, named after its issue (`12-write-the-lodge`), PR into `main`. Merging to `main` deploys the site.

## Writing in Ellipsus

Ellipsus is a scratchpad, not a store.

1. Paste the body of `draft.md` (or the published story) into Ellipsus — **without** the front matter.
2. Write/edit there.
3. Export as Markdown and paste it back over the body in the repo file. Keep the repo's `---` front matter block (Ellipsus exports turn it into `**title**` lines).
4. Commit on the story branch. Don't save `-vN` exports to SynologyDrive.

## Index

See [`workshop/INDEX.md`](workshop/INDEX.md) for reading order and the status of every story.
