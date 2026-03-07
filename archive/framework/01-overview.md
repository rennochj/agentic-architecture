# GenAI & Agentic Architecture Framework — Overview

*Version 5.5. Last Updated: 2026-03-03*

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
│  LAYER 3: TECHNICAL COMPONENTS (~25 categories)                             │
│  "What building blocks implement the features?"                             │
│                                                                             │
│  13 capability components across 4 maturity layers (Foundation →            │
│  Augmentation → Orchestration → Autonomy) + 11 cross-cutting               │
│  Operational Excellence sections.                                           │
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

### Alternative Starting Points

The Practitioner's Path assumes you're starting from a use case idea. If you're starting from a different place, use these entry points:

| You're Starting From | Your Question | Entry Point |
|---|---|---|
| **A known tier** | "I'm building a T2 system — what do I need?" | Start at [06-implementation-tiers.md](06-implementation-tiers.md) §1 to confirm your tier, then §4 for the component stack pattern. Use Matrix C in [03-capability-features.md](03-capability-features.md) to identify components for your archetype. |
| **A platform constraint** | "We use Azure / we're a Microsoft shop" | Start at [07-platform-selection.md](07-platform-selection.md) §3 (decision trees) and §5 (ecosystem checklists). Work backward from the platform's tier ceiling to select an achievable archetype. |
| **An existing system to upgrade** | "I have a T2 RAG system and want to add agentic capabilities" | Start at [06-implementation-tiers.md](06-implementation-tiers.md) §9 (Upgrading an Existing System). Assess your current tier, then follow the upgrade requirements and principles. |
| **A specific component question** | "Should I use Graph RAG or basic RAG?" | Go directly to [04-technical-components.md](04-technical-components.md) — use the Section Index at the top to find the relevant component, then evaluate with the Seven Questions from [05-component-selection-guide.md](05-component-selection-guide.md). |
| **A data readiness concern** | "Is our data ready for AI?" | Start at [02-use-case-archetypes.md](02-use-case-archetypes.md) Part 5 (Data Readiness Gate) and [04-technical-components.md](04-technical-components.md) §5.9.0 (Data Readiness Assessment). |

### Quick Start: Your First Knowledge Assistant (T2)

The most common GenAI deployment is a T2 RAG-based knowledge assistant. If that's what you're building, here's the minimum viable path:

```
Archetype:   Grounded Q&A (#3)
Features:    F1 (Grounding) · F4 (Refinement) · F5 (Citation) · F12 (Safety) · F13 (Feedback)
Components:  Foundation Model · Prompting · RAG Pipeline · Vector DB · Output Processing ·
             Context Management · Memory (conversation) · Safety & Guardrails ·
             Evaluation & Testing · Observability
Tier:        T2 (Enhanced)
NFR Checklist: 06-implementation-tiers.md → §7 T2 checklist

Before you build:
  □ Run the Data Readiness Gate (02 Part 5) — is your knowledge corpus accessible,
    authoritative, and in parseable format?
  □ Confirm source authority hierarchy (what documents are primary vs. secondary?)
  □ Sample 50 items from the corpus for quality baseline

Build sequence:
  1. Basic RAG pipeline (chunking → embedding → vector search → LLM)
  2. Add conversation memory and multi-turn support
  3. Add citation tracking (passage-level attribution)
  4. Add safety guardrails (content filtering, PII detection)
  5. Add evaluation pipeline (golden dataset, quality metrics)
  6. Add feedback collection (thumbs up/down, corrections)

Go deeper: Follow the full Practitioner's Path (above) for governance,
           platform selection, and advanced feature evaluation.
```

### Architecture Definition of Done

After following the Practitioner's Path (or any alternative entry), use this checklist to verify your architecture is complete:

- [ ] **Archetype(s) identified** — primary archetype selected; if composite, composition pattern defined (02, Part 4)
- [ ] **Architectural dimensions defined** — Interaction Model, Autonomy Level, Grounding Strategy, and Governance Posture set (02, Part 2)
- [ ] **Data Readiness Gate passed** — all six questions answered, no unresolved red flags (02, Part 5)
- [ ] **Required features identified** — ● features from Matrix A confirmed; ◐ features evaluated against dimensions and dependencies (03, Matrix A)
- [ ] **Feature dependencies traced** — all prerequisite features included per the dependency table (03, Feature Dependencies)
- [ ] **Components selected** — Matrix C (or A→B trace) completed; each component evaluated with Seven Questions (03, 05)
- [ ] **Implementation tier confirmed** — Feature Maturity matrix checked; all required features achievable at the chosen tier (06, §1)
- [ ] **NFR checklist completed** — all items for the target tier checked (06, §7)
- [ ] **Platform selected** — organizational fit assessed, decision tree walked, scorecard completed (07, §3-6)
- [ ] **Data prerequisites met** — archetype-specific data prerequisites confirmed (02, Part 3)
- [ ] **Governance posture defined** — MAP/MEASURE/MANAGE/GOVERN sections completed (02, Part 5)
- [ ] **Upgrade path considered** — if starting below target tier, upgrade plan documented with OE prerequisites (06, §9)

---

## Document Map

| Document | Purpose | Key Contents |
|----------|---------|--------------|
| **[01-overview.md](01-overview.md)** | Entry point & navigation | This document. The four-layer model, reading order, document relationships. |
| **[02-use-case-archetypes.md](02-use-case-archetypes.md)** | Layer 1: WHAT | 13 archetypes in 3 groups, quick reference table, 4 architectural dimensions, composition rules, NIST RMF selection framework. |
| **[03-capability-features.md](03-capability-features.md)** | Layer 2: WHY | 15 capability features, Matrix A (Archetypes→Features), Matrix B (Features→Components), Matrix C (Archetypes→Components quick lookup). |
| **[04-technical-components.md](04-technical-components.md)** | Layer 3: HOW | Comprehensive catalog: 13 capability components across 4 maturity layers (incl. §1.3 Model Selection, §4.4 Agent Runtime) + 11 Operational Excellence cross-cutting sections (incl. §5.9 Data Readiness & Knowledge Governance with pre-project assessment and structured data readiness). |
| **[05-component-selection-guide.md](05-component-selection-guide.md)** | Evaluation tool | Seven Questions framework, Component Selection Canvas, anti-patterns, production readiness. |
| **[06-implementation-tiers.md](06-implementation-tiers.md)** | Mapping & maturity | T1-T4 implementation tiers, maturity progression, component stack patterns, NFR framework, brownfield upgrade guidance. |
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
| Cross-cutting concerns | **Operational Excellence** | 11 cross-cutting sections that apply at every tier: Safety & Guardrails, Evaluation & Testing, Infrastructure & Deployment, Observability, Cost Management, Resilience & Fault Tolerance, Performance & Latency, DevOps & Change Management, Data Readiness & Knowledge Governance, Identity & Authorization, Incident Response. |
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

## End-to-End Worked Example: Customer Support Assistant

This example traces a single use case through all six steps of the Practitioner's Path, showing how the documents work together.

> **Goal**: Build an AI-powered customer support assistant that answers questions from a product knowledge base, handles multi-turn conversations, and escalates to human agents when needed.

### Step 1: Identify Archetype (→ 02-use-case-archetypes.md)

**Primary archetype**: Conversational Agent (#13) — sustained, goal-directed conversations for support.
**Secondary archetype**: Grounded Q&A (#3) — answers grounded in a product knowledge base.
**Composition**: Nested — Conversational Agent is the outer pattern; Grounded Q&A is invoked for factual answers.

**Architectural dimensions**:
- *Interaction Model*: Conversational (multi-turn dialogue with clarification)
- *Autonomy Level*: Semi-Autonomous (AI handles routine queries; escalates complex/sensitive cases)
- *Grounding Strategy*: Curated Grounding (RAG over product docs, FAQs, policy documents)
- *Governance Posture*: PII handling required (customer data in conversations); audit logging for compliance

### Step 2: Map to Features (→ 03-capability-features.md, Matrix A)

Union of ● features from both archetypes:

| Feature | Source | Rationale |
|---|---|---|
| F1 Contextual Grounding | ● (both) | Must answer from product knowledge base |
| F4 Interactive Refinement | ● (both) | Multi-turn conversation with clarification |
| F5 Citation & Provenance | ● (Q&A) | Customers need to verify answers against docs |
| F6 Adaptive Personalization | ● (Conv) | Tailor tone and responses to customer context |
| F10 Long-Term Memory | ● (Conv) | Returning customers expect continuity |
| F11 Human Oversight Gates | ● (Conv) | Escalation to human agents |
| F12 Safety & Content Controls | ● (both) | Enterprise environment, customer-facing |
| F13 Learning & Feedback | ● (both) | Must improve quality over time |

### Step 3: Identify Components (→ 03-capability-features.md, Matrix C + Matrix B)

From Matrix C, the combined component set:

| Component | Enables | §Ref |
|---|---|---|
| Foundation Models | F1, F4, F6 | §1.1 |
| Prompting | F1, F4, F5, F6 | §1.2 |
| Model Selection Strategy | All features (ceiling) | §1.3 |
| RAG & Retrieval | F1, F5 | §2.1 |
| Output Processing | F5 (citations) | §2.2 |
| Context Management | F1, F4, F6, F10 | §3.1 |
| Memory Systems | F4, F6, F10 | §3.2 |
| Workflow Orchestration | F11 (escalation flows) | §4.2 |
| HITL Patterns | F11 (human handoff) | §4.3 |
| Safety & Guardrails | F12 | §5.1 |
| Evaluation & Testing | F1, F5, F12, F13 | §5.2 |
| Observability & Infrastructure | F5, F11, F12, F13 | §5.3-5.4 |
| Data Readiness Assessment | Prerequisite | §5.9.0 |

### Step 4: Evaluate Components (→ 05-component-selection-guide.md)

Example evaluation for **RAG & Retrieval** using the Light Canvas:

| Question | Answer |
|---|---|
| **WHY?** | Enables F1 (Contextual Grounding) — Essential |
| **WHAT IF?** | Mitigates hallucination risk — Critical Risk |
| **CAN WE SHIP?** | RAG is battle-tested, mature patterns — Battle-tested |
| **Decision** | **INCLUDE** |

*(Repeat for each component. For a T2-T3 system like this, the Light Canvas suffices.)*

### Step 5: Select Tier and Platform (→ 06, 07)

**Tier**: T2-T3 — T2 for the core RAG Q&A capability; T3 for escalation workflows and HITL gates. Per the composition rule (02, Part 4): highest tier governs → **T3**.

**Feature Maturity check** (06, Feature Maturity matrix):
- F1 at T3: Hybrid search + re-ranking + agentic retrieval ✓
- F11 at T3: HITL checkpoints at each critical stage ✓
- F10 at T3: Persistent memory across sessions ✓

**Platform** (07): If Microsoft ecosystem → Copilot Studio for the T2 layer + custom extension for T3 escalation logic. If cloud-native → Azure AI / AWS Bedrock + LangChain/LangGraph for orchestration.

### Step 6: Govern (→ 02, Part 5)

- **MAP**: Data Readiness Gate — product docs in parseable format ✓; PII scrubbing plan for conversation logs ✓
- **MEASURE**: Error tolerance moderate (incorrect product answer is reputationally damaging but not safety-critical); quality metrics = answer accuracy, escalation rate, CSAT
- **MANAGE**: PII masking in conversation logs; human escalation for billing disputes; feedback collection from day one
- **GOVERN**: Conversation logs retained 90 days; monthly quality review from golden dataset; model upgrade gated on evaluation scores

**Architecture Definition of Done**: All 12 checklist items confirmed ✓

---

## Glossary

Technical abbreviations used across the framework documents:

| Abbreviation | Full Term |
|---|---|
| A2A | Agent-to-Agent (protocol) |
| BAA | Business Associate Agreement (HIPAA) |
| BPM | Business Process Management |
| CCPA | California Consumer Privacy Act |
| CI/CD | Continuous Integration / Continuous Deployment |
| CoT | Chain-of-Thought (prompting technique) |
| CSAT | Customer Satisfaction (score) |
| DLP | Data Loss Prevention |
| DPO | Direct Preference Optimization |
| DTAP | Development, Testing, Acceptance, Production (environments) |
| FERPA | Family Educational Rights and Privacy Act |
| FTE | Full-Time Equivalent |
| GDPR | General Data Protection Regulation (EU) |
| GRC | Governance, Risk, and Compliance |
| HA | High Availability |
| HIPAA | Health Insurance Portability and Accountability Act |
| HITL | Human-in-the-Loop |
| HSM | Hardware Security Module |
| IAM | Identity and Access Management |
| KPI | Key Performance Indicator |
| LLM | Large Language Model |
| MCP | Model Context Protocol |
| MLOps | Machine Learning Operations |
| NFR | Non-Functional Requirement |
| NIST RMF | NIST AI Risk Management Framework |
| NLG | Natural Language Generation |
| NLU | Natural Language Understanding |
| NPS | Net Promoter Score |
| OCR | Optical Character Recognition |
| OE | Operational Excellence |
| PCI-DSS | Payment Card Industry Data Security Standard |
| PHI | Protected Health Information |
| PII | Personally Identifiable Information |
| RAG | Retrieval-Augmented Generation |
| RBAC | Role-Based Access Control |
| ReAct | Reasoning + Acting (agent pattern) |
| RLHF | Reinforcement Learning from Human Feedback |
| RLAIF | Reinforcement Learning from AI Feedback |
| RPA | Robotic Process Automation |
| SDLC | Software Development Lifecycle |
| SIEM | Security Information and Event Management |
| SLA | Service Level Agreement |
| SOP | Standard Operating Procedure |
| SOX | Sarbanes-Oxley Act |
| TCO | Total Cost of Ownership |
| TLS | Transport Layer Security |
| ToT | Tree of Thoughts (prompting technique) |
| VLM | Vision-Language Model |

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 5.5 | 2026-03-03 | Major usability update: Added Alternative Starting Points (Tier-First, Platform-First, Upgrade, Component, Data Readiness entry paths). Added Quick Start for T2 Knowledge Assistant. Added Architecture Definition of Done checklist (12 items). Added end-to-end worked example (Customer Support Assistant tracing all 6 steps). Added Glossary of 40+ technical abbreviations. Updated §5.9 name to "Data Readiness & Knowledge Governance" in OE terminology and document map. All framework documents aligned to v5.5. |
| 5.4 | 2026-03-01 | Updated Layer 3 component count (~15 → ~25: 13 capability components + 11 OE sections). Expanded Operational Excellence terminology to list all 11 sections. Updated document map for 04. Aligns with 04-technical-components.md v5.4 additions: §1.3 Model Selection & Customization Strategy, §3.2.4 Shared Memory, §4.4 Agent Runtime & Deployment, §5.5 Cost Management, §5.6 Resilience, §5.7 Performance, §5.8 DevOps, §5.9 Data Governance, §5.10 Identity & Authorization, §5.11 Incident Response. |
| 5.0 | 2026-02-27 | Major restructure: introduced 4-layer model with new Capability Features layer, harmonized terminology, reorganized documents for clarity and usability. |
| 4.0 | 2026-01-20 | Consolidated v1-v3 archetypes into single guide. |
