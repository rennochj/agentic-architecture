# GenAI & Agentic Architecture Framework — Overview

*Version 5.4. Last Updated: 2026-02-28*

## Purpose

This framework provides a structured approach for identifying, designing, and implementing Generative AI and Agentic AI capabilities in the enterprise. It is designed for architects, developers, and product leaders who need to move from a use case idea to a well-defined, governable system.

---

## The Four-Layer Model

The framework is organized into four layers that form a natural chain from **business need** to **implementation**:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│  LAYER 1: USE CASE ARCHETYPES (13)                                          │
│  "What job needs to be done?"                                               │
│                                                                             │
│  13 archetypes in 3 value groups, each characterized by                     │
│  4 Architectural Dimensions (Interaction, Autonomy, Grounding, Governance)  │
│  → 02-use-case-archetypes.md                                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                              ↓ requires                                     │
├─────────────────────────────────────────────────────────────────────────────┤
│  LAYER 2: CAPABILITY FEATURES (15)                                          │
│  "What functional capabilities must the solution exhibit?"                  │
│                                                                             │
│  Reusable, composable capabilities shared across archetypes.                │
│  The bridge that explains WHY a technical component is needed.              │
│  → 03-capability-features.md                                             │
├─────────────────────────────────────────────────────────────────────────────┤
│                              ↓ enabled by                                   │
├─────────────────────────────────────────────────────────────────────────────┤
│  LAYER 3: TECHNICAL COMPONENTS (~15 categories)                             │
│  "What building blocks implement the features?"                             │
│                                                                             │
│  Organized by maturity: Foundation → Augmentation → Orchestration →         │
│  Autonomy, plus cross-cutting Operational Excellence concerns.              │
│  → 04-technical-components.md                                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                              ↓ deployed on                                  │
├─────────────────────────────────────────────────────────────────────────────┤
│  LAYER 4: PLATFORMS & IMPLEMENTATION                                        │
│  "What tools, platforms, and patterns do we use?"                           │
│                                                                             │
│  Platform selection, TCO analysis, organizational fit,                      │
│  reference architectures, and implementation patterns.                      │
│  → 07-platform-selection.md                                              │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## How to Use This Framework

### The Practitioner's Path

Follow these steps to go from idea to architecture:

```
Step 1 ─────────────────────────────────────────────────────────────────────
  IDENTIFY your use case archetype.
  Read: 02-use-case-archetypes.md → Part 2 (quick reference) or Part 3 (full detail)
  Ask:  "Which of the 13 archetypes best describes the job to be done?"
  Ask:  "What are my Interaction, Autonomy, Grounding, and Governance needs?"

Step 2 ─────────────────────────────────────────────────────────────────────
  MAP to required capability features.
  Read: 03-capability-features.md → Matrix A (Archetypes → Features)
  Ask:  "Which of the 15 capability features does my archetype require?"
  Ask:  "Are there additional features my specific context demands?"

Step 3 ─────────────────────────────────────────────────────────────────────
  IDENTIFY the technical components.
  Read: 03-capability-features.md → Matrix B (Features → Components)
  Read: 04-technical-components.md for deep-dive on each component
  Ask:  "What building blocks enable my required features?"

Step 4 ─────────────────────────────────────────────────────────────────────
  EVALUATE each component for inclusion.
  Read: 05-component-selection-guide.md
  Ask:  The Seven Questions (WHY? HOW WELL? WHAT IF? IS IT LEGAL?
        CAN WE SEE? CAN WE LEARN? CAN WE SHIP?)

Step 5 ─────────────────────────────────────────────────────────────────────
  SELECT implementation tier and platform.
  Read: 06-implementation-tiers.md (maturity tiers T1-T4)
  Read: 07-platform-selection.md (platform comparison & TCO)
  Ask:  "What tier matches our maturity? What platform fits our org?"

Step 6 ─────────────────────────────────────────────────────────────────────
  GOVERN with NIST RMF alignment.
  Read: 02-use-case-archetypes.md → Part 5 (MAP, MEASURE, MANAGE, GOVERN)
  Ask:  "What risks, controls, and monitoring do we need?"
```

---

## Document Map

| Document | Purpose | Key Contents |
|----------|---------|--------------|
| **[01-overview.md](01-overview.md)** | Entry point & navigation | This document. The four-layer model, reading order, document relationships. |
| **[02-use-case-archetypes.md](02-use-case-archetypes.md)** | Layer 1: WHAT | 13 archetypes in 3 groups, quick reference table, 4 architectural dimensions, composition rules, NIST RMF selection framework. |
| **[03-capability-features.md](03-capability-features.md)** | Layer 2: WHY | 15 capability features, Matrix A (Archetypes→Features), Matrix B (Features→Components). |
| **[04-technical-components.md](04-technical-components.md)** | Layer 3: HOW | Comprehensive catalog of technical building blocks, organized by maturity layer. |
| **[05-component-selection-guide.md](05-component-selection-guide.md)** | Evaluation tool | Seven Questions framework, Component Selection Canvas, anti-patterns, production readiness. |
| **[06-implementation-tiers.md](06-implementation-tiers.md)** | Mapping & maturity | T1-T4 implementation tiers, maturity progression, component stack patterns, NFR framework. |
| **[07-platform-selection.md](07-platform-selection.md)** | Layer 4: WHERE | Platform comparison, decision trees, hybrid patterns, TCO, organizational fit. |

---

## Terminology

The framework uses consistent terminology across all documents:

| Concept | Standard Term | Definition |
|---------|---------------|------------|
| Core job-to-be-done | **Use Case Archetype** | One of 13 patterns describing the primary value a GenAI solution delivers. |
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

## Scope & Boundaries

This framework addresses **software-based GenAI and agentic systems** — the reasoning, language, planning, and decision-making layers. It does not cover the physical-world concerns of embodied AI (robotics, autonomous vehicles, sensor-actuator control loops), though LLMs increasingly serve as the cognitive layer in such systems. Where a GenAI component acts as the "brain" of a physical system, this framework applies to that cognitive layer; the physical control, safety, and real-time systems engineering require additional domain-specific frameworks.

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
