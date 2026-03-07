# Diagrams

All diagrams are exported from `.drawio` source files in `original-diagrams/`. Click any image to open it full-size.

Run `make diagrams` to re-export after editing source files.

---

## Framework Overview

### Framework Relationship Overview

The canonical view of how archetypes, features, and components relate across the four tiers.

![Framework Relationship Overview](../assets/diagrams/framework-overview.svg){ loading=lazy }

---

### The Four-Layer Model

The four-layer chain from business need to implementation: Archetypes → Features → Components → Platforms.

![The Four-Layer Model](../assets/diagrams/four-layer-model.svg){ loading=lazy }

---

### Agentic Technology Capability Model

A capability model mapping GenAI technology components to agentic system requirements.

![Agentic Technology Capability Model](../assets/diagrams/agentic-tech-capability.svg){ loading=lazy }

---

!!! tip "Editing diagrams"

    Source files are in `original-diagrams/`. Open them in [diagrams.net](https://app.diagrams.net) or the draw.io desktop app, then re-export:

    ```bash
    make diagrams
    ```
