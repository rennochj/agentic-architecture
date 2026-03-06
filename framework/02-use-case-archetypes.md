# Generative AI & Agentic Use Case Archetypes

*Version 5.5. Last Updated: 2026-03-03*

This document defines the 13 use case archetypes that form Layer 1 of the GenAI & Agentic Architecture Framework. Each archetype represents a distinct job-to-be-done — the core value a GenAI solution delivers, independent of its interaction style or implementation complexity.

**How to use this document:**
1. Use the **Quick Reference table** to identify your archetype(s).
2. Apply the **Four Architectural Dimensions** to characterize how your archetype will be implemented.
3. Dive into the **full archetype detail** for scope, patterns, and risks.
4. See **Part 4: Archetype Composition** when combining multiple archetypes.
5. Apply the **Use Case Selection Framework** (Part 5) for risk-aware design.

---

## Part 1: Agentic Use Case Archetypes - Quick Reference

*All archetypes implicitly require F12 (Safety Controls) and F13 (Learning & Feedback) for production use.*

| Group | # | Archetype | Description | Primary Features | Typical Outputs |
|-------|---|-----------|-------------|-----------------|-----------------|
| **A: Content & Knowledge Synthesis** | 1 | **Content Generation** | Create or rewrite content (text, code, images, audio, video) based on prompts, templates, or inputs. | F3 · F4 · F6 · F12 · F13 | Drafts, creative assets, translations, rewritten tone/style. |
| | 2 | **Summarization & Extraction** | Condense information or pull structured data from unstructured or semi-structured inputs. | F1 · F3 · F5 · F12 · F13 | Executive summaries, key-value fields, named entities, timelines. |
| | 3 | **Grounded Q&A** | Answer questions using a specific, curated body of knowledge with citations and evidence. | F1 · F4 · F5 · F12 · F13 | Answers with source links, document snippets, known-vs-unknown signals. |
| | 4 | **Research & Synthesis** | Produce analytical artifacts by synthesizing information from many sources. | F1 · F2 · F3 · F5 · F7 · F8 · F13 | Research briefs, competitive analysis, literature reviews. |
| **B: Insight & Decision Intelligence** | 5 | **Data Interpretation & Analytics** | Explain trends and act on anomalies from structured data, from narrative insight to automated response. | F3 · F8 · F9 · F12 · F13 | Narrative explanations of KPI changes, anomaly summaries, triggered alerts. |
| | 6 | **Recommendation & Personalization** | Tailor and deliver content, workflows, or experiences to a user, segment, or context. | F1 · F6 · F10 · F12 · F13 | Personalized content, next-best-action suggestions, adaptive learning plans, dynamic pricing. |
| | 7 | **Simulation & Synthetic Data** | Generate data, scenarios, or environments for training, testing, or what-if analysis. | F3 · F7 · F12 · F13 | Synthetic datasets, adversarial test cases, scenario catalogs. |
| **C: Process & Task Automation** | 8 | **Software Dev Acceleration** | Assist with coding, testing, reviewing, and debugging across the SDLC. | F1 · F3 · F4 · F8 · F11 · F12 · F13 | Code diffs, unit tests, PR summaries, refactoring suggestions. |
| | 9 | **Structured Workflow Automation** | Automate deterministic business processes using GenAI for NLU/NLG steps. | F3 · F8 · F11 · F12 · F13 · F15 | Completed forms, drafted emails, reconciled records. |
| | 10 | **Agentic Task Automation** | Plan and execute multi-step, dynamic tasks by orchestrating tools and adapting to observations. | F7 · F8 · F9 · F10 · F11 · F12 · F13 · F14 · F15 | Completed end-to-end tasks, detailed action logs. |
| | 11 | **Ops & Monitoring Copilot** | Assist operators by monitoring signals, diagnosing issues, and suggesting remediation. | F1 · F7 · F8 · F9 · F10 · F11 · F12 · F13 · F15 | Incident summaries, root-cause hypotheses, remediation playbooks. |
| | 12 | **AI Governance & Assurance** | Use GenAI to support GRC: policy checks, control testing, audit evidence gathering. | F1 · F2 · F3 · F5 · F11 · F12 · F13 · F15 | Compliance reports, risk registers, red-teaming findings. |
| | 13 | **Conversational Agent** | Conduct sustained, goal-directed conversations for support, sales, coaching, or advisory interactions. | F1 · F4 · F6 · F10 · F11 · F12 · F13 | Resolved support tickets, guided sales conversations, coaching sessions, escalation handoffs. |

**Feature Key**: F1 Contextual Grounding · F2 Multi-Source Synthesis · F3 Structured Output · F4 Interactive Refinement · F5 Citation & Provenance · F6 Adaptive Personalization · F7 Autonomous Planning · F8 Tool Orchestration · F9 Real-Time Data · F10 Long-Term Memory · F11 Human Oversight · F12 Safety Controls · F13 Learning & Feedback · F14 Multi-Agent Collaboration · F15 Auditability & Compliance

---

## Part 2: The Four Architectural Dimensions

Once you have identified your archetype, use these four dimensions to characterize how it will be implemented. The same archetype can be realised in very different ways depending on the choices made here.

| Dimension | Description | Levels |
|-----------|-------------|--------|
| **1. Interaction Model** | How users and systems interact. Defines the UX and API surface. | **One-shot**: Stateless request-response.<br>**Conversational**: Multi-turn dialogue with clarification and refinement.<br>**Batch**: High-volume, scheduled or triggered processing of many items — no expectation of immediate per-item response. Async delivery is inherent.<br>**Proactive**: System-initiated based on triggers or observations.<br>**API-driven**: Programmatic interface consumed by other systems. |
| **2. Autonomy Level** | The degree of independent action permitted. A critical control plane. | **Assistive** (HITL for Execution): AI suggests, human executes.<br>**Semi-Autonomous** (HITL for Approval): AI acts within bounds, human approves.<br>**Fully Autonomous** (HITL for Audit): AI executes end-to-end, human audits. |
| **3. Grounding Strategy** | How the system ensures factual accuracy and relevance. | **Ungrounded**: Model's pre-trained knowledge only.<br>**Curated Grounding (RAG)**: Augmented with a specific knowledge base.<br>**Live Grounding (Tool Use)**: Real-time data via tools, APIs, databases. |
| **4. Governance Posture** | Required level of risk management, compliance, and oversight. | A set of constraints driven by the domain:<br>- Data handling (PII, PHI, sensitive data)<br>- Auditability (logging depth, traceability)<br>- Safety & compliance (filters, regulations, standards) |

---

## Part 3: The 13 Archetypes — Full Detail

### Group A: Content & Knowledge Synthesis

*Focus: Understanding, transforming, and creating content.*

---

#### 1. Content Generation

**Description**: Create or rewrite content (text, code, images, audio, video) based on prompts, templates, or other inputs.

**Typical Outputs**: Drafts, creative assets, translations, rewritten tone/style, template-based documents.

**Scope**:
- Text generation (articles, reports, marketing copy, documentation)
- Image, video, and audio generation from descriptions
- Template and draft creation for human refinement

**Primary Features**: F3 (Structured Output) · F12 (Safety Controls) · F13 (Learning & Feedback) · F4 (Interactive Refinement) · F6 (Adaptive Personalization)

**Common Patterns**: Prompt engineering, few-shot examples, structured output constraints (JSON schema), style guides, post-processing validation.

**Primary Risks**: Hallucination, brand/compliance drift, intellectual property leakage, generation of unsafe or biased content.

**Data Prerequisites**: Brand and style guides in structured, accessible format. Approved tone and vocabulary references. Example content pairs (input brief → target output) for few-shot grounding. Template library with schema definitions for structured outputs. Intellectual property and licensing clearance for any reference material used in prompting.

---

#### 2. Summarization & Extraction

**Description**: Condense information or pull structured data from unstructured or semi-structured inputs.

**Typical Outputs**: Executive summaries, key-value fields from documents, named entities, timelines, obligations from contracts.

**Scope**:
- Text transformation (summarization, paraphrasing, translation, format conversion)
- Document analysis (entity extraction, key point identification, structured data extraction)

**Primary Features**: F3 (Structured Output) · F5 (Citation & Provenance) · F1 (Contextual Grounding) · F12 (Safety Controls) · F13 (Learning & Feedback)

**Common Patterns**: OCR/document parsing pipelines, schema-guided extraction, confidence scoring, human-in-the-loop verification.

**Primary Risks**: Silent extraction errors, bias in labeling, poor confidence calibration, data retention issues with source documents.

**Data Prerequisites**: Representative sample of source documents in target formats (PDFs, contracts, reports, emails) — covering format and complexity diversity. Defined extraction schema (field names, types, cardinality, required vs. optional). Labeled golden examples (input document → expected extracted fields) for evaluation; minimum 50 examples recommended before production. Document parsability confirmed (not scanned images without OCR pipeline). Data retention and PII policy defined for source document storage.

---

#### 3. Grounded Q&A

**Description**: Answer questions using a specific, curated body of knowledge, providing citations and evidence. The classic RAG pattern.

**Typical Outputs**: Answers with source links, document snippets, clear indications of known vs. unknown.

**Scope**:
- Question answering from knowledge bases, documents, or structured data
- Explanation and education — breaking down complex topics for target audiences

**Primary Features**: F1 (Contextual Grounding) · F4 (Interactive Refinement) · F5 (Citation & Provenance) · F12 (Safety Controls) · F13 (Learning & Feedback)

**Common Patterns**: RAG with chunking and embedding, hybrid search, re-ranking, robust citation and provenance tracking, "I don't know" handling.

**Primary Risks**: Prompt injection via retrieved content, stale or outdated knowledge, overconfident but incorrect answers, source misattribution.

**Data Prerequisites**: Authoritative, curated knowledge corpus with defined scope boundaries (what the system should and should not answer). Source authority hierarchy established (primary / secondary / user-generated). Document metadata available for citation: title, author, date, version, owner. Freshness SLA defined per knowledge domain (e.g., policy docs refreshed within 30 days of change). Out-of-scope topic list documented so "I don't know" handling can be tested. PII scrubbing completed before corpus ingestion.

---

#### 4. Research & Synthesis

**Description**: Produce a higher-level, analytical artifact by synthesizing information from many sources — reports, briefings, literature reviews, competitive analyses.

**Typical Outputs**: Research briefs, competitive analysis, literature reviews, executive summaries with evidence chains.

**Scope**:
- Information retrieval and synthesis from multiple sources
- Research assistance — literature review, competitive analysis, market research

**Primary Features**: F1 (Contextual Grounding) · F2 (Multi-Source Synthesis) · F3 (Structured Output) · F5 (Citation & Provenance) · F7 (Autonomous Planning) · F8 (Tool Orchestration) · F13 (Learning & Feedback)

**Common Patterns**: Iterative retrieval and decomposition (outline-first generation), evidence mapping, evaluation gates for contradiction detection, web/document tool integration.

**Primary Risks**: Source quality issues, amplification of bias, missing counter-evidence, non-reproducible results.

**Data Prerequisites**: Access to authoritative primary and secondary sources (internal document libraries, licensed databases, web search API). Source quality classification system in place before synthesis begins. Cross-source reconciliation approach defined (how to handle contradictions between sources). Research scope constraints documented to prevent unbounded retrieval. If web search is included: allowed/blocked domain lists defined.

---

### Group B: Insight & Decision Intelligence

*Focus: Deriving insights and driving decisions — from informing human judgment to executing decisions autonomously.*

---

#### 5. Data Interpretation & Analytics

**Description**: Explain trends, anomalies, and insights from structured data (dashboards, databases, BI tools) in natural language — and, at higher autonomy levels, trigger automated responses to detected patterns.

**Typical Outputs**: Narrative explanations of KPI changes, plain-language anomaly summaries, answers to data questions, triggered alerts and automated responses.

**Scope**:
- Data interpretation — explaining patterns, anomalies, and trends
- Report and dashboard narration — converting charts and metrics into narratives
- Automated response — triggering alerts, adjustments, or escalations based on detected patterns

**Primary Features**: F3 (Structured Output) · F8 (Tool Orchestration) · F9 (Real-Time Data Access) · F12 (Safety Controls) · F13 (Learning & Feedback)

**Common Patterns**: Tool use for data querying (SQL, Python), code execution sandboxes, constrained generation for data fidelity.

**Primary Risks**: Confident-but-wrong explanations (spurious correlations), data access control gaps, misinterpretation of user intent.

**Data Prerequisites**: Queryable structured data (database, data warehouse, or BI tool) with a documented schema and data dictionary — column/table names must be meaningful or supplemented by a semantic layer. Historical data depth sufficient for trend analysis (typically 13+ months for seasonality, 3+ years for longer-cycle patterns). Sample validated queries covering the most common analytical questions (used as few-shot examples for SQL generation). Data freshness and update latency documented per source (batch vs. real-time). Row-level security enforced so the agent cannot access data beyond the querying user's permissions.

---

#### 6. Recommendation & Personalization

**Description**: Tailor and deliver content, workflows, or experiences to a user, segment, or context — from suggesting options to autonomously executing personalized actions (dynamic pricing, content serving, adaptive learning paths).

**Typical Outputs**: Personalized content, next-best-action suggestions, adaptive learning plans, prioritized task lists, dynamically priced offers, auto-served recommendations.

**Scope**:
- Content personalization — adapting for specific audiences, contexts, or preferences
- Recommendation generation — actionable suggestions from analysis
- Learning and skill development — personalized tutoring and adaptive experiences

**Primary Features**: F6 (Adaptive Personalization) · F10 (Long-Term Memory) · F1 (Contextual Grounding) · F12 (Safety Controls) · F13 (Learning & Feedback)

**Common Patterns**: User/context modeling, preference capture, session and persistent memory, consent management for data use.

**Primary Risks**: Privacy violations, filter bubbles, unfair outcomes, over-personalization, data minimization failures.

**Data Prerequisites**: User behavioral history (interaction signals, preference events, purchase or engagement data) with consent management in place. Item or content catalog with structured feature metadata (attributes, categories, relationships). Cold-start strategy defined for new users with no history (content-based fallback, onboarding survey, default segment). Consent and data minimization policy implemented before storing user profiles. Feedback signal design completed (explicit ratings, implicit signals, A/B test infrastructure) to close the learning loop.

---

#### 7. Simulation & Synthetic Data

**Description**: Generate data, scenarios, or environments for training, testing, or what-if analysis.

**Typical Outputs**: Synthetic datasets, adversarial test cases, simulated scenario catalogs.

**Scope**:
- Synthetic dataset creation for model training where real data is scarce or private
- Adversarial and edge case testing for AI system robustness
- Scenario analysis — exploring "what-if" outcomes

**Primary Features**: F3 (Structured Output) · F7 (Autonomous Planning) · F12 (Safety Controls) · F13 (Learning & Feedback)

**Common Patterns**: Constraint-based generation, statistical validation against real-world distributions, privacy checks to prevent data leakage.

**Primary Risks**: Leakage of sensitive patterns, unrealistic distributions, introduction of unexpected biases.

**Data Prerequisites**: Real-world reference dataset with statistical characterization (distributions, value ranges, correlations, edge case frequencies) — used to validate that synthetic outputs match real-world properties. Domain constraints and business rules documented (valid value ranges, logical dependencies, cardinality constraints). Privacy-safe sample of real data available for distribution comparison without exposing raw sensitive records. Downstream use case defined precisely (training a classifier, stress-testing a system, populating a test environment) — fidelity requirements differ significantly by use case.

---

### Group C: Process & Task Automation

*Focus: Taking action and executing multi-step processes in systems.*

---

#### 8. Software Development Acceleration

**Description**: Assist with coding, testing, reviewing, and debugging tasks across the software development lifecycle.

**Typical Outputs**: Code diffs, unit tests, pull request summaries, refactoring suggestions, debugging hypotheses, API documentation.

**Scope**:
- Code generation from natural language or specifications
- Code review and analysis for bugs, security, and style
- Refactoring and modernization
- Documentation generation from code
- Debugging and troubleshooting

**Primary Features**: F1 (Contextual Grounding) · F3 (Structured Output) · F4 (Interactive Refinement) · F8 (Tool Orchestration) · F11 (Human Oversight) · F12 (Safety Controls) · F13 (Learning & Feedback)

**Common Patterns**: RAG over codebase, sandboxed code execution, linting and testing loops, IDE/CI-CD integration.

**Primary Risks**: Vulnerable or non-performant code, license/IP compliance, unsafe automation in production, brittle changes without tests.

**Data Prerequisites**: Codebase accessible and indexable (or a representative, well-structured sample for scoped use cases). Coding standards, style guides, and architectural conventions documented and current. Existing test suite available as a quality reference and regression baseline. Dependency manifests and build configurations current and resolving cleanly. License compatibility confirmed for model training and code suggestion (open-source license constraints apply to suggested code). Known vulnerability baseline established so the assistant can be evaluated against it.

---

#### 9. Structured Workflow Automation

**Description**: Automate deterministic business processes where GenAI handles specific steps requiring natural language understanding or generation.

**Typical Outputs**: Completed forms, drafted emails for approval, reconciled records, populated CRM fields.

**Scope**:
- Workflow automation — integrating GenAI into business process steps
- Writing assistance — drafting, editing, and improving communications

**Primary Features**: F3 (Structured Output) · F8 (Tool Orchestration) · F11 (Human Oversight) · F15 (Auditability & Compliance) · F12 (Safety Controls) · F13 (Learning & Feedback)

**Common Patterns**: Integration with workflow engines (BPM, RPA), idempotent tool calls, human-in-the-loop approval steps.

**Primary Risks**: Incorrect side-effects in external systems, partial failures, "automation debt," unclear error accountability.

**Data Prerequisites**: Business process documented end-to-end (BPM diagram, runbook, or SOP) with decision points, exceptions, and escalation paths explicit. Form schemas and field definitions for all inputs/outputs the agent processes. Integration API contracts for downstream systems — schemas, authentication, idempotency guarantees, and error response formats. Sample input/output pairs for the automation target (used as golden examples for quality evaluation). Integration test environment available before production automation; rollback/undo capability documented for each write operation.

---

#### 10. Agentic Task Automation

**Description**: Plan and execute multi-step, dynamic tasks by selecting and orchestrating tools (APIs, databases, etc.) and adapting to observations.

**Typical Outputs**: Completed end-to-end tasks (booked trip, provisioned server, completed investigation), detailed action logs.

**Scope**:
- Interactive task execution — collaborating with users to complete complex tasks
- Autonomous agents — handling journeys end-to-end including follow-ups and transactions
- Personal productivity agents — managing schedules, emails, organization

**Primary Features**: F7 (Autonomous Planning) · F8 (Tool Orchestration) · F9 (Real-Time Data) · F10 (Long-Term Memory) · F11 (Human Oversight) · F14 (Multi-Agent) · F15 (Auditability) · F12 (Safety Controls) · F13 (Learning & Feedback)

**Common Patterns**: Planning and execution loops (ReAct), function/tool calling, state management, robust error handling, human checkpoints for high-stakes actions.

**Primary Risks**: Tool misuse, prompt injection leading to unauthorized actions, runaway costs from looping, unsafe real-world consequences.

**Data Prerequisites**: All tool APIs documented with schemas, authentication methods, rate limits, and error response formats — and validated in a non-production environment before agent deployment. Action space explicitly bounded: a written inventory of what the agent is and is not permitted to do, enforced at the authorization layer, not only in the prompt. Integration test environment (sandbox or staging) available for end-to-end agent testing before production. Rollback/undo or compensating transaction capability documented for every write or state-changing operation. Credential and secret management strategy in place (vault, rotation policy) — no credentials embedded in prompts or configuration files.

---

#### 11. Operations & Monitoring Copilot

**Description**: Assist human operators by monitoring signals, diagnosing issues, and suggesting or taking controlled remediation actions.

**Typical Outputs**: Incident summaries, root-cause hypotheses, remediation playbooks, status communications.

**Scope**:
- Proactive system monitoring — identifying issues and taking corrective action or escalating

**Primary Features**: F1 (Contextual Grounding) · F7 (Autonomous Planning) · F8 (Tool Orchestration) · F9 (Real-Time Data) · F10 (Long-Term Memory) · F11 (Human Oversight) · F15 (Auditability) · F12 (Safety Controls) · F13 (Learning & Feedback)

**Common Patterns**: Integrations with observability tools (Datadog, Splunk), runbooks-as-code, strict permissions, detailed audit logs.

**Primary Risks**: Incorrect remediation causing further outages, alert fatigue amplification, permission creep, poor auditability.

**Data Prerequisites**: Observability data streams accessible and queryable in real time — logs, metrics, traces, and alert events — with retention policy sufficient for incident investigation. Runbooks and remediation playbooks in structured, parseable format (Markdown, YAML, or structured knowledge base) — not locked in human-only wikis. Historical incident data available for training and testing alert pattern detection. Alert taxonomy documented (severity levels, categories, ownership routing). Read permissions confirmed for all monitoring systems; write/remediation permissions scoped to the minimum necessary and gated by human oversight at appropriate autonomy levels.

---

#### 12. AI Governance & Assurance

**Description**: Use GenAI to support Governance, Risk, and Compliance (GRC) functions — policy checks, control testing, audit evidence gathering.

**Typical Outputs**: Compliance reports, risk registers, red-teaming findings, model cards, datasheets.

**Scope**:
- Risk assessment — identifying risks, likelihood, and impact
- Legal and compliance — analyzing contracts, regulations, and supporting compliance workflows

**Primary Features**: F1 (Contextual Grounding) · F2 (Multi-Source Synthesis) · F3 (Structured Output) · F5 (Citation & Provenance) · F11 (Human Oversight) · F15 (Auditability & Compliance) · F12 (Safety Controls) · F13 (Learning & Feedback)

**Common Patterns**: RAG over compliance frameworks and internal policies, evaluation harnesses for testing other AI systems, detailed provenance logging.

**Primary Risks**: False assurance from automated checks, incomplete/misleading evidence, over-reliance on automated judgments.

**Data Prerequisites**: Regulatory frameworks and internal policies in machine-readable or structured indexed form — current versions, with version history. Control catalog with assessment criteria, evidence types, and testing procedures. Audit trails and evidence logs from systems being governed, accessible via API or structured export. Evidence collection templates defining what constitutes sufficient proof for each control. Historical findings and remediation records available for trend analysis and recurrence detection. Human review workflow defined before any automated finding is treated as authoritative.

---

#### 13. Conversational Agent

**Description**: Conduct sustained, goal-directed conversations that guide users through support, sales, coaching, onboarding, or advisory interactions — with persona-appropriate tone, empathy, and escalation awareness.

**Typical Outputs**: Resolved support tickets, guided sales conversations, coaching and mentoring sessions, onboarding completions, escalation handoffs with full context.

**Scope**:
- Customer service and support — resolving issues through multi-turn dialogue
- Sales and advisory — guiding prospects through product discovery and purchase decisions
- Coaching and mentoring — sustained developmental conversations with progress tracking
- Onboarding and guided workflows — walking users through processes conversationally
- Escalation management — detecting when to hand off to a human agent, with full context transfer

**Primary Features**: F1 (Contextual Grounding) · F4 (Interactive Refinement) · F6 (Adaptive Personalization) · F10 (Long-Term Memory) · F11 (Human Oversight) · F12 (Safety Controls) · F13 (Learning & Feedback)

**Common Patterns**: Persona and tone management, intent classification and routing, escalation logic with context handoff, sentiment and frustration detection, conversation repair strategies, multi-turn context tracking, response latency optimization, CSAT/NPS feedback loops.

**Primary Risks**: Tone-deaf or inappropriate responses in sensitive situations, failed escalation (user stuck in a loop), over-promising or providing incorrect commitments, privacy leakage of other customers' data, empathy failures, brand-damaging interactions at scale.

**Data Prerequisites**: Conversation history logs (historical interactions) for intent modeling, tone calibration, and failure mode analysis — scrubbed of PII before use. Knowledge base or FAQ corpus for grounding factual responses, with defined freshness SLA. Product, service, or policy catalog with structured metadata (pricing, eligibility, constraints) current as of deployment. Escalation criteria and routing rules documented and tested with real-world failure cases. Persona and tone guidelines in written, referenceable form. CSAT or user satisfaction signal infrastructure in place before launch to enable feedback-driven improvement from day one.

---

## Part 4: Archetype Composition


Real-world solutions frequently span more than one archetype. A customer-facing research assistant might chain **Research & Synthesis** into **Content Generation**; an autonomous DevOps agent might nest **Grounded Q&A**, **Ops Copilot**, and **Structured Workflow Automation** inside **Agentic Task Automation**. This section provides the vocabulary and design rules for these composite solutions.

### Composition Patterns

| Pattern | Mechanism | When to use | Example |
|---------|-----------|-------------|---------|
| **Sequential (Pipeline)** | Output of stage *A* becomes input to stage *B*. Stages are decoupled by a defined data contract. | The first archetype produces an artifact the second archetype refines or transforms. | **Research & Synthesis → Content Generation**: Research produces structured findings; Content Generation drafts a polished report from them. |
| **Parallel (Blend)** | Two or more archetypes process the same context or event stream concurrently; results are merged or presented side-by-side. | Users need simultaneous capabilities that cut across archetype boundaries. | **Ops Copilot ∥ Data Interpretation**: Monitor infrastructure signals *while* generating natural-language explanations of anomaly trends. |
| **Nested (Delegation)** | An outer "orchestrator" archetype invokes inner archetypes as sub-tasks, routing context and collecting results. | An agentic or workflow archetype must perform specialist jobs (Q&A lookup, extraction, generation) as part of a larger plan. | **Agentic Task Automation** delegates to **Grounded Q&A** (look up policy), **Summarization & Extraction** (parse a form), and **Structured Workflow** (submit the result). |

### Design Rules

#### 1. Union of Features

Collect the **Primary Features** from every participating archetype. The *union* of those features is the feature profile for the composite solution.

```
Research & Synthesis:  F1, F2, F5, F7, F8
Content Generation:    F3, F4, F6, F12, F13
────────────────────────────────────────────
Composite feature set: F1, F2, F3, F4, F5, F6, F7, F8, F12, F13
```

Use **Matrix A** in [03-capability-features.md](03-capability-features.md) to build this merged profile, then trace through **Matrix B** and the **Features × Tiers** matrix in [06-implementation-tiers.md](06-implementation-tiers.md) as usual.

#### 2. Highest Tier Governs

Each participating archetype implies a minimum implementation tier (T1-T4). The **most complex archetype sets the floor** for the entire composition.

| Archetype | Typical minimum tier |
|-----------|---------------------|
| Content Generation | T1-T2 |
| Research & Synthesis | T2-T3 |
| Agentic Task Automation | T3-T4 |

If you chain a T1 archetype behind a T3 archetype, the overall solution is at least T3 — because the orchestration, observability, and governance requirements of the highest-tier participant apply system-wide.

#### 3. Interface Contracts Between Stages

Each boundary between archetypes needs a **data contract** that specifies:

- **Schema** — the structure of the handoff artifact (e.g., JSON schema, document template).
- **Quality gate** — minimum quality bar before the next stage proceeds (e.g., confidence threshold, completeness check, human approval).
- **Error handling** — what happens when the upstream stage fails or returns low-confidence output (retry, fallback, escalate).

#### 4. Governance Inherits Upward

Apply the **strictest Governance Posture** from any participating archetype to the *entire* composition. If one stage handles PII and another does not, PII controls apply end-to-end.

#### 5. End-to-End Evaluation

Evaluating individual stages is necessary but not sufficient. Add **end-to-end metrics** that measure the quality of the final output across the full chain:

- Does the final report (Content Generation) accurately reflect the research (Research & Synthesis)?
- Does the completed task (Agentic) correctly use the policy answer (Grounded Q&A)?
- Is end-to-end latency acceptable or do parallel stages need independent SLAs?

### Worked Example: Compliance Research Assistant

> **Goal**: Automatically research regulatory changes, generate a compliance impact report, and file it into the GRC system.

| Stage | Archetype | Role | Key Features |
|-------|-----------|------|--------------|
| 1 | Research & Synthesis | Gather and synthesize regulatory sources | F1, F2, F5, F7, F8 |
| 2 | Content Generation | Draft the impact report in the org's template | F3, F4, F6 |
| 3 | AI Governance & Assurance | Validate against internal policies; file evidence | F1, F5, F15 |

**Composition pattern**: Sequential pipeline (1 → 2 → 3).
**Merged feature set**: F1, F2, F3, F4, F5, F6, F7, F8, F15 (+ implicit F12, F13).
**Governing tier**: T3 (Research & Synthesis drives orchestration needs).
**Governance posture**: Inherits from Stage 3 — full auditability, provenance chain, compliance logging.
**Interface contracts**:
- Stage 1 → 2: Structured findings JSON with source citations and confidence scores; quality gate = minimum 3 corroborating sources.
- Stage 2 → 3: Completed report in org template; quality gate = human review before filing.

### Worked Example: Knowledge Work Agent (Claude Cowork)

> **Goal**: Given a prompt like "Analyse last quarter's sales data and produce a board-ready presentation with recommendations," the agent autonomously reads local files, researches supporting context, synthesises findings, and delivers polished outputs to the file system — with the user able to provide direction mid-task.

| Stage | Archetype | Role | Key Features |
|-------|-----------|------|--------------|
| 1 | Agentic Task Automation | Outer orchestrator: decomposes the goal, manages parallel workstreams, coordinates file system and internet access | F7, F8, F9, F10, F11, F14 |
| 2 | Research & Synthesis | Inner: reads local files, queries internet for market/competitive context, synthesises findings into structured evidence | F1, F2, F5, F7, F8 |
| 3 | Content Generation | Inner: produces formatted deliverables (Excel with formulas, presentations, polished documents) from synthesised findings | F3, F4, F6 |

**Composition pattern**: Nested (Delegation) — Agentic Task Automation is the outer orchestrator; Research & Synthesis and Content Generation are invoked as sub-tasks.

**Merged feature set**: F1, F2, F3, F4, F5, F6, F7, F8, F9, F10, F11, F14 (+ implicit F12, F13).

**Governing tier**: T4 — autonomous planning with parallel workstreams and multi-agent coordination.

**Architectural dimensions**:
- *Interaction Model*: Proactive — executes autonomously once the goal is set; user can provide mid-task direction.
- *Autonomy Level*: Semi-Autonomous — HITL for significant decisions; user maintains visibility throughout.
- *Grounding Strategy*: Live Grounding — local file system and internet access as tools.
- *Governance Posture*: Local data handling (file system access controls), isolated execution environment, audit trail of all actions taken.

**Interface contracts**:
- Stage 2 → 3: Structured findings (JSON/markdown) with source attribution; quality gate = factual plausibility check before generation begins.
- Outer (Stage 1) → Inner stages: Goal decomposition with file-path context and output-format specification; quality gate = user approval before any file writes are committed.

---

### Anti-Patterns

| Anti-Pattern | Problem | Remedy |
|--------------|---------|--------|
| **Mega-archetype** | Treating the entire composition as a single archetype, ignoring internal boundaries. | Decompose into distinct stages with clear contracts. |
| **Lowest-common-denominator tier** | Designing the composite at the simplest stage's tier, under-engineering the complex stages. | Tier to the *highest* participant; apply tier-appropriate controls to each stage. |
| **Missing cross-stage evaluation** | Each stage passes its own tests but the end-to-end output is poor. | Add integration-level evaluation metrics alongside per-stage metrics. |
| **Governance gap at the seam** | Data classification or access controls change between stages but nobody noticed. | Inherit the strictest posture; audit data flow at every handoff. |
| **Unbounded delegation** | Nested composition where the outer agent can invoke an unlimited number of inner archetypes without budget or depth limits. | Set explicit sub-task budgets (max calls, max tokens, max depth) and require human checkpoints. |

---

## Part 5: Use Case Selection Framework (NIST RMF Aligned)

Use this framework to guide design and risk management, moving from a high-level concept to a well-defined, governable system.

### 1. MAP: Define Context & Requirements

- **What is the primary archetype?** Select from the 13 above.
- **Is this a composite solution?** If it chains, blends, or nests multiple archetypes, apply the composition rules in Part 4 — union the features, tier to the highest participant, and define interface contracts.
- **What are the four architectural dimensions?** Define Interaction Model, Autonomy Level, Grounding Strategy, and Governance Posture.
- **What capability features are required?** Use Matrix A in [03-capability-features.md](03-capability-features.md) (for composites, use the merged feature set).
- **Who are the stakeholders?** End-users, operators, beneficiaries, impacted parties.
- **What is the expected benefit?** Efficiency gains, new capability, or risk reduction.
- **What are functional and performance requirements?** Success criteria, accuracy, latency, throughput.
- **What is the estimated TCO?** Development, data, training, inference, and human oversight.

#### Data Readiness Gate

Data readiness is a go/no-go prerequisite — not an operational concern to address later. Answer these questions before committing to an archetype or approach. Gaps discovered here are far cheaper to resolve than those found mid-implementation.

| Question | What to Assess | Red Flags |
|----------|---------------|-----------|
| **Is the data accessible?** | Can the AI system reach the required data — via APIs, database connections, file access, or knowledge base? Are network policies, credentials, and access rights resolved? | Firewall blocks, no API contract, data locked in legacy systems without export path. |
| **Is the data legally cleared for AI use?** | Are there consent, licensing, or regulatory restrictions on using this data for AI retrieval, inference, or training? For PII/PHI: has a Privacy Impact Assessment been completed? For third-party data: do terms explicitly permit AI use? | No explicit AI-use clause in license, PII without consent, PHI without BAA, third-party data with AI-use restrictions. |
| **Does the data cover the domain sufficiently?** | Is there enough data to support the use case? Are critical topics, time periods, languages, user segments, or product lines represented? What is the gap between what exists and what the archetype's Data Prerequisites require? | Critical topics missing, historical data too shallow for trend analysis, single-language corpus for a multilingual use case. |
| **Is the data in a usable format?** | What preprocessing, conversion, or normalization is required to reach ingestion-ready state? For structured data: is the schema documented? For unstructured: are documents in parseable formats (not scanned images, password-protected PDFs)? | No schema documentation, data only in proprietary binary formats, OCR required at scale without pipeline, no API — only manual export. |
| **What is the baseline quality?** | Sample 50–100 representative items and audit for accuracy, completeness, consistency, and recency. Define a minimum acceptable quality floor and assess whether current data meets it. | >10% of sampled items are missing required fields, contradictory, or demonstrably incorrect; no quality baseline exists. |
| **Is the data representative and unbiased?** | Does the data reflect the population, domains, and edge cases the system will encounter in production? Are there known coverage gaps, historical skews, or demographic biases that could propagate into model outputs? | Training/retrieval corpus skewed toward one region, department, or time period; known underrepresentation of key user segments. |

**Decision rule**: If two or more red flags are present, resolve them before proceeding. A high-quality model on poor data produces poor results — data readiness cannot be deferred to a later sprint.

### 2. MEASURE: Assess Risks & Feasibility

- **What is the error tolerance?** Low-stakes draft vs. regulated decision.
- **What is the blast radius of an error?** Incorrect summary vs. incorrect server command.
- **How will you measure quality?** Offline evaluation (accuracy, relevance), online monitoring (latency, drift), user feedback.
- **What are the primary risks?** Refer to "Primary Risks" for your archetype in Part 3.
- **What are operational and resilience risks?** Dependencies, data sources, failure impact.
- **What is organizational readiness?** Skills, tools, processes for deployment and maintenance.

### 3. MANAGE: Implement Controls & Mitigations

- **What oversight model?** Based on Autonomy Level: review, approval, or audit.
- **What technical controls?** Input validation, output filtering, tool access controls, provenance logging.
- **How to handle failures?** Fallback mechanisms, rollback, human handoff, incident response.
- **How to manage costs?** Rate limiting, query caching, model selection strategies.

### 4. GOVERN: Document & Monitor

- **How documented?** Model cards, datasheets, architectural diagrams.
- **What continuous monitoring?** Logging, performance metrics, drift detection, anomaly alerting.
- **What update process?** Change management with re-evaluation, regression testing, stakeholder notification.

---

## Appendix: Agentic Readiness Checklist

Use this to assess organizational readiness by archetype group.

### Foundation (Required for Group A: Content & Knowledge)
- [ ] Model selection strategy defined (customization ladder evaluated; foundation model or fine-tuned variant chosen with evidence — see §1.3 of 04-technical-components.md)
- [ ] Reliable base models selected and deployed
- [ ] Basic prompt engineering practices established
- [ ] Content safety filters configured
- [ ] Basic evaluation pipeline in place
- [ ] **Data readiness assessment completed** for all knowledge domains the system will draw on (see Data Readiness Gate in Part 5 and §5.9.0 of 04-technical-components.md)
- [ ] **Source authority hierarchy defined** — primary, secondary, and tertiary sources classified; ownership assigned per domain
- [ ] **Data quality baseline established** — sample audit completed; minimum acceptable quality floor defined and documented
- [ ] **Data licensing and consent clearance confirmed** — all data sources verified as legally cleared for AI use (retrieval, inference, and training where applicable)

### Capability (Required for Group B: Insight & Decision Intelligence)
- [ ] Tool integration framework operational
- [ ] Data access controls enforced
- [ ] Structured output validation working
- [ ] Feedback collection mechanisms deployed
- [ ] **Semantic layer or data dictionary documented** for all structured data sources the system queries — column/table names meaningful or supplemented by business-readable definitions (see §5.9.5 of 04-technical-components.md)
- [ ] **Data freshness SLA defined and monitored** per knowledge domain and data source — staleness thresholds set, alerts configured
- [ ] **Row-level and feature-level access controls verified** — agent cannot query data beyond the invoking user's permissions

### Autonomy (Required for Group C: Process & Automation)
- [ ] Agent execution framework tested
- [ ] Agent runtime and deployment infrastructure provisioned (hosting pattern selected, session lifecycle managed, compute isolation confirmed — see §4.4 of 04-technical-components.md)
- [ ] Human-in-the-loop workflows designed
- [ ] Full observability and tracing operational
- [ ] State management and recovery proven
- [ ] Multi-agent coordination patterns validated (if T4)
- [ ] **Tool API contracts documented and validated** — schemas, authentication, rate limits, error modes, and idempotency guarantees confirmed in non-production environment before agent deployment
- [ ] **Agent action space explicitly bounded** — written inventory of permitted/prohibited operations enforced at the authorization layer, not only in the prompt
- [ ] **Rollback and compensating transaction capability documented** for every write or state-changing tool invocation the agent can perform

---

## Related Documents

- **[01-overview.md](01-overview.md)** — Start here
- **[03-capability-features.md](03-capability-features.md)** — Layer 2: Features required by each archetype
- **[04-technical-components.md](04-technical-components.md)** — Layer 3: Component catalog
- **[05-component-selection-guide.md](05-component-selection-guide.md)** — How to evaluate components
- **[06-implementation-tiers.md](06-implementation-tiers.md)** — Maturity tiers and stack patterns

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 5.5 | 2026-03-03 | Added Data Readiness Gate to Part 5 MAP phase (go/no-go prerequisite table with 6 questions and red flags). Added Data Prerequisites section to all 13 archetypes in Part 3. Expanded Agentic Readiness Checklist with data readiness items at Foundation, Capability, and Autonomy tiers. Aligned with 04-technical-components.md v5.5 (§5.9.0 Data Readiness Assessment, §5.9.5 Structured & Relational Data Readiness). |
| 5.4 | 2026-03-01 | Updated Agentic Readiness Checklist: added model selection prerequisite to Foundation tier (§1.3) and agent runtime/deployment infrastructure to Autonomy tier (§4.4). Aligned with 04-technical-components.md v5.4. |
| 5.4 | 2026-02-28 | Renamed Group B from "Insight & Decision Support" to "Insight & Decision Intelligence" to acknowledge the full spectrum from advisory to autonomous decision-making. Updated archetype 5 and 6 descriptions accordingly. Added Scope & Boundaries section to 01-overview.md. |
| 5.3 | 2026-02-28 | Added Archetype 13: Conversational Agent. The most widely deployed GenAI use case (customer service, sales, coaching) warranted a dedicated archetype rather than relying on multi-archetype composition. |
| 5.2 | 2026-02-28 | Reordered: Quick Reference promoted to Part 1, Four Architectural Dimensions moved to Part 2 (after archetypes are established). Updated "How to use" instructions accordingly. |
| 5.1 | 2026-02-28 | Merged quick reference (02) and full archetype guide (03) into single document. Adopted v5.0 12-archetype taxonomy throughout. Added quick reference table. Removed taxonomy discrepancy between files. |
| 5.0 | 2026-02-27 | Restructured: added Primary Features per archetype linking to capability features layer. Trimmed sub-case labels to concise Scope sections. Aligned with four-layer framework model. Updated NIST RMF section to reference features. |
| 4.0 | 2026-01-20 | Consolidated v1-v3 into single guide. |
