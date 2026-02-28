# Use Case Archetypes — Summary Table

*Quick reference for the 12 GenAI use case archetypes. See [genai-use-case-archetypes.md](genai-use-case-archetypes.md) for full details.*

| Group | # | Archetype | Description | Key Features | Typical Outputs |
|-------|---|-----------|-------------|--------------|-----------------|
| **A: Content & Knowledge Synthesis** | 1 | **Content Generation** | Create or rewrite content (text, code, images, audio, video) based on prompts, templates, or inputs. | F3 Structured Output · F12 Safety · F13 Feedback | Drafts, creative assets, translations, rewritten tone/style. |
| | 2 | **Summarization & Extraction** | Condense information or pull structured data from unstructured or semi-structured inputs. | F3 Structured Output · F5 Citation · F1 Grounding | Executive summaries, key-value fields, named entities, timelines. |
| | 3 | **Grounded Q&A** | Answer questions using a specific, curated body of knowledge, providing citations and evidence. | F1 Grounding · F4 Refinement · F5 Citation | Answers with source links, document snippets, known-vs-unknown signals. |
| | 4 | **Research & Synthesis** | Produce analytical artifacts by synthesizing information from many sources. | F1 Grounding · F2 Multi-Source · F5 Citation · F7 Planning · F8 Tools | Research briefs, competitive analysis, literature reviews. |
| **B: Insight & Decision Support** | 5 | **Data Interpretation & Analytics** | Explain trends, anomalies, and insights from structured data in natural language. | F3 Structured Output · F8 Tools · F9 Real-Time Data | Narrative explanations of KPI changes, anomaly summaries. |
| | 6 | **Recommendation & Personalization** | Tailor content, workflows, or experiences to a user, segment, or context. | F6 Personalization · F10 Memory · F1 Grounding | Personalized content, next-best-action, adaptive learning plans. |
| | 7 | **Simulation & Synthetic Data** | Generate data, scenarios, or environments for training, testing, or what-if analysis. | F3 Structured Output · F7 Planning · F12 Safety | Synthetic datasets, adversarial test cases, scenario catalogs. |
| **C: Process & Task Automation** | 8 | **Software Dev Acceleration** | Assist with coding, testing, reviewing, and debugging across the SDLC. | F1 Grounding · F3 Output · F8 Tools · F11 HITL | Code diffs, unit tests, PR summaries, refactoring suggestions. |
| | 9 | **Structured Workflow Automation** | Automate deterministic business processes using GenAI for NLU/NLG steps. | F3 Output · F8 Tools · F11 HITL · F15 Audit | Completed forms, drafted emails, reconciled records. |
| | 10 | **Agentic Task Automation** | Plan and execute multi-step, dynamic tasks by orchestrating tools and adapting to observations. | F7 Planning · F8 Tools · F11 HITL · F14 Multi-Agent · F15 Audit | Completed end-to-end tasks, detailed action logs. |
| | 11 | **Ops & Monitoring Copilot** | Assist operators by monitoring signals, diagnosing issues, and suggesting remediation. | F7 Planning · F8 Tools · F9 Real-Time · F11 HITL · F15 Audit | Incident summaries, root-cause hypotheses, remediation playbooks. |
| | 12 | **AI Governance & Assurance** | Use GenAI to support GRC: policy checks, control testing, audit evidence. | F1 Grounding · F2 Multi-Source · F5 Citation · F15 Audit | Compliance reports, risk registers, red-teaming findings. |

**Feature Key**: F1 Contextual Grounding · F2 Multi-Source Synthesis · F3 Structured Output · F4 Interactive Refinement · F5 Citation & Provenance · F6 Adaptive Personalization · F7 Autonomous Planning · F8 Tool Orchestration · F9 Real-Time Data · F10 Long-Term Memory · F11 Human Oversight · F12 Safety Controls · F13 Learning & Feedback · F14 Multi-Agent Collaboration · F15 Auditability & Compliance

*All archetypes implicitly require F12 (Safety Controls) and F13 (Learning & Feedback) for production use.*

---

## Composing Archetypes

Real-world solutions often chain or blend multiple archetypes. When they do, the design must account for the combined feature set, the highest tier in play, and the interaction between stages.

### Composition Patterns

| Pattern | How it works | Example |
|---------|-------------|---------|
| **Sequential (Pipeline)** | Output of archetype A feeds as input to archetype B. | Research & Synthesis → Content Generation (research a topic, then draft a report). |
| **Parallel (Blend)** | Two archetypes run concurrently over the same context or event. | Ops Copilot ∥ Data Interpretation (monitor signals *and* explain trends). |
| **Nested (Delegation)** | An outer archetype invokes inner archetypes as sub-tasks. | Agentic Task Automation calling Grounded Q&A and Structured Workflow as steps. |

### Design Rules for Composite Solutions

1. **Union of features** — Collect the Key Features from every participating archetype; the *union* drives your component set.
2. **Highest tier governs** — The most complex archetype in the composition sets the minimum implementation tier (T1-T4).
3. **Interface contracts** — Define the data shape passed between stages (schema, format, quality gates).
4. **Governance inherits upward** — Apply the strictest Governance Posture from any participating archetype to the whole composition.
5. **Evaluate end-to-end** — Quality metrics must cover the full chain, not just individual stages.

> **Tip:** Use Matrix A in [genai-capability-features.md](genai-capability-features.md) to build the merged feature profile, then trace through Matrix B and the Features × Tiers matrix in [genai-usecase-component-mapping.md](genai-usecase-component-mapping.md) as usual.

*See the full Archetype Composition guide in [genai-use-case-archetypes.md § Archetype Composition](genai-use-case-archetypes.md#part-25-archetype-composition) for worked examples and anti-patterns.*
