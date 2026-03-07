# MkDocs Migration Proposal — GenAI & Agentic Architecture Framework

*Created: 2026-03-07*

---

## Inventory Summary

| Category | Items | Disposition |
|---|---|---|
| Framework docs | 7 markdown files (`framework/`) | Primary site content |
| Reference one-pagers | 3 markdown files (`references/`) | Quick reference section |
| Context docs | `helix-vision-philosophy.md` | Included (context section) |
| Diagrams | 1 PNG, 12 `.drawio` files | Export to SVG; host as assets |
| Examples (drawio) | 10 `.drawio` files | Diagrams gallery page |
| Archive | 5+ old markdown versions | **Excluded from site** |
| Binary files | `.xlsx`, `.pptx` | Linked as downloadable assets |
| Planning | `model-planning/to-do.md` | **Excluded from site** |

---

## Proposed Project Structure

```
agentic-architecture/
├── docs/
│   ├── index.md                          # Landing page (synthesized from 01-overview.md)
│   ├── framework/
│   │   ├── index.md                      # ← 01-overview.md (Four-Layer Model + Practitioner's Path)
│   │   ├── use-case-archetypes.md        # ← 02-use-case-archetypes.md
│   │   ├── capability-features.md        # ← 03-capability-features.md
│   │   ├── technical-components.md       # ← 04-technical-components.md
│   │   ├── component-selection-guide.md  # ← 05-component-selection-guide.md
│   │   ├── implementation-tiers.md       # ← 06-implementation-tiers.md
│   │   └── platform-selection.md         # ← 07-platform-selection.md
│   ├── reference/
│   │   ├── archetypes.md                 # ← references/archetypes-one-pager.md
│   │   ├── capability-features.md        # ← references/capability-features-one-pager.md
│   │   └── technical-components.md       # ← references/technical-components-one-pager.md
│   ├── diagrams/
│   │   └── index.md                      # Diagram gallery page with embedded SVGs
│   └── assets/
│       ├── diagrams/                     # Exported SVG/PNG from all .drawio files
│       └── downloads/                    # formatted-charts.xlsx, framework .pptx
├── pyproject.toml
├── mkdocs.yml
├── .python-version                       # "3.14"
└── uv.lock
```

---

## Technology Stack

```toml
# pyproject.toml
[project]
name = "agentic-architecture-docs"
version = "0.1.0"
description = "GenAI & Agentic Architecture Framework documentation site"
requires-python = ">=3.14"

dependencies = [
    "mkdocs>=1.6",
    "mkdocs-material>=9.5",
    "pymdown-extensions>=10.7",
    "mkdocs-awesome-pages-plugin>=2.9",
    "mkdocs-git-revision-date-localized-plugin>=1.3",
    "mkdocs-minify-plugin>=0.8",
    "mkdocs-glightbox>=0.4",        # image lightbox / zoom
]

[tool.uv]
dev-dependencies = [
    "mkdocs-material[imaging]>=9.5", # social cards + image processing
]
```

```
# .python-version
3.14
```

**Bootstrap commands:**

```bash
uv init --no-workspace
uv python pin 3.14
uv sync
uv run mkdocs serve     # local dev
uv run mkdocs build     # production build → site/
```

---

## MkDocs Configuration

```yaml
# mkdocs.yml
site_name: GenAI & Agentic Architecture Framework
site_description: A structured approach for identifying, designing, and implementing GenAI and Agentic AI capabilities
docs_dir: docs
site_dir: site

theme:
  name: material
  palette:
    - scheme: default
      primary: slate
      accent: blue
      toggle:
        icon: material/brightness-7
        name: Switch to dark mode
    - scheme: slate
      primary: slate
      accent: blue
      toggle:
        icon: material/brightness-4
        name: Switch to light mode
  features:
    - navigation.tabs               # top-level sections as tabs
    - navigation.tabs.sticky
    - navigation.sections           # expand sections in sidebar
    - navigation.indexes            # section index pages (framework/index.md)
    - navigation.top                # back-to-top button
    - navigation.footer
    - search.highlight
    - search.suggest
    - content.code.copy
    - content.tabs.link
    - toc.follow

markdown_extensions:
  - admonition
  - pymdownx.details
  - pymdownx.superfences:
      custom_fences:
        - name: mermaid
          class: mermaid
          format: !!python/name:pymdownx.superfences.fence_code_format
  - pymdownx.tabbed:
      alternate_style: true
  - pymdownx.highlight:
      anchor_linenums: true
  - pymdownx.inlinehilite
  - pymdownx.emoji:
      emoji_index: !!python/name:material.extensions.emoji.twemoji
      emoji_generator: !!python/name:material.extensions.emoji.to_svg
  - tables
  - attr_list
  - md_in_html
  - toc:
      permalink: true
      toc_depth: 3

plugins:
  - search
  - awesome-pages
  - glightbox
  - git-revision-date-localized:
      enable_creation_date: true
      type: date
  - minify:
      minify_html: true

nav:
  - Home: index.md
  - Framework:
      - framework/index.md
      - "1 · Use Case Archetypes": framework/use-case-archetypes.md
      - "2 · Capability Features": framework/capability-features.md
      - "3 · Technical Components": framework/technical-components.md
      - "4 · Component Selection": framework/component-selection-guide.md
      - "5 · Implementation Tiers": framework/implementation-tiers.md
      - "6 · Platform Selection": framework/platform-selection.md
  - Quick Reference:
      - Archetypes: reference/archetypes.md
      - Capability Features: reference/capability-features.md
      - Technical Components: reference/technical-components.md
  - Diagrams: diagrams/index.md
```

---

## Content Migration Details

### Framework Documents (7 files)

The files map 1:1 with minor changes needed:

| Change | Detail |
|---|---|
| Strip numeric prefixes | `01-overview.md` → `framework/index.md`, `02-` → `use-case-archetypes.md`, etc. |
| Update internal cross-references | Replace `[02-use-case-archetypes.md]` → `[use-case-archetypes.md](use-case-archetypes.md)` throughout all 7 files |
| Convert ASCII stack diagrams | Leave as fenced code blocks — they render cleanly in Material |
| Version History tables | Wrap in `??? note "Version History"` collapsible admonition to reduce page clutter |
| Callout boxes | Convert inline `> **Note**:` blockquotes to Material `!!! note` admonitions for better visual treatment |

### Reference One-Pagers (3 files)

No structural changes needed. These are already clean, concise Markdown tables and are ideal as-is for the Quick Reference section.

### Diagrams

The `.drawio` files cannot be rendered natively in MkDocs. Two-step approach:

1. **Export to SVG** using draw.io CLI during development:

```bash
# Add to a Makefile or justfile
drawio --export --format svg --output docs/assets/diagrams/ \
  diagrams/framework-relationship-overview.drawio \
  examples/01-component-architecture-stack.drawio \
  examples/02-component-feature-mapping-matrix.drawio \
  examples/03-rag-pipeline-dataflow.drawio \
  examples/04-agentic-architecture-patterns.drawio \
  examples/05-operational-excellence-concerns.drawio
```

2. **Embed in `docs/diagrams/index.md`** as a gallery page using Material's image lightbox (`mkdocs-glightbox`).

The source `.drawio` files stay in the repo for editing — only the exported SVGs go into `docs/assets/diagrams/`.

### Home Page (`docs/index.md`)

Synthesize a landing page from `01-overview.md` containing:

- One-paragraph executive summary of the framework
- The four-layer model diagram (SVG)
- The Practitioner's Path as a visual step-by-step (admonition cards)
- Links to Quick Start (T2 Knowledge Assistant) and the full Framework section

---

## What Is Excluded

| Item | Reason |
|---|---|
| `archive/` | Old versions superseded by current framework docs |
| `model-planning/to-do.md` | Internal planning note, not site content |
| `references/helix-vision-philosophy.md` | Internal/organizational context — include only if site is internal |
| `references/~$agentic-architecture-framework-20260306.pptx` | Temp lock file |
| Theme variants (`theme-1-*.drawio` through `theme-5-*.drawio`) | Working files; the canonical diagram is `framework-relationship-overview.drawio` |

---

## Implementation Phases

### Phase 1 — Scaffold *(no content changes)*

- `uv init`, pin Python 3.14, install deps
- `mkdocs.yml` with theme and nav skeleton
- Empty `docs/` structure with placeholder pages
- Verify `uv run mkdocs serve` works

### Phase 2 — Migrate content

- Copy and rename the 7 framework docs + 3 reference docs
- Update all internal cross-references
- Convert blockquotes → admonitions, wrap version histories

### Phase 3 — Diagrams

- Export all `.drawio` files to SVG
- Build the diagrams gallery page
- Add the framework overview SVG to the home page

### Phase 4 — Polish

- Create the `docs/index.md` home page
- Add downloadable assets (`.xlsx`, `.pptx`) to `docs/assets/downloads/`
- Test search, navigation, mobile rendering
- Configure `git-revision-date-localized` so "last updated" dates pull from git history

---

## Open Questions

1. **Hosting target** — GitHub Pages (free, auto-deploy via Actions), internal server, or other? This affects whether we add a `mkdocs-gh-pages` workflow.
2. **Internal vs. public** — Should `helix-vision-philosophy.md` be included? If the site is public, likely not.
3. **Diagram update workflow** — Keep the draw.io source files in the repo and run the CLI export manually, or automate it in CI?
4. **Social cards** — Material supports auto-generated OG/Twitter card images. Requires `cairosvg` and `pillow` (already in `mkdocs-material[imaging]`). Worth enabling?
