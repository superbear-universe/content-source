# Superbear LLM context

This folder turns the existing Markdown in `content-source` into portable source
documents for an LLM knowledge base. The generated files preserve the original
wording and add clear source boundaries, so an answer can always be traced back
to a repository file.

The generated `dist` folder is intentionally ignored by Git. The original
stories, character sheets, and lore remain the source of truth.

## Build

From the `content-source` repository:

```powershell
pwsh ./llm-context/build-context.ps1
```

The build creates:

| File | Contents |
| --- | --- |
| `00-context-guide.md` | Knowledge-base rules and creator-maintained canon overrides |
| `10-lore.md` | Lore and planning documents |
| `20-characters.md` | Character sheets |
| `30-main-series.md` | Numbered Superbear chapters, in chapter order |
| `40-other-stories.md` | Standalone and spin-off stories, in publication order |
| `50-visual-reference-index.md` | Local assets and Markdown image references that need visual curation |
| `90-full-text-corpus.md` | A single-file alternative containing the guide and all text packs |
| `manifest.json` | Source paths, hashes, word counts, and inferred categories |

## Start a context window

For a knowledge-base product that accepts several files, upload
`00-context-guide.md` plus the four numbered text packs. Add
`50-visual-reference-index.md` only when visual provenance matters. For a plain
chat that accepts one large attachment, use `90-full-text-corpus.md` instead.
Do not upload both forms, because that duplicates the entire corpus.

At the start of a session, use a prompt like:

> Use the attached Superbear source documents as the knowledge base for this
> session. Follow the source-priority and uncertainty rules in
> `00-context-guide.md`. Cite repository source paths when answering canon
> questions. Do not treat outlines as completed events.

The current text corpus is large enough that retrieval or a long-context model
is preferable to pasting it into the chat message itself.

## Canon maintenance workflow

1. Write and edit stories, character sheets, and lore in their existing folders.
2. Record explicit rulings or known contradictions in `canon-overrides.md`.
3. Run the build script.
4. Review `manifest.json` for unexpected additions, classifications, or hashes.
5. Replace the uploaded knowledge-base files with the newly generated set.
6. Test a small set of questions whose answers span lore, characters, and story
   events. Require source-path citations in every answer.

Recommended metadata to add gradually to source frontmatter:

```yaml
context_status: canon        # canon, draft, planned, alternate, superseded
continuity: main             # main, standalone, alternate
timeline_order: 14           # in-world order; not publication date
characters: [Mike, Nick]
summary: "One factual paragraph, reviewed by the creator."
```

The build works without these fields today. Adding them removes ambiguity and
will eventually allow task-specific context packs to be selected mechanically.

## Important limitation: images

The Markdown contains hundreds of image references, and many older references
point to Tumblr rather than local files. Paths and URLs are not semantic visual
knowledge. The visual index therefore records coverage but does not pretend to
describe what an image contains.

For a complete multimodal knowledge base, add creator-reviewed captions or
scene notes to the story source, or maintain a sidecar visual-canon document
with one entry per important image. Include character identity, visible canon
details, story moment, and whether the image is authoritative or illustrative.
