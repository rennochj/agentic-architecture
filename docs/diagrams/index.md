# Diagrams

All diagrams are exported from `.drawio` source files in the repository. Click any image to open it full-size.

---

## Framework Overview

### Framework Relationship Overview

The canonical view of how archetypes, features, and components relate across the four tiers.

![Framework Relationship Overview](../assets/diagrams/framework-overview.svg){ loading=lazy }

---

### Agentic Technology Capability Model

A capability model mapping GenAI technology components to agentic system requirements.

![Agentic Technology Capability Model](../assets/diagrams/agentic-tech-capability.svg){ loading=lazy }

---

## Architecture Pattern Examples

Five worked examples illustrating key patterns from the framework.

### 1 · Component Architecture Stack

How technical components stack across the four maturity tiers (Foundation → Augmentation → Orchestration → Autonomy), with OE cross-cutting concerns.

![Component Architecture Stack](../assets/diagrams/01-component-architecture-stack.svg){ loading=lazy }

---

### 2 · Component–Feature Mapping Matrix

A matrix view mapping the 15 capability features to the 13 technical components.

![Component–Feature Mapping Matrix](../assets/diagrams/02-component-feature-mapping-matrix.svg){ loading=lazy }

---

### 3 · RAG Pipeline — Data Flow

End-to-end data flow for a Retrieval-Augmented Generation pipeline: ingestion, chunking, embedding, retrieval, re-ranking, and grounded generation.

![RAG Pipeline — Data Flow](../assets/diagrams/03-rag-pipeline-dataflow.svg){ loading=lazy }

---

### 4 · Agentic Architecture Patterns

Key multi-agent coordination patterns: supervisor, pipeline, and swarm, with human-in-the-loop integration points.

![Agentic Architecture Patterns](../assets/diagrams/04-agentic-architecture-patterns.svg){ loading=lazy }

---

### 5 · Operational Excellence — Cross-Cutting Concerns

The 11 OE components mapped to the tier ladder, showing which are always-required vs. conditionally required.

![Operational Excellence — Cross-Cutting Concerns](../assets/diagrams/05-operational-excellence-concerns.svg){ loading=lazy }

---

## Framework Visualization Styles

Alternative visual representations of the full framework structure — useful for presentations and stakeholder communication.

<div class="grid cards" markdown>

- **Cascading Layers**

    Waterfall layout showing the four tiers flowing into each other with clear dependency lines.

    ![Cascading Layers](../assets/diagrams/framework-01-cascading-layers.svg){ loading=lazy }

- **Concentric Rings**

    Rings model placing Foundation at the core and Autonomy at the outer edge.

    ![Concentric Rings](../assets/diagrams/framework-02-concentric-rings.svg){ loading=lazy }

- **Relationship Matrix**

    Grid view of all cross-layer relationships between archetypes, features, and components.

    ![Relationship Matrix](../assets/diagrams/framework-03-relationship-matrix.svg){ loading=lazy }

- **Bridge Network**

    Network graph emphasizing how capability features act as bridges between archetypes (what) and components (how).

    ![Bridge Network](../assets/diagrams/framework-04-bridge-network.svg){ loading=lazy }

- **Pyramid Stack**

    Pyramid layout with Foundation as the base, Autonomy at the apex, and OE as a surrounding band.

    ![Pyramid Stack](../assets/diagrams/framework-05-pyramid-stack.svg){ loading=lazy }

</div>

---

!!! tip "Editing diagrams"

    All source files are `.drawio` format in the `diagrams/` and `examples/` directories of the repository.
    Open them in [diagrams.net](https://app.diagrams.net) or the draw.io desktop app.
    After editing, re-export SVGs to `docs/assets/diagrams/` using:

    ```bash
    docker run --rm -v "$(pwd)":/data rlespinasse/drawio-export \
      -f svg --remove-page-suffix -o /data/docs/assets/diagrams \
      /data/diagrams /data/examples
    ```
