# Generative AI & Agentic Use Case Archetypes

*Version 5.0. Last Updated: 2026-02-27*

This document defines the 12 use case archetypes that form Layer 1 of the GenAI & Agentic Architecture Framework. Each archetype represents a distinct job-to-be-done — the core value a GenAI solution delivers, independent of its interaction style or implementation complexity.

**How to use this document:**
1. Identify which archetype(s) best describe your use case — many real solutions combine more than one.
2. If multiple archetypes are involved, see **Part 2.5: Archetype Composition** for patterns and design rules.
3. Note the Four Architectural Dimensions for your context.
4. Use the **Primary Features** listed for each archetype (or their union, for composites) to navigate to [genai-capability-features.md](genai-capability-features.md) (Layer 2).
5. Apply the Use Case Selection Framework (Part 3) for risk-aware design.

---

## Part 1: The Four Architectural Dimensions

A use case is not just its core function — it is the combination of that function with these four cross-cutting characteristics. Each dimension is a design choice that shapes the architecture.

| Dimension | Description | Levels |
|-----------|-------------|--------|
| **1. Interaction Model** | How users and systems interact. Defines the UX and API surface. | **One-shot**: Stateless request-response.<br>**Conversational**: Multi-turn dialogue with clarification and refinement.<br>**Proactive**: System-initiated based on triggers or observations.<br>**API-driven**: Programmatic interface consumed by other systems. |
| **2. Autonomy Level** | The degree of independent action permitted. A critical control plane. | **Assistive** (HITL for Execution): AI suggests, human executes.<br>**Semi-Autonomous** (HITL for Approval): AI acts within bounds, human approves.<br>**Fully Autonomous** (HITL for Audit): AI executes end-to-end, human audits. |
| **3. Grounding Strategy** | How the system ensures factual accuracy and relevance. | **Ungrounded**: Model's pre-trained knowledge only.<br>**Curated Grounding (RAG)**: Augmented with a specific knowledge base.<br>**Live Grounding (Tool Use)**: Real-time data via tools, APIs, databases. |
| **4. Governance Posture** | Required level of risk management, compliance, and oversight. | A set of constraints driven by the domain:<br>- Data handling (PII, PHI, sensitive data)<br>- Auditability (logging depth, traceability)<br>- Safety & compliance (filters, regulations, standards) |

---

## Part 2: The 12 Use Case Archetypes

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

---

### Group B: Insight & Decision Support

*Focus: Interpreting data and informing human decisions.*

---

#### 5. Data Interpretation & Analytics

**Description**: Explain trends, anomalies, and insights from structured data (dashboards, databases, BI tools) in natural language.

**Typical Outputs**: Narrative explanations of KPI changes, plain-language anomaly summaries, answers to data questions.

**Scope**:
- Data interpretation — explaining patterns, anomalies, and trends
- Report and dashboard narration — converting charts and metrics into narratives

**Primary Features**: F3 (Structured Output) · F8 (Tool Orchestration) · F9 (Real-Time Data Access) · F12 (Safety Controls) · F13 (Learning & Feedback)

**Common Patterns**: Tool use for data querying (SQL, Python), code execution sandboxes, constrained generation for data fidelity.

**Primary Risks**: Confident-but-wrong explanations (spurious correlations), data access control gaps, misinterpretation of user intent.

---

#### 6. Recommendation & Personalization

**Description**: Tailor content, workflows, or experiences to a user, segment, or context to increase relevance or effectiveness.

**Typical Outputs**: Personalized content, next-best-action suggestions, adaptive learning plans, prioritized task lists.

**Scope**:
- Content personalization — adapting for specific audiences, contexts, or preferences
- Recommendation generation — actionable suggestions from analysis
- Learning and skill development — personalized tutoring and adaptive experiences

**Primary Features**: F6 (Adaptive Personalization) · F10 (Long-Term Memory) · F1 (Contextual Grounding) · F12 (Safety Controls) · F13 (Learning & Feedback)

**Common Patterns**: User/context modeling, preference capture, session and persistent memory, consent management for data use.

**Primary Risks**: Privacy violations, filter bubbles, unfair outcomes, over-personalization, data minimization failures.

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

---

#### 11. Operations & Monitoring Copilot

**Description**: Assist human operators by monitoring signals, diagnosing issues, and suggesting or taking controlled remediation actions.

**Typical Outputs**: Incident summaries, root-cause hypotheses, remediation playbooks, status communications.

**Scope**:
- Proactive system monitoring — identifying issues and taking corrective action or escalating

**Primary Features**: F1 (Contextual Grounding) · F7 (Autonomous Planning) · F8 (Tool Orchestration) · F9 (Real-Time Data) · F10 (Long-Term Memory) · F11 (Human Oversight) · F15 (Auditability) · F12 (Safety Controls) · F13 (Learning & Feedback)

**Common Patterns**: Integrations with observability tools (Datadog, Splunk), runbooks-as-code, strict permissions, detailed audit logs.

**Primary Risks**: Incorrect remediation causing further outages, alert fatigue amplification, permission creep, poor auditability.

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

---

## Part 2.5: Archetype Composition

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

Use **Matrix A** in [genai-capability-features.md](genai-capability-features.md) to build this merged profile, then trace through **Matrix B** and the **Features × Tiers** matrix in [genai-usecase-component-mapping.md](genai-usecase-component-mapping.md) as usual.

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

### Anti-Patterns

| Anti-Pattern | Problem | Remedy |
|--------------|---------|--------|
| **Mega-archetype** | Treating the entire composition as a single archetype, ignoring internal boundaries. | Decompose into distinct stages with clear contracts. |
| **Lowest-common-denominator tier** | Designing the composite at the simplest stage's tier, under-engineering the complex stages. | Tier to the *highest* participant; apply tier-appropriate controls to each stage. |
| **Missing cross-stage evaluation** | Each stage passes its own tests but the end-to-end output is poor. | Add integration-level evaluation metrics alongside per-stage metrics. |
| **Governance gap at the seam** | Data classification or access controls change between stages but nobody noticed. | Inherit the strictest posture; audit data flow at every handoff. |
| **Unbounded delegation** | Nested composition where the outer agent can invoke an unlimited number of inner archetypes without budget or depth limits. | Set explicit sub-task budgets (max calls, max tokens, max depth) and require human checkpoints. |

---

## Part 3: Use Case Selection Framework (NIST RMF Aligned)

Use this framework to guide design and risk management, moving from a high-level concept to a well-defined, governable system.

### 1. MAP: Define Context & Requirements

- **What is the primary archetype?** Select from the 12 above.
- **Is this a composite solution?** If it chains, blends, or nests multiple archetypes, apply the composition rules in Part 2.5 — union the features, tier to the highest participant, and define interface contracts.
- **What are the four architectural dimensions?** Define Interaction Model, Autonomy Level, Grounding Strategy, and Governance Posture.
- **What capability features are required?** Use Matrix A in [genai-capability-features.md](genai-capability-features.md) (for composites, use the merged feature set).
- **Who are the stakeholders?** End-users, operators, beneficiaries, impacted parties.
- **What is the expected benefit?** Efficiency gains, new capability, or risk reduction.
- **What are functional and performance requirements?** Success criteria, accuracy, latency, throughput.
- **What is the estimated TCO?** Development, data, training, inference, and human oversight.

### 2. MEASURE: Assess Risks & Feasibility

- **What is the error tolerance?** Low-stakes draft vs. regulated decision.
- **What is the blast radius of an error?** Incorrect summary vs. incorrect server command.
- **How will you measure quality?** Offline evaluation (accuracy, relevance), online monitoring (latency, drift), user feedback.
- **What are the primary risks?** Refer to "Primary Risks" for your archetype.
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
- [ ] Reliable base models selected and deployed
- [ ] Basic prompt engineering practices established
- [ ] Content safety filters configured
- [ ] Basic evaluation pipeline in place

### Capability (Required for Group B: Insight & Decision)
- [ ] Tool integration framework operational
- [ ] Data access controls enforced
- [ ] Structured output validation working
- [ ] Feedback collection mechanisms deployed

### Autonomy (Required for Group C: Process & Automation)
- [ ] Agent execution framework tested
- [ ] Human-in-the-loop workflows designed
- [ ] Full observability and tracing operational
- [ ] State management and recovery proven
- [ ] Multi-agent coordination patterns validated (if T4)

---

## Related Documents

- **[framework-overview.md](framework-overview.md)** — Start here
- **[use-case-archetypes-summary.md](use-case-archetypes-summary.md)** — Quick reference table
- **[genai-capability-features.md](genai-capability-features.md)** — Layer 2: Features required by each archetype
- **[genai-technical-components.md](genai-technical-components.md)** — Layer 3: Component catalog
- **[genai-component-selection-guide.md](genai-component-selection-guide.md)** — How to evaluate components

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 5.0 | 2026-02-27 | Restructured: added Primary Features per archetype linking to capability features layer. Trimmed sub-case labels to concise Scope sections. Aligned with four-layer framework model. Updated NIST RMF section to reference features. |
| 4.0 | 2026-01-20 | Consolidated v1-v3 into single guide. |
