# Generative AI & Agentic Use Case Archetypes (v3)

This document provides a refined taxonomy of Generative AI and Agentic AI use cases, building on v2 by grouping archetypes into logical domains and more explicitly integrating with established industry risk frameworks like the NIST AI RMF.

**Core Principles of this Taxonomy:**

- **Archetype, Not Interface:** It separates the core job-to-be-done (the *archetype*) from the interaction style (e.g., chat, API, proactive).
- **Value-Oriented Grouping:** Archetypes are grouped by the type of value they create (e.g., understanding content, generating insights, automating processes).
- **Risk-Aware by Design:** It aligns with the NIST AI Risk Management Framework by embedding risk considerations directly into the selection process.

---

## The Four Architectural Dimensions

To define a complete use case, select **one primary archetype** from the groups below and combine it with the four cross-cutting architectural dimensions.

| Dimension | Description | Key Considerations |
| --- | --- | --- |
| **1. Interaction Model** | The "how" of user/system interaction. | One-shot, Conversational (Chat), Proactive, API-driven. |
| **2. Autonomy Level** | The degree of independent action. | **Assistive** (human executes), **Semi-Autonomous** (human approves), **Fully Autonomous** (human audits). |
| **3. Grounding Strategy** | The data used to ensure factual accuracy. | **Ungrounded** (general knowledge), **Curated** (RAG over docs), **Live** (tools for real-time systems). |
| **4. Governance Posture** | The required level of risk management. | Domain constraints (Legal, Health), data handling (PII), auditability, and safety controls. |

---

## Use Case Archetype Groups

### Group A: Content & Knowledge Synthesis

*These archetypes focus on understanding, transforming, and creating content.*

| # | Archetype | Description | Primary Output |
|---|---|---|---|
| 1 | **Content Generation** | Create or rewrite content (text, code, images) based on prompts. | Drafts, creative assets, translations. |
| 2 | **Summarization & Extraction** | Condense information or pull structured data from unstructured inputs. | Summaries, key-value fields, entities. |
| 3 | **Grounded Q&A** | Answer questions using a specific body of knowledge, providing citations. | Answers with sources and evidence. |
| 4 | **Research & Synthesis** | Produce a higher-level artifact (e.g., a report) from many sources. | Research briefs, competitive analysis. |

### Group B: Insight & Decision Support

*These archetypes focus on interpreting data and informing decisions.*

| # | Archetype | Description | Primary Output |
|---|---|---|---|
| 5 | **Data Interpretation & Analytics** | Explain trends, anomalies, and insights from structured data in natural language. | Narratives of dashboards, anomaly explanations. |
| 6 | **Recommendation & Personalization** | Tailor content, workflows, or experiences to a user, segment, or context. | Personalized content, next-best-action suggestions. |
| 7 | **Simulation & Synthetic Data** | Generate data or scenarios for training, testing, or what-if analysis. | Synthetic datasets, adversarial test cases. |

### Group C: Process & Task Automation

*These archetypes focus on taking action and executing multi-step processes.*

| # | Archetype | Description | Primary Output |
|---|---|---|---|
| 8 | **Software Development Acceleration** | Assist with coding, testing, reviewing, and debugging tasks. | Code diffs, tests, PR summaries, refactors. |
| 9 | **Structured Workflow Automation** | Automate deterministic business processes, using GenAI for specific steps. | Completed forms, drafted emails, reconciled records. |
| 10 | **Agentic Task Automation** | Plan and execute multi-step tasks by selecting tools and adapting to observations. | Completed bookings, investigations, or provisioning. |
| 11 | **Operations & Monitoring Copilot** | Assist operators by monitoring signals, diagnosing issues, and suggesting actions. | Incident summaries, root-cause hypotheses. |
| 12 | **AI Governance & Assurance** | Use GenAI to support GRC functions like policy checks and audit evidence gathering. | Compliance reports, risk registers, red-team findings. |

---

## Use Case Selection Framework (NIST RMF Aligned)

Use this framework to guide your design and risk management activities.

### 1. MAP: Define the Context

- **What is the primary archetype?** (Select one from the 12 above)
- **What are the four dimensions?** (Interaction, Autonomy, Grounding, Governance)
- **Who are the stakeholders?** (Users, operators, beneficiaries, impacted parties)
- **What is the expected benefit?** (Efficiency, new capability, risk reduction)

### 2. MEASURE: Assess the Risks

- **What is the error tolerance?** (Low-stakes draft vs. regulated financial decision)
- **What is the potential blast radius of an error?** (Incorrect information vs. unsafe system action)
- **How will you measure quality and effectiveness?** (Offline evals, online monitoring, user feedback)
- **What are the primary risks for this archetype?** (Refer to v2 doc for initial list: hallucination, data leakage, tool misuse, etc.)

### 3. MANAGE: Implement Controls

- **What is the required oversight model?** (Human-in-the-loop for review, approval, or audit)
- **What technical controls are needed?** (Input validation, output filtering, tool access controls, provenance logging)
- **How will you handle failures and escalations?** (Rollback procedures, human handoff, incident response)

### 4. GOVERN: Document & Monitor

- **How will the use case be documented?** (Model cards, datasheets, architectural diagrams)
- **What is the continuous monitoring strategy?** (Logging, metrics for drift/performance, alert mechanisms)
- **What is the process for updating the system?** (Change management, re-evaluation, stakeholder notification)

---

## Notes on Changes vs. v2

- **Grouped Archetypes:** The 12 archetypes are now organized into three logical groups (Content, Insight, Process) for easier navigation.
- **Elevated Dimensions:** The "Overlays" are renamed to "Architectural Dimensions" and given more prominence at the start.
- **NIST RMF Integration:** The selection framework is explicitly structured around the NIST AI RMF core functions (`Map`, `Measure`, `Manage`, `Govern`) to provide a clear, auditable path from concept to production.
- **Simplified Language:** Archetype names and descriptions have been slightly condensed for clarity.
- **Diagram Reference:** The diagram reference is removed, as it would need to be updated to reflect the new v3 structure.
