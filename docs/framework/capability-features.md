# Capability Features: The Bridge Between Use Cases and Components

*Version 5.5. Last Updated: 2026-03-03. Aligned with Framework v5.5.*

!!! tip "The Core Insight"

    Use case archetypes tell you *what job to do*. Technical components tell you *what to build*. Capability Features explain *what functional capabilities the solution must exhibit* — they are the bridge that makes component selection purposeful.


---

## What Are Capability Features?

Capability Features are **reusable, composable functional facets** that describe what a GenAI solution must be able to do. They sit between archetypes and components in the framework:

```
  Archetype (WHAT)           Feature (WHY)              Component (HOW)
  ─────────────────          ──────────────             ─────────────────
  "Grounded Q&A"    ──►  "Contextual Grounding"  ──►  RAG Pipeline,
                          "Citation & Provenance"       Vector Database,
                          "Interactive Refinement"       Output Processing,
                          "Safety & Content Controls"    Context Management,
                                                         Guardrails
```

**Why this matters**: Without features, an architect sees "Grounded Q&A needs RAG" but doesn't understand that it *also* needs citation tracking, interactive refinement, and safety controls — all for different reasons. Features make the rationale explicit and the component list complete.

---

## The 15 Capability Features

### Content & Knowledge Features

| ID | Feature | Description |
|----|---------|-------------|
| **F1** | **Contextual Grounding** | Augmenting the LLM with specific, curated knowledge sources to ensure accuracy, reduce hallucination, and provide domain-relevant responses. |
| **F2** | **Multi-Source Synthesis** | Aggregating, reconciling, and synthesizing information from multiple heterogeneous sources into a coherent, higher-level output (reports, analyses, reviews). |
| **F3** | **Structured Output Generation** | Producing formatted, schema-valid, or constrained outputs — JSON, code, tables, forms, templates — that downstream systems or humans can consume reliably. |
| **F4** | **Interactive Refinement** | Multi-turn dialogue allowing users to clarify intent, iterate on outputs, and progressively improve results through feedback and follow-up. |
| **F5** | **Citation & Provenance** | Tracking, attributing, and surfacing the sources, evidence, and reasoning chain behind generated content so users can verify and trust outputs. |

### Intelligence & Personalization Features

| ID | Feature | Description |
|----|---------|-------------|
| **F6** | **Adaptive Personalization** | Tailoring outputs to the user's context, preferences, history, role, or segment to increase relevance and effectiveness over time. |
| **F7** | **Autonomous Planning & Execution** | Decomposing high-level goals into actionable sub-tasks, executing them with tools, adapting the plan based on observations, and recovering from failures. |
| **F8** | **Tool Orchestration** | Selecting, invoking, and interpreting results from external tools, APIs, databases, and services to access real-time information or take actions. |
| **F9** | **Real-Time Data Access** | Querying live databases, streaming data, APIs, or external services for current, dynamic information — beyond static knowledge bases. |
| **F10** | **Long-Term Memory & Context** | Persisting knowledge, preferences, and interaction history across sessions to provide continuity and learn from past interactions. |

### Control & Operations Features

| ID | Feature | Description |
|----|---------|-------------|
| **F11** | **Human Oversight Gates** | Checkpoints for human review, approval, editing, or correction at critical stages — before irreversible actions, for high-stakes decisions, or when confidence is low. |
| **F12** | **Safety & Content Controls** | Input/output guardrails, content filtering, prompt injection defense, PII/DLP handling, and behavioral boundaries to ensure safe, compliant operation. |
| **F13** | **Continuous Learning & Feedback** | Capturing user signals (ratings, corrections, escalations), evaluating quality with metrics and benchmarks, and enabling improvement loops. |
| **F14** | **Multi-Agent Collaboration** | Coordinating multiple specialized agents — each with distinct roles, tools, and expertise — to achieve complex goals that exceed single-agent capability. |
| **F15** | **Auditability & Compliance** | Comprehensive logging, decision tracing, provenance tracking, and documentation to meet regulatory, legal, and enterprise governance requirements. |

---

## Feature Detail Cards

### F1: Contextual Grounding

| Aspect | Detail |
|--------|--------|
| **What it enables** | Accurate, domain-specific responses grounded in authoritative sources rather than relying solely on the LLM's pre-trained knowledge. |
| **Why it matters** | Reduces hallucination, increases trust, and ensures responses are current and relevant to the organization's specific context. |
| **Key patterns** | Retrieval-Augmented Generation (RAG), chunking & embedding strategies, hybrid search (dense + sparse), query rewriting, re-ranking. |
| **Maturity progression** | **[T1](implementation-tiers.md#implementation-tiers)**: Static context injection → **[T2](implementation-tiers.md#implementation-tiers)**: Basic RAG with vector search → **[T3](implementation-tiers.md#implementation-tiers)**: Hybrid search + re-ranking + agentic retrieval → **[T4](implementation-tiers.md#implementation-tiers)**: Self-correcting retrieval with iterative refinement. |
| **Primary archetypes** | Grounded Q&A (:material-circle:), Research & Synthesis (:material-circle:), Summarization & Extraction (:material-circle:), Recommendation (:material-circle:), Software Dev (:material-circle:), Agentic Task (:material-circle:), Ops Copilot (:material-circle:), Governance (:material-circle:), Conversational Agent (:material-circle:) |
| **Key risks** | Stale knowledge base; retrieval of irrelevant chunks adding noise to context; prompt injection via retrieved content; over-reliance on retrieved context suppressing model reasoning. |
| **Evaluation signals** | Retrieval precision & recall; groundedness rate (% of claims supported by retrieved context); hallucination rate compared to ungrounded baseline. |

### F2: Multi-Source Synthesis

| Aspect | Detail |
|--------|--------|
| **What it enables** | Coherent, analytical artifacts (reports, reviews, analyses) produced by combining information from many disparate sources. |
| **Why it matters** | Real-world decisions require synthesizing multiple perspectives; single-source answers are often incomplete or biased. |
| **Key patterns** | Iterative retrieval and decomposition, outline-first generation, evidence mapping, contradiction detection, source quality evaluation. |
| **Maturity progression** | **[T2](implementation-tiers.md#implementation-tiers)**: Retrieve from multiple docs and summarize → **[T3](implementation-tiers.md#implementation-tiers)**: Structured synthesis with evaluation gates → **[T4](implementation-tiers.md#implementation-tiers)**: Autonomous research agent with iterative search and self-critique. |
| **Primary archetypes** | Research & Synthesis (:material-circle:), Data Interpretation (:material-circle-half-full:), Governance (:material-circle:), Ops Copilot (:material-circle-half-full:) |
| **Key risks** | Source quality bias distorting synthesis; missing counter-evidence; non-reproducible results across runs; contradiction amplification without resolution. |
| **Evaluation signals** | Source coverage breadth; contradiction detection rate; synthesis coherence score (LLM-as-Judge or human); reviewer agreement on accuracy. |

### F3: Structured Output Generation

| Aspect | Detail |
|--------|--------|
| **What it enables** | Outputs that conform to specific schemas, formats, or templates — consumable by downstream systems or structured human workflows. |
| **Why it matters** | Enterprise systems require reliable, parseable outputs. Free-form text can't be programmatically processed or validated. |
| **Key patterns** | JSON Schema constraints, grammar-based decoding, Pydantic/TypeScript validation, code generation with syntax checking, template-based generation. |
| **Maturity progression** | **[T1](implementation-tiers.md#implementation-tiers)**: Basic format instructions → **[T2](implementation-tiers.md#implementation-tiers)**: Schema-constrained output with validation → **[T3](implementation-tiers.md#implementation-tiers)**: Multi-artifact generation with cross-validation → **[T4](implementation-tiers.md#implementation-tiers)**: Complex code/document generation with testing. |
| **Primary archetypes** | Content Generation (:material-circle:), Summarization & Extraction (:material-circle:), Software Dev (:material-circle:), Workflow Automation (:material-circle:), Agentic Task (:material-circle:), Data Interpretation (:material-circle:), Simulation (:material-circle:) |
| **Key risks** | Schema drift (near-valid but invalid output); silent truncation of required fields; over-constrained generation losing semantic meaning; downstream system failures from malformed output. |
| **Evaluation signals** | Schema validation pass rate; field completeness rate; downstream system acceptance rate; repair attempt rate (how often output needs post-hoc correction). |

### F4: Interactive Refinement

| Aspect | Detail |
|--------|--------|
| **What it enables** | Users can guide and improve AI outputs through conversation — clarifying ambiguity, requesting changes, and iterating toward the desired result. |
| **Why it matters** | Complex requests are rarely captured perfectly in a single prompt. Iteration enables precision and user satisfaction. |
| **Key patterns** | Multi-turn conversation management, context window strategies, conversation history compression, reference resolution, topic tracking. |
| **Maturity progression** | **[T1](implementation-tiers.md#implementation-tiers)**: Simple follow-up questions → **[T2](implementation-tiers.md#implementation-tiers)**: Full multi-turn with context carry-over → **[T3](implementation-tiers.md#implementation-tiers)**: Multi-session memory with preference learning → **[T4](implementation-tiers.md#implementation-tiers)**: Proactive clarification and anticipation. |
| **Primary archetypes** | Grounded Q&A (:material-circle:), Content Generation (:material-circle:), Software Dev (:material-circle:), Ops Copilot (:material-circle:), Conversational Agent (:material-circle:), Data Interpretation (:material-circle-half-full:) |
| **Key risks** | Context drift across long conversations; users unable to course-correct effectively; topic bleeding between sessions; context window exhaustion degrading response quality. |
| **Evaluation signals** | Task completion rate; average turns-to-resolution; conversation abandonment rate; user satisfaction (CSAT/NPS). |

### F5: Citation & Provenance

| Aspect | Detail |
|--------|--------|
| **What it enables** | Every claim or generated element can be traced back to its source — documents, data, reasoning steps, or tool outputs. |
| **Why it matters** | Trust requires verifiability. Regulated environments demand traceability. Users need to distinguish known-from-source vs. model-generated. |
| **Key patterns** | Source linking, chunk-level attribution, reference tracking, confidence indicators, "known vs. unknown" signals. |
| **Maturity progression** | **[T1](implementation-tiers.md#implementation-tiers)**: None → **[T2](implementation-tiers.md#implementation-tiers)**: Document-level citations → **[T3](implementation-tiers.md#implementation-tiers)**: Passage-level citations with confidence → **[T4](implementation-tiers.md#implementation-tiers)**: Full provenance chain including reasoning steps. |
| **Primary archetypes** | Grounded Q&A (:material-circle:), Research & Synthesis (:material-circle:), Governance (:material-circle:), Summarization & Extraction (:material-circle:) |
| **Key risks** | Source misattribution (citing wrong document for a claim); hallucinated citations (citing non-existent sources); citation theater (links present but not claim-accurate); provenance gaps in multi-step reasoning. |
| **Evaluation signals** | Citation accuracy rate (% of citations that correctly support the cited claim); % of claims with source attribution; user click-through rate on citations. |

### F6: Adaptive Personalization

| Aspect | Detail |
|--------|--------|
| **What it enables** | Responses, recommendations, and experiences tailored to the individual user's role, preferences, history, and context. |
| **Why it matters** | One-size-fits-all responses reduce relevance and engagement. Personalization drives adoption and value. |
| **Key patterns** | User/context modeling, preference capture, session and persistent memory, consent management, collaborative filtering. |
| **Maturity progression** | **[T1](implementation-tiers.md#implementation-tiers)**: Role-based system prompts → **[T2](implementation-tiers.md#implementation-tiers)**: Session-level preference tracking → **[T3](implementation-tiers.md#implementation-tiers)**: Persistent user profiles with memory → **[T4](implementation-tiers.md#implementation-tiers)**: Adaptive learning with preference evolution. |
| **Primary archetypes** | Recommendation & Personalization (:material-circle:), Conversational Agent (:material-circle:), Content Generation (:material-circle:), Grounded Q&A (:material-circle-outline:), Agentic Task (:material-circle-half-full:) |
| **Key risks** | Filter bubbles (over-personalization narrowing user exposure); privacy violations from over-collection of preference data; cold-start problem for new users; preference drift without re-learning. |
| **Evaluation signals** | Recommendation acceptance rate; user preference alignment score; output diversity over time; consent and opt-out compliance rate. |

### F7: Autonomous Planning & Execution

| Aspect | Detail |
|--------|--------|
| **What it enables** | The system can break down complex goals, create execution plans, act on them using tools, and adapt when things don't go as expected. |
| **Why it matters** | Many valuable tasks require multi-step reasoning and action — beyond what a single LLM call can achieve. |
| **Key patterns** | ReAct loops, Plan-and-Execute, Reflexion, task decomposition, sub-goal generation, re-planning on failure, state management. |
| **Maturity progression** | **[T2](implementation-tiers.md#implementation-tiers)**: Simple chained steps → **[T3](implementation-tiers.md#implementation-tiers)**: Conditional workflows with tool use → **[T4](implementation-tiers.md#implementation-tiers)**: Full autonomous planning with reflection and recovery. |
| **Primary archetypes** | Agentic Task Automation (:material-circle:), Ops Copilot (:material-circle:), Research & Synthesis (:material-circle:), Simulation (:material-circle:), Software Dev (:material-circle-half-full:) |
| **Key risks** | Goal misinterpretation leading to an incorrect plan; plan looping (infinite retry on failure); unintended side effects from autonomous actions; cost overruns from runaway execution. |
| **Evaluation signals** | Task completion rate; plan adherence rate; human intervention rate; average steps-to-completion; error recovery success rate. |

### F8: Tool Orchestration

| Aspect | Detail |
|--------|--------|
| **What it enables** | The system can invoke external tools — APIs, databases, code interpreters, web search — to gather information or take actions beyond the LLM's inherent capabilities. |
| **Why it matters** | LLMs alone cannot access real-time data, execute code, or interact with enterprise systems. Tools extend the system's reach. |
| **Key patterns** | Function calling, MCP (Model Context Protocol), tool descriptions and schemas, automatic tool selection, multi-tool orchestration, sandboxed code execution. |
| **Maturity progression** | **[T1](implementation-tiers.md#implementation-tiers)**: None → **[T2](implementation-tiers.md#implementation-tiers)**: Single predetermined tool → **[T3](implementation-tiers.md#implementation-tiers)**: Multi-tool with selection logic → **[T4](implementation-tiers.md#implementation-tiers)**: Dynamic tool discovery and composition. |
| **Primary archetypes** | Data Interpretation (:material-circle:), Agentic Task (:material-circle:), Ops Copilot (:material-circle:), Software Dev (:material-circle:), Workflow Automation (:material-circle:), Research (:material-circle:) |
| **Key risks** | Hallucinated tool parameters; API rate limit exhaustion; cascading failures across tool chain; prompt injection via tool outputs; unauthorized tool invocation. |
| **Evaluation signals** | Tool call success rate; tool selection accuracy (correct tool chosen for the task); average latency per tool invocation; injection attempt detection rate. |

### F9: Real-Time Data Access

| Aspect | Detail |
|--------|--------|
| **What it enables** | The system queries live databases, APIs, dashboards, or data streams for current information rather than relying on static knowledge bases. |
| **Why it matters** | Many enterprise decisions require fresh data — current metrics, live statuses, real-time events — that static RAG cannot provide. |
| **Key patterns** | SQL/database query tools, API integration, streaming data consumption, data freshness validation, access control enforcement. |
| **Maturity progression** | **[T2](implementation-tiers.md#implementation-tiers)**: Single data source queries → **[T3](implementation-tiers.md#implementation-tiers)**: Multi-source queries with joins/correlation → **[T4](implementation-tiers.md#implementation-tiers)**: Streaming data with anomaly detection and alerting. |
| **Primary archetypes** | Data Interpretation (:material-circle:), Ops Copilot (:material-circle:), Agentic Task (:material-circle:), Workflow Automation (:material-circle-half-full:) |
| **Key risks** | Stale data from aggressive caching; access control gaps (querying restricted data); data fidelity issues (type coercion, null handling); over-broad queries with cost or security implications. |
| **Evaluation signals** | Data freshness (age of data returned); query success rate; unauthorized access attempt rate; data quality error rate per query. |

### F10: Long-Term Memory & Context

| Aspect | Detail |
|--------|--------|
| **What it enables** | The system remembers past interactions, learned preferences, accumulated knowledge, and task history across sessions. |
| **Why it matters** | Without memory, every interaction starts from zero. Memory enables continuity, learning, and increasingly effective assistance. |
| **Key patterns** | Episodic memory (events), semantic memory (facts), procedural memory (workflows), memory consolidation, forgetting/pruning, vector-based and structured storage. |
| **Maturity progression** | **[T1](implementation-tiers.md#implementation-tiers)**: Stateless → **[T2](implementation-tiers.md#implementation-tiers)**: Session memory (conversation buffer) → **[T3](implementation-tiers.md#implementation-tiers)**: Persistent memory across sessions → **[T4](implementation-tiers.md#implementation-tiers)**: Episodic + semantic memory with consolidation. |
| **Primary archetypes** | Recommendation (:material-circle:), Agentic Task (:material-circle:), Ops Copilot (:material-circle:), Research & Synthesis (:material-circle:), Conversational Agent (:material-circle:) |
| **Key risks** | Privacy leakage (surfacing one user's stored data to another); memory poisoning from adversarial input stored as fact; unbounded memory growth; GDPR/right-to-erasure compliance gaps. |
| **Evaluation signals** | Memory retrieval relevance score; session continuity rate (returning users pick up without re-explaining context); false recall rate (incorrect memories retrieved); consent compliance rate. |

### F11: Human Oversight Gates

| Aspect | Detail |
|--------|--------|
| **What it enables** | Humans can review, approve, edit, or reject AI actions at critical decision points before consequences are irreversible. |
| **Why it matters** | Autonomous AI introduces risk. Human oversight is a graduated control plane — essential for trust, safety, and regulatory compliance. |
| **Key patterns** | Approval workflows, confidence-based escalation, risk-based escalation, review queues, override mechanisms, phased autonomy. |
| **Maturity progression** | **[T1](implementation-tiers.md#implementation-tiers)**: Optional review → **[T2](implementation-tiers.md#implementation-tiers)**: Approval before send/publish → **[T3](implementation-tiers.md#implementation-tiers)**: HITL checkpoints at each critical stage → **[T4](implementation-tiers.md#implementation-tiers)**: Graduated autonomy with audit. |
| **Primary archetypes** | Workflow Automation (:material-circle:), Agentic Task (:material-circle:), Governance (:material-circle:), Ops Copilot (:material-circle:), Software Dev (:material-circle:), Conversational Agent (:material-circle:), Summarization (:material-circle-half-full:) |
| **Key risks** | Alert fatigue causing rubber-stamp approvals without genuine review; approval bottlenecks slowing time-critical automation; oversight bypass in edge cases; unclear escalation ownership. |
| **Evaluation signals** | Human review completion rate; override/rejection rate (how often humans reject AI actions); time-to-approve per gate; escalation routing accuracy. |

### F12: Safety & Content Controls

| Aspect | Detail |
|--------|--------|
| **What it enables** | Protection against harmful outputs, prompt injection, data leakage, and policy violations across all user-facing AI systems. |
| **Why it matters** | Enterprise AI must be safe by default. A single harmful output, data leak, or injection attack can cause reputational, legal, and financial damage. |
| **Key patterns** | Input guardrails (injection detection, PII masking), output guardrails (toxicity filtering, factuality checking), content classification, DLP integration, behavioral boundaries. |
| **Maturity progression** | **[T1](implementation-tiers.md#implementation-tiers)**: Provider content filters → **[T2](implementation-tiers.md#implementation-tiers)**: Custom filters + PII detection → **[T3](implementation-tiers.md#implementation-tiers)**: Multi-layer filtering + injection defense → **[T4](implementation-tiers.md#implementation-tiers)**: Adaptive moderation with adversarial defense. |
| **Primary archetypes** | All user-facing archetypes (:material-circle:) |
| **Key risks** | False positives blocking legitimate content; false negatives passing harmful content; adversarial bypass of guardrails; brittleness against novel attack vectors not in training distribution. |
| **Evaluation signals** | True/false positive rate on harmful content detection; prompt injection detection rate; policy violation rate in production; red-team bypass rate. |

### F13: Continuous Learning & Feedback

| Aspect | Detail |
|--------|--------|
| **What it enables** | The system improves over time by capturing user feedback, measuring quality, detecting drift, and iterating on prompts, retrieval, and models. |
| **Why it matters** | GenAI systems are not "set and forget." Without feedback loops, quality degrades silently. Enterprises that invest in active monitoring see 40%+ reduction in critical errors within months. |
| **Key patterns** | User feedback collection (thumbs up/down, corrections), evaluation datasets, LLM-as-Judge, A/B testing, drift detection, prompt versioning, quality metrics dashboards. |
| **Maturity progression** | **[T1](implementation-tiers.md#implementation-tiers)**: Manual review → **[T2](implementation-tiers.md#implementation-tiers)**: User feedback + basic metrics → **[T3](implementation-tiers.md#implementation-tiers)**: Continuous evaluation + A/B testing → **[T4](implementation-tiers.md#implementation-tiers)**: Automated quality gates + drift detection + auto-retraining triggers. |
| **Primary archetypes** | All production archetypes (:material-circle:) |
| **Key risks** | Feedback poisoning from adversarial or low-effort ratings; silent quality drift without detection triggers; biased feedback loops (power users over-represented); feedback fatigue reducing signal quality. |
| **Evaluation signals** | Feedback collection rate (% of interactions rated); quality metric trend over time (improving/stable/degrading); drift detection alert rate; A/B test win rate on prompt/retrieval improvements. |

### F14: Multi-Agent Collaboration

| Aspect | Detail |
|--------|--------|
| **What it enables** | Multiple specialized AI agents — each with distinct roles, tools, and expertise — coordinate to achieve goals beyond single-agent capability. |
| **Why it matters** | Complex enterprise tasks (e.g., "upgrade the payment service, migrate the database, and update documentation") require diverse skills working in concert. |
| **Key patterns** | Supervisor pattern, hierarchical delegation, peer-to-peer, swarm, shared state/blackboard, role-based specialization, A2A protocol. |
| **Maturity progression** | **[T3](implementation-tiers.md#implementation-tiers)**: Handoff between 2 specialized agents → **[T4](implementation-tiers.md#implementation-tiers)**: Full multi-agent orchestration with supervisor, dynamic delegation, and shared memory. |
| **Primary archetypes** | Agentic Task Automation (:material-circle:), Software Dev advanced (:material-circle-half-full:), Research advanced (:material-circle-half-full:) |
| **Key risks** | Agent coordination failures (message loss, deadlock); cascading errors across agent network; unbounded delegation (runaway sub-tasks consuming cost/time); shared state corruption; inter-agent trust violations. |
| **Evaluation signals** | Cross-agent task completion rate; inter-agent communication error rate; end-to-end latency vs. single-agent baseline; human intervention rate for coordination failures. |

### F15: Auditability & Compliance

| Aspect | Detail |
|--------|--------|
| **What it enables** | Complete traceability of inputs, outputs, decisions, reasoning, and actions for regulatory, legal, and enterprise governance requirements. |
| **Why it matters** | Regulated industries (healthcare, finance, government) require auditable AI. Even in unregulated contexts, auditability builds trust and enables accountability. |
| **Key patterns** | Immutable audit logging, reasoning traces, decision audit trails, model version tracking, data lineage, compliance dashboards, policy-as-code. |
| **Maturity progression** | **[T1](implementation-tiers.md#implementation-tiers)**: Basic request logs → **[T2](implementation-tiers.md#implementation-tiers)**: User action + output logging → **[T3](implementation-tiers.md#implementation-tiers)**: Full audit trail with reasoning traces → **[T4](implementation-tiers.md#implementation-tiers)**: Real-time compliance monitoring + SIEM integration. |
| **Primary archetypes** | Governance (:material-circle:), Workflow Automation (:material-circle:), Agentic Task (:material-circle:), Ops Copilot (:material-circle:) |
| **Key risks** | Incomplete audit trails (logging gaps at system boundaries); unstructured logs resistant to querying; log tampering; excessive log volume without indexing strategy; regulatory gap between what is logged and what is required. |
| **Evaluation signals** | Audit trail completeness rate (% of decisions with full trace); log query response time; compliance gap detection rate; time-to-produce audit evidence on demand. |

---

## Matrix A: Archetypes → Capability Features

This matrix answers: **"Which capability features does each archetype require?"**

Use this to identify your feature requirements. Start with your archetype (rows), read across to find required features (columns).

**Legend**: :material-circle: Required | :material-circle-half-full: Often Needed | :material-circle-outline: Optional | − Not Applicable

| | F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8 | F9 | F10 | F11 | F12 | F13 | F14 | F15 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **Archetype** | **Context Grounding** | **Multi-Source Synthesis** | **Structured Output** | **Interactive Refinement** | **Citation & Provenance** | **Adaptive Personal.** | **Autonomous Plan** | **Tool Orchestration** | **Real-Time Data** | **Long-Term Memory** | **Human Oversight** | **Safety Controls** | **Learning & Feedback** | **Multi-Agent** | **Audit & Compliance** |
| **Group A: Content & Knowledge** | | | | | | | | | | | | | | | |
| 1. Content Generation | :material-circle-outline: | − | :material-circle: | :material-circle: | :material-circle-outline: | :material-circle: | − | − | − | :material-circle-outline: | :material-circle-outline: | :material-circle: | :material-circle: | − | :material-circle-outline: |
| 2. Summarization & Extraction | :material-circle: | :material-circle-half-full: | :material-circle: | :material-circle-outline: | :material-circle: | − | − | − | − | − | :material-circle-half-full: | :material-circle: | :material-circle: | − | :material-circle-half-full: |
| 3. Grounded Q&A | :material-circle: | :material-circle-outline: | :material-circle-half-full: | :material-circle: | :material-circle: | :material-circle-outline: | − | :material-circle-outline: | :material-circle-outline: | :material-circle-half-full: | :material-circle-outline: | :material-circle: | :material-circle: | − | :material-circle-half-full: |
| 4. Research & Synthesis | :material-circle: | :material-circle: | :material-circle: | :material-circle-outline: | :material-circle: | − | :material-circle: | :material-circle: | :material-circle-half-full: | :material-circle: | :material-circle-half-full: | :material-circle: | :material-circle: | :material-circle-half-full: | :material-circle-half-full: |
| **Group B: Insight & Decision** | | | | | | | | | | | | | | | |
| 5. Data Interpretation | :material-circle-outline: | :material-circle-half-full: | :material-circle: | :material-circle-half-full: | :material-circle-half-full: | − | :material-circle-outline: | :material-circle: | :material-circle: | :material-circle-outline: | :material-circle-half-full: | :material-circle: | :material-circle: | − | :material-circle-half-full: |
| 6. Recommendation | :material-circle: | :material-circle-outline: | :material-circle-half-full: | :material-circle-half-full: | :material-circle-outline: | :material-circle: | − | :material-circle-outline: | :material-circle-outline: | :material-circle: | :material-circle-outline: | :material-circle: | :material-circle: | − | :material-circle-half-full: |
| 7. Simulation & Synthetic Data | :material-circle-outline: | :material-circle-outline: | :material-circle: | :material-circle-outline: | − | − | :material-circle: | :material-circle-half-full: | − | − | :material-circle-half-full: | :material-circle: | :material-circle: | :material-circle-outline: | :material-circle-half-full: |
| **Group C: Process & Automation** | | | | | | | | | | | | | | | |
| 8. Software Dev Acceleration | :material-circle: | :material-circle-half-full: | :material-circle: | :material-circle: | :material-circle-half-full: | :material-circle-outline: | :material-circle-half-full: | :material-circle: | :material-circle-outline: | :material-circle-half-full: | :material-circle: | :material-circle: | :material-circle: | :material-circle-half-full: | :material-circle-half-full: |
| 9. Structured Workflow Auto. | :material-circle-half-full: | − | :material-circle: | :material-circle-outline: | :material-circle-outline: | − | :material-circle-half-full: | :material-circle: | :material-circle-half-full: | :material-circle-half-full: | :material-circle: | :material-circle: | :material-circle: | − | :material-circle: |
| 10. Agentic Task Automation | :material-circle: | :material-circle-half-full: | :material-circle: | :material-circle-half-full: | :material-circle-half-full: | :material-circle-half-full: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle: |
| 11. Ops & Monitoring Copilot | :material-circle: | :material-circle-half-full: | :material-circle: | :material-circle: | :material-circle-half-full: | − | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle-half-full: | :material-circle: |
| 12. AI Governance & Assurance | :material-circle: | :material-circle: | :material-circle: | :material-circle-outline: | :material-circle: | − | :material-circle-outline: | :material-circle-half-full: | :material-circle-outline: | :material-circle-half-full: | :material-circle: | :material-circle: | :material-circle: | :material-circle-outline: | :material-circle: |
| 13. Conversational Agent | :material-circle: | :material-circle-outline: | :material-circle-half-full: | :material-circle: | :material-circle-outline: | :material-circle: | − | :material-circle-half-full: | :material-circle-outline: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | − | :material-circle-half-full: |

### How to Read Matrix A

**Example**: You're building a **Grounded Q&A** system (Archetype 3):
- **Required (:material-circle:)**: Contextual Grounding (F1), Citation & Provenance (F5), Interactive Refinement (F4), Safety Controls (F12), Learning & Feedback (F13)
- **Often Needed (:material-circle-half-full:)**: Long-Term Memory (F10)
- **Optional (:material-circle-outline:)**: Multi-Source Synthesis (F2), Adaptive Personalization (F6), Tool Orchestration (F8), Real-Time Data (F9), Human Oversight (F11), Audit & Compliance (F15)

This tells you: *A Grounded Q&A system must at minimum be grounded in curated knowledge, cite its sources, support multi-turn refinement, have safety guardrails, and include feedback mechanisms.*

### When :material-circle-half-full: Becomes :material-circle:: Decision Guidance

For :material-circle-half-full: (Often Needed) features, evaluate against your **Four Architectural Dimensions** to determine if they become required for your specific implementation:

| Feature | Upgrade to :material-circle: when… |
|---------|---------------------|
| **F1 (Contextual Grounding)** | Grounding Strategy = Curated (RAG) or Live (Tool Use) — i.e., anytime domain accuracy matters |
| **F5 (Citation & Provenance)** | F1 is :material-circle: — grounding without citation is incomplete; users cannot verify what they cannot trace |
| **F10 (Long-Term Memory)** | Interaction Model = Conversational *and* users are recurring — every returning user expects continuity |
| **F11 (Human Oversight)** | Autonomy Level = Semi-Autonomous or Fully Autonomous — and any action is irreversible |
| **F15 (Auditability)** | Governance Posture includes regulatory compliance (healthcare, finance, government) |
| **F14 (Multi-Agent)** | A single agent cannot complete the task within context limits or requires parallel specialist workstreams |
| **F9 (Real-Time Data)** | Decisions require data fresher than your knowledge base update cycle (typically sub-hour for ops, sub-day for analytics) |

---

## Matrix B: Capability Features → Technical Components

This matrix answers: **"What technical components enable each capability feature?"**

Use this after Matrix A. For each feature you identified as required, read across to find the components that enable it.

**Legend**: :material-circle: Primary enabler | :material-circle-half-full: Supporting role | :material-circle-outline: Optional/context-dependent | − Not involved

*Note: Column names align with the primary capability component categories in [04-technical-components.md](technical-components.md). **"Observability & Infrastructure"** combines §5.3 Infrastructure & §5.4 Observability. The expanded Operational Excellence catalog (§5.5 Cost Management through §5.11 Incident Response — see 04-technical-components.md §5) covers production prerequisites that are cross-cutting requirements rather than feature-specific enablers, so they are not represented as columns here. Two additional capability components are also not columns in this matrix — see the note after the matrix.*

| | Foundation Models (§1.1) | Prompting (§1.2) | RAG & Retrieval (§2.1) | Output Processing (§2.2) | Context Management (§3.1) | Memory Systems (§3.2) | Reasoning & Planning (§3.3) | Tool Use & Functions (§3.4) | Agentic Architectures (§4.1) | Workflow Orchestration (§4.2) | HITL Patterns (§4.3) | Safety & Guardrails (§5.1) | Evaluation & Testing (§5.2) | Observability & Infrastructure (§5.3–5.4) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **F1: Contextual Grounding** | :material-circle: | :material-circle: | :material-circle: | :material-circle-outline: | :material-circle: | − | :material-circle-outline: | − | − | − | − | :material-circle-outline: | :material-circle: | :material-circle-half-full: |
| **F2: Multi-Source Synthesis** | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle-half-full: | :material-circle: | :material-circle-half-full: | :material-circle-half-full: | :material-circle-half-full: | − | − | :material-circle: | :material-circle-half-full: |
| **F3: Structured Output** | :material-circle: | :material-circle: | − | :material-circle: | − | − | − | − | − | :material-circle-outline: | − | :material-circle-half-full: | :material-circle: | :material-circle-outline: |
| **F4: Interactive Refinement** | :material-circle: | :material-circle: | :material-circle-outline: | :material-circle-outline: | :material-circle: | :material-circle: | − | − | − | − | :material-circle-outline: | :material-circle-half-full: | :material-circle-half-full: | :material-circle-half-full: |
| **F5: Citation & Provenance** | :material-circle-outline: | :material-circle-half-full: | :material-circle: | :material-circle: | :material-circle-outline: | − | − | − | − | − | − | − | :material-circle: | :material-circle: |
| **F6: Adaptive Personalization** | :material-circle: | :material-circle: | :material-circle-half-full: | :material-circle-outline: | :material-circle: | :material-circle: | :material-circle-outline: | − | − | − | − | :material-circle-half-full: | :material-circle: | :material-circle-half-full: |
| **F7: Autonomous Planning** | :material-circle: | :material-circle: | :material-circle-outline: | :material-circle-outline: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle-half-full: | :material-circle-half-full: | :material-circle: | :material-circle: |
| **F8: Tool Orchestration** | :material-circle: | :material-circle-half-full: | − | :material-circle-half-full: | :material-circle-half-full: | :material-circle-outline: | :material-circle-half-full: | :material-circle: | :material-circle-half-full: | :material-circle-half-full: | − | :material-circle-half-full: | :material-circle: | :material-circle: |
| **F9: Real-Time Data Access** | :material-circle: | :material-circle-outline: | :material-circle-outline: | :material-circle-half-full: | :material-circle-half-full: | − | − | :material-circle: | :material-circle-outline: | :material-circle-half-full: | − | :material-circle-half-full: | :material-circle: | :material-circle: |
| **F10: Long-Term Memory** | :material-circle-outline: | − | :material-circle-half-full: | − | :material-circle: | :material-circle: | − | − | :material-circle-outline: | − | − | :material-circle-outline: | :material-circle-half-full: | :material-circle-half-full: |
| **F11: Human Oversight Gates** | − | − | − | − | :material-circle-outline: | − | − | − | − | :material-circle: | :material-circle: | :material-circle-half-full: | :material-circle-half-full: | :material-circle: |
| **F12: Safety & Content Controls** | :material-circle-outline: | :material-circle-half-full: | − | :material-circle-half-full: | − | − | − | − | − | − | :material-circle-half-full: | :material-circle: | :material-circle: | :material-circle: |
| **F13: Learning & Feedback** | − | − | − | − | − | :material-circle-half-full: | − | − | − | − | :material-circle-half-full: | − | :material-circle: | :material-circle: |
| **F14: Multi-Agent Collaboration** | :material-circle: | :material-circle: | :material-circle-outline: | :material-circle-outline: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle: | :material-circle-half-full: | :material-circle: | :material-circle: | :material-circle: |
| **F15: Auditability & Compliance** | − | − | − | − | − | − | − | − | − | :material-circle-half-full: | :material-circle: | :material-circle: | :material-circle: | :material-circle: |

### Components Not Represented as Matrix B Columns

Two capability components in [04-technical-components.md](technical-components.md) are structural prerequisites rather than feature-specific runtime enablers, so they are not columns in Matrix B:

| Component | Section | Relationship to Features |
|---|---|---|
| **Model Selection & Customization Strategy** | §1.3 | Underpins *all* features — model capability and adaptation approach (the customization ladder) set the performance ceiling for every feature in the stack. Evaluate before finalising any other component choice. |
| **Agent Runtime & Deployment** | §4.4 | Production infrastructure prerequisite for **F7** (Autonomous Planning) and **F14** (Multi-Agent Collaboration). Any [T3](implementation-tiers.md#implementation-tiers)/[T4](implementation-tiers.md#implementation-tiers) deployment that includes these features requires a hosting pattern, session lifecycle management, and compute isolation. |

Additionally, the **Operational Excellence** components §5.5–§5.11 (Cost Management, Resilience, Performance, DevOps, Data Governance, Identity & Authorization, Incident Response) are production requirements that apply across all features — not feature-specific enablers. See §5 of [04-technical-components.md](technical-components.md) for the full OE catalog.

---

### How to Read Matrix B

**Example**: You need **Contextual Grounding (F1)** for your Grounded Q&A system:
- **Primary enablers (:material-circle:)**: Foundation Models, Prompting, RAG/Retrieval, Context Management, Evaluation & Testing
- **Supporting (:material-circle-half-full:)**: Observability & Infrastructure
- **Optional (:material-circle-outline:)**: Output Processing, Reasoning & Planning, Safety & Guardrails

This tells you: *Contextual Grounding primarily requires a solid RAG pipeline backed by good prompting, context management, and evaluation — with observability to monitor retrieval quality.*

---

## Tracing the Full Chain: Worked Example

### Scenario: Enterprise Knowledge Base Assistant

**Step 1: Identify Archetype** → Grounded Q&A (Archetype 3)

**Step 2: Matrix A — Identify Required Features**

| Feature | Requirement | Rationale |
|---------|-------------|-----------|
| F1: Contextual Grounding | :material-circle: Required | Core capability — must answer from internal knowledge |
| F4: Interactive Refinement | :material-circle: Required | Users need multi-turn conversation to refine answers |
| F5: Citation & Provenance | :material-circle: Required | Users must verify answers against source documents |
| F12: Safety & Content Controls | :material-circle: Required | Enterprise environment, must filter harmful content |
| F13: Learning & Feedback | :material-circle: Required | Must improve quality over time |
| F10: Long-Term Memory | :material-circle-half-full: Often Needed | Useful for returning users, but not day-one critical |
| F15: Auditability | :material-circle-half-full: Context-dependent | Required if regulated industry, optional otherwise |

**Step 3: Matrix B — Identify Required Components (for :material-circle: features)**

| Component | Needed For | Priority |
|-----------|-----------|----------|
| Foundation Models | F1, F4, F12 | Essential |
| Prompting | F1, F4, F5 | Essential |
| RAG & Retrieval | F1, F5 | Essential |
| Output Processing | F5 | Essential (for citations) |
| Context Management | F1, F4 | Essential |
| Memory Systems | F4 | Important (conversation history) |
| Safety & Guardrails | F12 | Essential |
| Evaluation & Testing | F1, F5, F12, F13 | Essential |
| Observability & Infrastructure | F1, F5, F12, F13 | Essential |

**Step 4: Apply Component Selection Guide** → Evaluate each component using the Seven Questions.

**Result**: A clear, justified component list with rationale for every inclusion.

---

## Matrix C: Archetypes → Technical Components (Quick Lookup)

This matrix answers: **"What components does my archetype need?"** — collapsing the two-step Matrix A × Matrix B lookup into a single reference.

Derived by tracing each archetype's required (:material-circle:) features through Matrix B's primary (:material-circle:) enablers. **Universal components** (Foundation Models, Prompting, Safety & Guardrails, Evaluation & Testing, Observability & Infrastructure) are required by every archetype and omitted from the table to highlight differentiating components.

| # | Archetype | Differentiating Components (beyond universals) | Min Tier |
|---|-----------|----------------------------------------------|----------|
| **Group A: Content & Knowledge** | | | |
| 1 | Content Generation | Output Processing · Context Management · Memory Systems | [T1](implementation-tiers.md#implementation-tiers) |
| 2 | Summarization & Extraction | RAG & Retrieval · Output Processing · Context Management | [T1](implementation-tiers.md#implementation-tiers) |
| 3 | Grounded Q&A | RAG & Retrieval · Output Processing · Context Management · Memory Systems | [T2](implementation-tiers.md#implementation-tiers) |
| 4 | Research & Synthesis | RAG & Retrieval · Output Processing · Context Management · Memory Systems · Reasoning & Planning · Tool Use · Agentic Architectures · Workflow Orchestration | [T3](implementation-tiers.md#implementation-tiers) |
| **Group B: Insight & Decision** | | | |
| 5 | Data Interpretation | Output Processing · Tool Use & Functions | [T2](implementation-tiers.md#implementation-tiers) |
| 6 | Recommendation | RAG & Retrieval · Context Management · Memory Systems | [T2](implementation-tiers.md#implementation-tiers) |
| 7 | Simulation & Synthetic Data | Output Processing · Context Management · Memory Systems · Reasoning & Planning · Tool Use · Agentic Architectures · Workflow Orchestration | [T2](implementation-tiers.md#implementation-tiers) |
| **Group C: Process & Automation** | | | |
| 8 | Software Dev Acceleration | RAG & Retrieval · Output Processing · Context Management · Memory Systems · Tool Use · Workflow Orchestration · HITL Patterns | [T2](implementation-tiers.md#implementation-tiers) |
| 9 | Structured Workflow Automation | Output Processing · Tool Use · Workflow Orchestration · HITL Patterns | [T2](implementation-tiers.md#implementation-tiers) |
| 10 | Agentic Task Automation | RAG & Retrieval · Output Processing · Context Management · Memory Systems · Reasoning & Planning · Tool Use · Agentic Architectures · Workflow Orchestration · HITL Patterns | [T3](implementation-tiers.md#implementation-tiers) |
| 11 | Ops & Monitoring Copilot | RAG & Retrieval · Output Processing · Context Management · Memory Systems · Reasoning & Planning · Tool Use · Agentic Architectures · Workflow Orchestration · HITL Patterns | [T3](implementation-tiers.md#implementation-tiers) |
| 12 | AI Governance & Assurance | RAG & Retrieval · Output Processing · Context Management · Reasoning & Planning · Workflow Orchestration · HITL Patterns | [T2](implementation-tiers.md#implementation-tiers) |
| 13 | Conversational Agent | RAG & Retrieval · Context Management · Memory Systems · Workflow Orchestration · HITL Patterns | [T2](implementation-tiers.md#implementation-tiers) |

**Universal components** (required by all archetypes): Foundation Models (§1.1) · Prompting (§1.2) · Safety & Guardrails (§5.1) · Evaluation & Testing (§5.2) · Observability & Infrastructure (§5.3-5.4). Additionally, Model Selection Strategy (§1.3) and Data Readiness Assessment (§5.9.0) are structural prerequisites for all archetypes.

**How to use**: Find your archetype, note the differentiating components, add the universals, then evaluate each component using the Seven Questions in [05-component-selection-guide.md](component-selection-guide.md). For :material-circle-half-full: (Often Needed) features not reflected here, trace them manually through Matrix A → Matrix B.

---

## Feature Affinity Map

Some features naturally cluster together. Understanding these affinities helps plan phased delivery:

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                        FEATURE AFFINITY CLUSTERS                            │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  KNOWLEDGE CLUSTER                 ACTION CLUSTER                           │
│  ┌─────────────────────┐           ┌─────────────────────┐                  │
│  │ F1  Context Ground  │           │ F7  Autonomous Plan │                  │
│  │ F2  Multi-Source     │           │ F8  Tool Orchestr.  │                  │
│  │ F5  Citation & Prov  │           │ F9  Real-Time Data  │                  │
│  │ F4  Interactive Ref  │           │ F14 Multi-Agent     │                  │
│  └────────┬────────────┘           └────────┬────────────┘                  │
│           │                                  │                              │
│           └──────────┐        ┌──────────────┘                              │
│                      ▼        ▼                                             │
│              ┌─────────────────────┐                                        │
│              │  FOUNDATION CLUSTER │                                        │
│              │ F3  Structured Out  │                                        │
│              │ F12 Safety Controls │                                        │
│              │ F13 Learning & FB   │                                        │
│              │ F15 Audit & Compl   │                                        │
│              └─────────────────────┘                                        │
│                      ▲        ▲                                             │
│           ┌──────────┘        └──────────────┐                              │
│           │                                  │                              │
│  ┌────────┴────────────┐           ┌────────┴────────────┐                  │
│  │ PERSONALIZATION      │           │ OVERSIGHT            │                  │
│  │ CLUSTER              │           │ CLUSTER              │                  │
│  │ F6  Personalization  │           │ F11 Human Oversight  │                  │
│  │ F10 Long-Term Memory │           │ F15 Audit & Compl   │                  │
│  └─────────────────────┘           └─────────────────────┘                  │
│                                                                             │
│  PHASED DELIVERY SUGGESTION:                                                │
│  Phase 1: Foundation Cluster (always start here)                            │
│  Phase 2: Knowledge Cluster OR Action Cluster (archetype-dependent)         │
│  Phase 3: Personalization Cluster + Oversight Cluster (as needed)           │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

---

## Feature Dependencies

Some features are only effective when combined with others. Selecting a feature without its dependencies produces an incomplete or dysfunctional implementation.

| Feature | Depends On | Reason |
|---------|-----------|--------|
| **F5 (Citation & Provenance)** | F1 (Contextual Grounding) | You cannot cite sources without retrieving them — F5 without F1 produces citations with nothing to attribute. |
| **F7 (Autonomous Planning)** | F8 (Tool Orchestration) | Planning without execution tools has no real-world effect — plans need actions. |
| **F9 (Real-Time Data Access)** | F8 (Tool Orchestration) | Live data access requires tool invocation to query external systems. |
| **F14 (Multi-Agent Collaboration)** | F7 (Autonomous Planning) + F8 (Tool Orchestration) | Agent coordination requires each agent to plan and act; without these, "agents" are just parallel LLM calls. |
| **F6 (Adaptive Personalization)** | F10 (Long-Term Memory) | Personalization beyond a single session requires cross-session persistence; without it, every session starts cold. |
| **F11 (Human Oversight Gates)** | F15 (Auditability & Compliance) | Oversight decisions must be logged to be meaningful — approvals without records are unauditable. |
| **F13 (Learning & Feedback)** | F15 (Auditability & Compliance) | Feedback loops require logging infrastructure to capture signals and track improvement over time. |

**Implication**: When Matrix A marks a feature as :material-circle: or :material-circle-half-full: for your archetype, trace its dependencies above and include those features too — even if they initially appear optional.

---

## Anti-Patterns to Avoid

| Anti-Pattern | Problem | Remedy |
|---|---|---|
| **Feature bloat** | Selecting all 15 features "just in case," over-engineering from day one. | Start with the :material-circle: features for your archetype. Add :material-circle-half-full: features only when an Architectural Dimension or context clearly demands it. |
| **Missing the foundation** | Selecting F7/F8/F14 (Action Cluster) without first establishing F12 (Safety) and F11 (Oversight). | The Foundation Cluster (F12, F13, F15) is never optional in production. Instrument it from the start, regardless of archetype. |
| **Citation theater** | Marking F5 as required but only implementing document-level links, not claim-level attribution. | Be explicit about your F5 maturity tier. [T2](implementation-tiers.md#implementation-tiers) (document links) is better than nothing, but don't present it as full provenance. |
| **Personalization without consent** | Implementing F6 (Adaptive Personalization) without a consent management and data retention strategy. | Pair F6 with explicit privacy controls. Review data minimization requirements before building user profiles. |
| **Planning without guardrails** | Implementing F7 (Autonomous Planning) without F11 (Human Oversight) for irreversible actions. | Every autonomous plan that can cause irreversible real-world effects must have at least one human checkpoint. |
| **Feedback without action** | Implementing F13 feedback collection but never closing the loop — signals are collected but no one reviews or acts on them. | Assign ownership to feedback review. Set an explicit cadence for quality reviews and triggered improvement actions. |
| **Audit as afterthought** | Treating F15 (Auditability) as a Phase 3 concern, only to discover retrofitting audit trails requires architectural changes. | Instrument logging from day one, even at [T1](implementation-tiers.md#implementation-tiers). Basic request/response logs are cheap; retroactive tracing is expensive. |
| **Dependency blindness** | Selecting F14 (Multi-Agent) without ensuring F7 and F8 are in place at each agent level. | Before selecting a feature, check the Feature Dependencies table above and include all prerequisite features. |

---

## Related Documents

- **[01-overview.md](index.md)** — Start here for navigation
- **[02-use-case-archetypes.md](use-case-archetypes.md)** — Layer 1: The 13 archetypes
- **[04-technical-components.md](technical-components.md)** — Layer 3: Component deep-dive
- **[05-component-selection-guide.md](component-selection-guide.md)** — How to evaluate components
- **[06-implementation-tiers.md](implementation-tiers.md)** — Maturity tiers and stack patterns

---

??? note "Version History"

    | Version | Date | Changes |
    |---------|------|---------|
    | 5.5 | 2026-03-03 | Aligned version numbering with Framework v5.5. Added Matrix C: Archetypes → Technical Components (pre-computed lookup collapsing Matrix A × Matrix B for all 13 archetypes, with universal components factored out). |
    | 1.2 | 2026-03-01 | Updated Matrix B footnote to acknowledge expanded OE catalog (§5.5–§5.11). Added "Components Not Represented as Matrix B Columns" section covering §1.3 Model Selection & Customization Strategy and §4.4 Agent Runtime & Deployment. Aligned with 04-technical-components.md v5.4. |
    | 1.1 | 2026-03-01 | Reconciled Matrix A with 02-use-case-archetypes.md (upgraded F3/F4/F6 for Content Generation, F1 for Summarization & Recommendation, F7 for Simulation). Updated feature card Primary Archetypes accordingly. Renamed Matrix B columns to align with 04-technical-components.md. Added Key Risks and Evaluation Signals to all 15 feature cards. Added :material-circle-half-full: Decision Guidance section. Added Feature Dependencies section. Added Anti-Patterns section. |
    | 1.0 | 2026-02-27 | Initial creation. 15 capability features defined. Matrix A (Archetypes→Features) and Matrix B (Features→Components) created. Feature detail cards, worked example, and affinity map added. |

