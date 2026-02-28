# GenAI & Agentic Architecture Framework — Overview

*Version 5.0. Last Updated: 2026-02-27*

## Purpose

This framework provides a structured approach for identifying, designing, and implementing Generative AI and Agentic AI capabilities in the enterprise. It is designed for architects, developers, and product leaders who need to move from a use case idea to a well-defined, governable system.

---

## The Four-Layer Model

The framework is organized into four layers that form a natural chain from **business need** to **implementation**:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  LAYER 1: USE CASE ARCHETYPES (12)                                          │
│  "What job needs to be done?"                                               │
│                                                                             │
│  12 archetypes in 3 value groups, each characterized by                     │
│  4 Architectural Dimensions (Interaction, Autonomy, Grounding, Governance)  │
│  → genai-use-case-archetypes.md                                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                              ↓ requires                                     │
├─────────────────────────────────────────────────────────────────────────────┤
│  LAYER 2: CAPABILITY FEATURES (15)                                          │
│  "What functional capabilities must the solution exhibit?"                  │
│                                                                             │
│  Reusable, composable capabilities shared across archetypes.                │
│  The bridge that explains WHY a technical component is needed.              │
│  → genai-capability-features.md                                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                              ↓ enabled by                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│  LAYER 3: TECHNICAL COMPONENTS (~15 categories)                             │
│  "What building blocks implement the features?"                             │
│                                                                             │
│  Organized by maturity: Foundation → Augmentation → Orchestration →         │
│  Autonomy, plus cross-cutting Operational Excellence concerns.              │
│  → genai-technical-components.md                                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                              ↓ deployed on                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│  LAYER 4: PLATFORMS & IMPLEMENTATION                                        │
│  "What tools, platforms, and patterns do we use?"                           │
│                                                                             │
│  Platform selection, TCO analysis, organizational fit,                      │
│  reference architectures, and implementation patterns.                      │
│  → genai-platform-selection.md                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## How to Use This Framework

### The Practitioner's Path

Follow these steps to go from idea to architecture:

```
Step 1 ─────────────────────────────────────────────────────────────────────
  IDENTIFY your use case archetype.
  Read: genai-use-case-archetypes.md (or the summary table)
  Ask:  "Which of the 12 archetypes best describes the job to be done?"
  Ask:  "What are my Interaction, Autonomy, Grounding, and Governance needs?"

Step 2 ─────────────────────────────────────────────────────────────────────
  MAP to required capability features.
  Read: genai-capability-features.md → Matrix A (Archetypes → Features)
  Ask:  "Which of the 15 capability features does my archetype require?"
  Ask:  "Are there additional features my specific context demands?"

Step 3 ─────────────────────────────────────────────────────────────────────
  IDENTIFY the technical components.
  Read: genai-capability-features.md → Matrix B (Features → Components)
  Read: genai-technical-components.md for deep-dive on each component
  Ask:  "What building blocks enable my required features?"

Step 4 ─────────────────────────────────────────────────────────────────────
  EVALUATE each component for inclusion.
  Read: genai-component-selection-guide.md
  Ask:  The Seven Questions (WHY? HOW WELL? WHAT IF? IS IT LEGAL?
        CAN WE SEE? CAN WE LEARN? CAN WE SHIP?)

Step 5 ─────────────────────────────────────────────────────────────────────
  SELECT implementation tier and platform.
  Read: genai-usecase-component-mapping.md (maturity tiers T1-T4)
  Read: genai-platform-selection.md (platform comparison & TCO)
  Ask:  "What tier matches our maturity? What platform fits our org?"

Step 6 ─────────────────────────────────────────────────────────────────────
  GOVERN with NIST RMF alignment.
  Read: genai-use-case-archetypes.md → Part 3 (MAP, MEASURE, MANAGE, GOVERN)
  Ask:  "What risks, controls, and monitoring do we need?"
```

---

## Document Map

| Document | Purpose | Key Contents |
|----------|---------|--------------|
| **[framework-overview.md](framework-overview.md)** | Entry point & navigation | This document. The four-layer model, reading order, document relationships. |
| **[genai-use-case-archetypes.md](genai-use-case-archetypes.md)** | Layer 1: WHAT | 12 archetypes in 3 groups, 4 architectural dimensions, NIST RMF selection framework. |
| **[use-case-archetypes-summary.md](use-case-archetypes-summary.md)** | Quick reference | Condensed table of all 12 archetypes with key features. |
| **[genai-capability-features.md](genai-capability-features.md)** | Layer 2: WHY | 15 capability features, Matrix A (Archetypes→Features), Matrix B (Features→Components). |
| **[genai-technical-components.md](genai-technical-components.md)** | Layer 3: HOW | Comprehensive catalog of technical building blocks, organized by maturity layer. |
| **[genai-component-selection-guide.md](genai-component-selection-guide.md)** | Evaluation tool | Seven Questions framework, Component Selection Canvas, anti-patterns, production readiness. |
| **[genai-usecase-component-mapping.md](genai-usecase-component-mapping.md)** | Mapping & maturity | T1-T4 implementation tiers, maturity progression, component stack patterns, NFR framework. |
| **[genai-platform-selection.md](genai-platform-selection.md)** | Layer 4: WHERE | Platform comparison, decision trees, hybrid patterns, TCO, organizational fit. |

---

## Terminology

The framework uses consistent terminology across all documents:

| Concept | Standard Term | Definition |
|---------|---------------|------------|
| Core job-to-be-done | **Use Case Archetype** | One of 12 patterns describing the primary value a GenAI solution delivers. |
| Functional capability | **Capability Feature** | A reusable, composable facet (e.g., "Contextual Grounding") that an archetype requires. |
| Technical building block | **Technical Component** | A concrete technology element (e.g., RAG Pipeline, Memory System) that enables a feature. |
| Component maturity layer | **Foundation / Augmentation / Orchestration / Autonomy** | The four progressive layers of technical component complexity. |
| Implementation complexity | **Tier 1-4 (T1-T4)** | Basic → Enhanced → Orchestrated → Agentic. Maps to maturity layers. |
| Cross-cutting concerns | **Operational Excellence** | Safety, Guardrails, Evaluation, Observability, and Infrastructure concerns that span all layers. |
| User/system interaction style | **Interaction Model** | One-shot, Conversational, Proactive, or API-driven. |
| Degree of independent action | **Autonomy Level** | Assistive, Semi-Autonomous, or Fully Autonomous. |
| Data augmentation approach | **Grounding Strategy** | Ungrounded, Curated Grounding (RAG), or Live Grounding (Tool Use). |
| Risk management posture | **Governance Posture** | The set of compliance, audit, and safety constraints for a use case. |

---

## Core Principles

1. **Archetype, Not Interface** — Separate the core job-to-be-done from the interaction style.
2. **Features Bridge the Gap** — Capability features explain *why* a component is needed, not just *that* it's needed.
3. **Purpose-Driven Selection** — Every component must demonstrate value across design-time and operational concerns.
4. **Risk-Aware by Design** — Aligned with the NIST AI Risk Management Framework.
5. **Living Systems** — GenAI systems must learn, adapt, and evolve; build for observability and feedback from day one.
6. **Progressive Maturity** — Start at the tier that matches your capability, plan for growth.

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 5.0 | 2026-02-27 | Major restructure: introduced 4-layer model with new Capability Features layer, harmonized terminology, reorganized documents for clarity and usability. |
| 4.0 | 2026-01-20 | Consolidated v1-v3 archetypes into single guide. |
