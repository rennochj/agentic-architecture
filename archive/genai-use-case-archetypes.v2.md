# Generative AI & Agentic Use Case Archetypes (v2)

This document proposes a refined taxonomy of Generative AI and Agentic AI use cases.
It keeps the original intent (a practical set of archetypes) while:

- Reducing overlap between categories (e.g., “conversational” as an interface vs. a use case)
- Separating *archetypes* from cross-cutting *overlays* (domain/regulatory, interaction style, autonomy)
- Adding commonly deployed enterprise patterns that were missing or under-specified (extraction/structuring, routing/classification, governance/assurance, ops automation)

> Scope note: “Generative AI” includes LLM/VLM and multimodal generation and understanding; “Agentic AI” includes tool use, workflows, and multi-step execution.

---

## How to Use This Taxonomy

1. **Pick one primary archetype** that best describes the core *value delivered*.
2. Add **overlays**:
   - **Interaction pattern** (one-shot, chat, proactive)
   - **Autonomy level** (assistive → semi-autonomous → autonomous)
   - **Grounding requirement** (none, curated knowledge, live systems)
   - **Domain/regulatory constraints** (PII/PHI, financial controls, legal privilege)
3. Use the **Selection Framework** to decide the minimum architecture tier (e.g., T1–T4) and required controls.

---

## 1) Generation & Transformation

**Definition**: Create or rewrite content (text, code, images, audio, video) based on prompts, templates, or inputs.

**Typical outputs**: Drafts, variants, translations, summaries, rewritten tone/style, creative assets, structured templates.

Sub-cases:

| Sub-case | Description |
| --- | --- |
| Text generation | Drafting articles, emails, reports, policies, marketing copy |
| Transformation | Summarize, translate, paraphrase, style/brand alignment |
| Multimodal generation | Text-to-image/video/audio; storyboards; voiceovers |
| Structured drafting | Producing JSON, tables, forms, checklists, SOPs |

**Common patterns/components**: Prompting patterns, templates, structured output constraints, post-processing/validation.

**Primary risks**: Hallucination, brand/compliance drift, IP leakage, unsafe content, inconsistent structure.

---

## 2) Understanding, Extraction & Structuring

**Definition**: Convert unstructured inputs into structured representations and signals.

**Typical outputs**: Entities, classifications, key-value fields, timelines, obligations, claims, citations, document metadata.

Sub-cases:

| Sub-case | Description |
| --- | --- |
| Document intelligence | Extract fields from PDFs, contracts, invoices, forms |
| Entity & relation extraction | People/orgs/products; relationships and events |
| Categorization & tagging | Topic/intent labels, routing tags, severity levels |
| Normalization | Canonicalizing names, addresses, product SKUs, policy clauses |

**Common patterns/components**: OCR/document parsing, schema-guided extraction, confidence scoring, human review loops.

**Primary risks**: Silent extraction errors, bias in labeling, poor calibration of confidence, data retention issues.

---

## 3) Grounded Q&A & Knowledge Assistance

**Definition**: Answer questions with grounding in enterprise knowledge (documents, KBs, wikis, tickets) and/or citations.

**Typical outputs**: Answers with sources, links, snippets, “what we know / don’t know”, next best actions.

Sub-cases:

| Sub-case | Description |
| --- | --- |
| Retrieval-grounded Q&A | RAG-based answers over internal corpora |
| Policy & procedure assistants | HR/IT/security policy interpretation with references |
| Case/ticket assistants | Summarize case history, propose steps, suggest macros |

**Common patterns/components**: Retrieval (RAG), re-ranking, chunking strategy, citations/provenance, refusal behavior.

**Primary risks**: Prompt injection via retrieved content, stale knowledge, overconfident answers, source misattribution.

---

## 4) Research, Synthesis & Intelligence

**Definition**: Multi-source synthesis that produces a higher-level artifact (briefing, analysis, report) from many inputs.

**Typical outputs**: Research briefs, competitive analysis, literature reviews, executive summaries, diligence packs.

Sub-cases:

| Sub-case | Description |
| --- | --- |
| Literature/market synthesis | Summarize and compare across many sources |
| Sensemaking | Identify themes, contradictions, open questions |
| Structured reports | Generate report sections with traceable evidence |

**Common patterns/components**: Iterative retrieval, decomposition, outline-first generation, evidence tables, evaluation gates.

**Primary risks**: Source quality issues, bias amplification, missing counter-evidence, non-reproducible results.

---

## 5) Analytics, Forecasting & Decision Support

**Definition**: Turn data into insights and recommendations; explain trends; explore scenarios and tradeoffs.

**Typical outputs**: Narratives of dashboards, anomaly explanations, scenario comparisons, recommendations and rationales.

Sub-cases:

| Sub-case | Description |
| --- | --- |
| Data interpretation | Natural-language explanations of KPIs and anomalies |
| Scenario analysis | “What-if” analysis and sensitivity reasoning |
| Recommendations | Next best action suggestions with constraints |
| Risk assessment | Identify risks, likelihood/impact, mitigations |

**Common patterns/components**: Tool use for data queries, constrained recommendation logic, auditability, evaluation against known outcomes.

**Primary risks**: Confident-but-wrong explanations, spurious correlations, hidden objective functions, governance/audit gaps.

---

## 6) Recommendation, Personalization & Adaptive Experiences

**Definition**: Tailor content, workflows, or experiences to a user, segment, or context.

**Typical outputs**: Personalized drafts, prioritized task lists, suggested responses, adaptive learning plans.

Sub-cases:

| Sub-case | Description |
| --- | --- |
| Personalization | Style/reading level adjustments; persona-based responses |
| Next-best action | Suggest actions based on role, history, context |
| Adaptive learning | Personalized tutoring, spaced repetition, coaching |

**Common patterns/components**: User/context modeling, preference capture, memory (session/persistent), consent controls.

**Primary risks**: Privacy violations, over-personalization, unfair outcomes, data minimization failures.

---

## 7) Software Engineering Assistance

**Definition**: Accelerate software delivery tasks with code-aware generation, analysis, and automation.

**Typical outputs**: Code diffs, PR summaries, tests, refactors, API docs, debugging hypotheses.

Sub-cases:

| Sub-case | Description |
| --- | --- |
| Code generation | Implement features, scripts, infra-as-code |
| Review & analysis | Security review, style, performance, maintainability |
| Debug & troubleshoot | Reproduce, explain, propose fixes, add tests |
| Migration & modernization | Framework/library upgrades, refactor patterns |

**Common patterns/components**: Repo context/RAG, sandboxed execution, lint/test loops, policy checks.

**Primary risks**: Vulnerable code insertion, license/IP concerns, unsafe automation, brittle changes without tests.

---

## 8) Deterministic Workflow Automation (AI-in-the-Loop)

**Definition**: Automate a known business process where the steps are mostly deterministic, with GenAI assisting specific steps.

**Typical outputs**: Completed forms, drafted emails, populated CRM fields, generated summaries, reconciled records.

Sub-cases:

| Sub-case | Description |
| --- | --- |
| Case handling assist | Draft response, propose resolution steps, update ticket |
| Document-to-system | Extract fields then write to ERP/CRM |
| Content ops | Generate variants, route for approval, publish |

**Common patterns/components**: Orchestration/workflow engine, structured extraction, idempotent tool calls, approvals.

**Primary risks**: Wrong-side effects, partial failures, “automation debt”, unclear accountability.

---

## 9) Agentic Task Execution (Tool-Using Agents)

**Definition**: A system that plans and executes multi-step tasks by selecting tools and adapting to observations.

**Typical outputs**: Completed multi-step tasks (bookings, provisioning, investigations), action logs, step-by-step trace.

Sub-cases:

| Sub-case | Description |
| --- | --- |
| Interactive task execution | Clarify goals with the user and execute steps |
| Autonomous research agents | Iteratively gather and synthesize evidence |
| Transactional agents | Execute purchases, refunds, provisioning with controls |

**Common patterns/components**: Planning + execution loop, tool/function calling, state management, HITL checkpoints, robust error handling.

**Primary risks**: Tool misuse, prompt injection, runaway costs, unsafe actions, unbounded autonomy.

---

## 10) Operations, Monitoring & IT/Business Process “Copilots”

**Definition**: Assist operators by monitoring signals, summarizing incidents, diagnosing issues, and optionally taking controlled actions.

**Typical outputs**: Incident summaries, root-cause hypotheses, remediation playbooks, change recommendations.

Sub-cases:

| Sub-case | Description |
| --- | --- |
| Proactive monitoring | Detect anomalies, summarize alerts, propose actions |
| Incident response assist | Timeline generation, comms drafts, runbook execution |
| Knowledge-to-ops | Query logs/metrics and explain likely causes |

**Common patterns/components**: Integrations with observability tools, runbooks, permissions, audit logs, escalation policies.

**Primary risks**: Incorrect remediation, alert fatigue amplification, permission creep, poor auditability.

---

## 11) Simulation, Synthetic Data & Test Generation

**Definition**: Generate data or scenarios for training, QA, robustness testing, or digital twin simulations.

**Typical outputs**: Synthetic datasets, adversarial test cases, scenario catalogs, evaluation suites.

Sub-cases:

| Sub-case | Description |
| --- | --- |
| Synthetic dataset creation | Privacy-preserving data generation for dev/test |
| Adversarial testing | Red-teaming prompts, edge-case scenario discovery |
| Digital twins | Simulated environments to explore what-if behavior |

**Common patterns/components**: Constraint-based generation, statistical validation, privacy checks, eval pipelines.

**Primary risks**: Leakage of sensitive patterns, unrealistic distributions, “overfitting to synthetic reality”.

---

## 12) Governance, Risk, Compliance & AI Assurance

**Definition**: Use GenAI to support (and sometimes automate parts of) governance and assurance processes.

**Typical outputs**: Policy checks, audit evidence summaries, risk registers, red-team findings, model cards/datasheets drafts.

Sub-cases:

| Sub-case | Description |
| --- | --- |
| Policy & control mapping | Map controls to systems, generate evidence requests |
| Compliance summarization | Summarize controls, incidents, exceptions, approvals |
| Safety operations | Triage flagged content, tune guardrails, run evals |

**Common patterns/components**: Audit logging, provenance, evaluation harnesses, access controls, retention policies.

**Primary risks**: False assurance, incomplete evidence, legal exposure, over-reliance on automated judgments.

---

## Overlays (Use These Across Any Archetype)

### A) Interaction Pattern (Interface Overlay)

| Pattern | When it fits | Common pitfalls |
| --- | --- | --- |
| One-shot | Simple generation/extraction | No opportunity to correct errors |
| Conversational | Clarification, iterative drafting | Context bloat, inconsistent answers |
| Proactive | Monitoring, nudges, reminders | Noisy alerts, user trust erosion |

### B) Autonomy Level (Control Overlay)

| Level | Description | Typical controls |
| --- | --- | --- |
| Assistive | Suggests, human executes | Review UI, citations, safe defaults |
| Semi-autonomous | Executes bounded steps | Approvals, scoped permissions, rollback |
| Autonomous | Executes end-to-end goals | Strong governance, monitoring, strict tool gates |

### C) Grounding & Data Coupling

| Type | Description | Typical components |
| --- | --- | --- |
| Ungrounded | General knowledge only | Prompting + validation |
| Curated grounding | Internal docs/KB | RAG + provenance |
| Live grounding | Real-time systems | Tools + permissions + audit |

### D) Domain/Regulatory Constraints

Treat “Healthcare”, “Legal”, “Financial”, etc. as **overlays** that raise requirements for privacy, auditability, explainability, and human oversight.

---

## Use Case Selection Framework (Practical Checklist)

Use this to choose an archetype and determine the minimum architecture maturity.

1. **What is the primary output?** (content, structure, answer, decision, action)
2. **Does it need grounding?** If yes: what sources, freshness, and provenance?
3. **Does it take actions in external systems?** If yes: what is the blast radius?
4. **What is the error tolerance?** (low-stakes draft vs. regulated decision)
5. **What is the required oversight model?** (review, approve, audit-only)
6. **How will you measure quality?** (offline evals, online monitoring, HITL feedback)

### Quick “Tier Heuristic”

This aligns with common implementation tiers (e.g., T1–T4 as used in many enterprise architectures):

- **T1**: Single-call generation/transformation; minimal integration
- **T2**: Grounding (RAG), structured outputs, basic memory
- **T3**: Multi-step orchestration, tool use, conditional flows, stronger observability
- **T4**: Agentic execution with planning, long-lived state, advanced safety/governance

---

## Notes on Changes vs. v1

- “Conversational AI” is treated as an **overlay** (interaction pattern), not a standalone archetype.
- “Personal productivity” is reframed as outcomes within other archetypes (generation, grounded assistance, recommendation) rather than a separate bucket.
- “Specialized domain applications” is reframed as a **domain/regulatory overlay**.
- Added explicit archetypes for **Extraction & Structuring**, **Workflow Automation**, **Ops/Monitoring**, and **Governance/Assurance**.

---

## Diagram

See `genai-use-case-archetypes.drawio` for the visual.

---

## Suggested External Reading (Non-Exhaustive)

These sources are commonly referenced in enterprise AI/agent discussions and governance programs:

- [NIST AI Risk Management Framework (AI RMF) and playbook](https://www.nist.gov/itl/ai-risk-management-framework)
- [Anthropic guidance on agent design patterns (tool use, decomposition, safeguards)](https://www.anthropic.com/news/building-effective-agents)
- [Microsoft Azure OpenAI documentation (production patterns, safety, eval/monitoring concepts)](https://learn.microsoft.com/en-us/azure/ai-services/openai/)
- [Google Cloud overview of AI agents (definitions and common capabilities)](https://cloud.google.com/discover/what-are-ai-agents)
