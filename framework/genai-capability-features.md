# Capability Features: The Bridge Between Use Cases and Components

*Aligned with GenAI & Agentic Architecture Framework v5.0. Last Updated: 2026-02-27*

> **The Core Insight**: Use case archetypes tell you *what job to do*. Technical components tell you *what to build*. Capability Features explain *what functional capabilities the solution must exhibit* — they are the bridge that makes component selection purposeful.

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
| **Maturity progression** | **T1**: Static context injection → **T2**: Basic RAG with vector search → **T3**: Hybrid search + re-ranking + agentic retrieval → **T4**: Self-correcting retrieval with iterative refinement. |
| **Primary archetypes** | Grounded Q&A (●), Research & Synthesis (●), Software Dev (●), Agentic Task (●), Ops Copilot (●), Governance (●) |

### F2: Multi-Source Synthesis

| Aspect | Detail |
|--------|--------|
| **What it enables** | Coherent, analytical artifacts (reports, reviews, analyses) produced by combining information from many disparate sources. |
| **Why it matters** | Real-world decisions require synthesizing multiple perspectives; single-source answers are often incomplete or biased. |
| **Key patterns** | Iterative retrieval and decomposition, outline-first generation, evidence mapping, contradiction detection, source quality evaluation. |
| **Maturity progression** | **T2**: Retrieve from multiple docs and summarize → **T3**: Structured synthesis with evaluation gates → **T4**: Autonomous research agent with iterative search and self-critique. |
| **Primary archetypes** | Research & Synthesis (●), Data Interpretation (◐), Governance (●), Ops Copilot (◐) |

### F3: Structured Output Generation

| Aspect | Detail |
|--------|--------|
| **What it enables** | Outputs that conform to specific schemas, formats, or templates — consumable by downstream systems or structured human workflows. |
| **Why it matters** | Enterprise systems require reliable, parseable outputs. Free-form text can't be programmatically processed or validated. |
| **Key patterns** | JSON Schema constraints, grammar-based decoding, Pydantic/TypeScript validation, code generation with syntax checking, template-based generation. |
| **Maturity progression** | **T1**: Basic format instructions → **T2**: Schema-constrained output with validation → **T3**: Multi-artifact generation with cross-validation → **T4**: Complex code/document generation with testing. |
| **Primary archetypes** | Summarization & Extraction (●), Software Dev (●), Workflow Automation (●), Agentic Task (●), Data Interpretation (●), Simulation (●) |

### F4: Interactive Refinement

| Aspect | Detail |
|--------|--------|
| **What it enables** | Users can guide and improve AI outputs through conversation — clarifying ambiguity, requesting changes, and iterating toward the desired result. |
| **Why it matters** | Complex requests are rarely captured perfectly in a single prompt. Iteration enables precision and user satisfaction. |
| **Key patterns** | Multi-turn conversation management, context window strategies, conversation history compression, reference resolution, topic tracking. |
| **Maturity progression** | **T1**: Simple follow-up questions → **T2**: Full multi-turn with context carry-over → **T3**: Multi-session memory with preference learning → **T4**: Proactive clarification and anticipation. |
| **Primary archetypes** | Grounded Q&A (●), Software Dev (●), Ops Copilot (●), Content Generation (◐), Data Interpretation (◐) |

### F5: Citation & Provenance

| Aspect | Detail |
|--------|--------|
| **What it enables** | Every claim or generated element can be traced back to its source — documents, data, reasoning steps, or tool outputs. |
| **Why it matters** | Trust requires verifiability. Regulated environments demand traceability. Users need to distinguish known-from-source vs. model-generated. |
| **Key patterns** | Source linking, chunk-level attribution, reference tracking, confidence indicators, "known vs. unknown" signals. |
| **Maturity progression** | **T1**: None → **T2**: Document-level citations → **T3**: Passage-level citations with confidence → **T4**: Full provenance chain including reasoning steps. |
| **Primary archetypes** | Grounded Q&A (●), Research & Synthesis (●), Governance (●), Summarization & Extraction (●) |

### F6: Adaptive Personalization

| Aspect | Detail |
|--------|--------|
| **What it enables** | Responses, recommendations, and experiences tailored to the individual user's role, preferences, history, and context. |
| **Why it matters** | One-size-fits-all responses reduce relevance and engagement. Personalization drives adoption and value. |
| **Key patterns** | User/context modeling, preference capture, session and persistent memory, consent management, collaborative filtering. |
| **Maturity progression** | **T1**: Role-based system prompts → **T2**: Session-level preference tracking → **T3**: Persistent user profiles with memory → **T4**: Adaptive learning with preference evolution. |
| **Primary archetypes** | Recommendation & Personalization (●), Content Generation (○), Grounded Q&A (○), Agentic Task (◐) |

### F7: Autonomous Planning & Execution

| Aspect | Detail |
|--------|--------|
| **What it enables** | The system can break down complex goals, create execution plans, act on them using tools, and adapt when things don't go as expected. |
| **Why it matters** | Many valuable tasks require multi-step reasoning and action — beyond what a single LLM call can achieve. |
| **Key patterns** | ReAct loops, Plan-and-Execute, Reflexion, task decomposition, sub-goal generation, re-planning on failure, state management. |
| **Maturity progression** | **T2**: Simple chained steps → **T3**: Conditional workflows with tool use → **T4**: Full autonomous planning with reflection and recovery. |
| **Primary archetypes** | Agentic Task Automation (●), Ops Copilot (●), Research & Synthesis (●), Software Dev (◐), Simulation (◐) |

### F8: Tool Orchestration

| Aspect | Detail |
|--------|--------|
| **What it enables** | The system can invoke external tools — APIs, databases, code interpreters, web search — to gather information or take actions beyond the LLM's inherent capabilities. |
| **Why it matters** | LLMs alone cannot access real-time data, execute code, or interact with enterprise systems. Tools extend the system's reach. |
| **Key patterns** | Function calling, MCP (Model Context Protocol), tool descriptions and schemas, automatic tool selection, multi-tool orchestration, sandboxed code execution. |
| **Maturity progression** | **T1**: None → **T2**: Single predetermined tool → **T3**: Multi-tool with selection logic → **T4**: Dynamic tool discovery and composition. |
| **Primary archetypes** | Data Interpretation (●), Agentic Task (●), Ops Copilot (●), Software Dev (●), Workflow Automation (●), Research (●) |

### F9: Real-Time Data Access

| Aspect | Detail |
|--------|--------|
| **What it enables** | The system queries live databases, APIs, dashboards, or data streams for current information rather than relying on static knowledge bases. |
| **Why it matters** | Many enterprise decisions require fresh data — current metrics, live statuses, real-time events — that static RAG cannot provide. |
| **Key patterns** | SQL/database query tools, API integration, streaming data consumption, data freshness validation, access control enforcement. |
| **Maturity progression** | **T2**: Single data source queries → **T3**: Multi-source queries with joins/correlation → **T4**: Streaming data with anomaly detection and alerting. |
| **Primary archetypes** | Data Interpretation (●), Ops Copilot (●), Agentic Task (●), Workflow Automation (◐) |

### F10: Long-Term Memory & Context

| Aspect | Detail |
|--------|--------|
| **What it enables** | The system remembers past interactions, learned preferences, accumulated knowledge, and task history across sessions. |
| **Why it matters** | Without memory, every interaction starts from zero. Memory enables continuity, learning, and increasingly effective assistance. |
| **Key patterns** | Episodic memory (events), semantic memory (facts), procedural memory (workflows), memory consolidation, forgetting/pruning, vector-based and structured storage. |
| **Maturity progression** | **T1**: Stateless → **T2**: Session memory (conversation buffer) → **T3**: Persistent memory across sessions → **T4**: Episodic + semantic memory with consolidation. |
| **Primary archetypes** | Recommendation (●), Agentic Task (●), Ops Copilot (●), Research & Synthesis (●) |

### F11: Human Oversight Gates

| Aspect | Detail |
|--------|--------|
| **What it enables** | Humans can review, approve, edit, or reject AI actions at critical decision points before consequences are irreversible. |
| **Why it matters** | Autonomous AI introduces risk. Human oversight is a graduated control plane — essential for trust, safety, and regulatory compliance. |
| **Key patterns** | Approval workflows, confidence-based escalation, risk-based escalation, review queues, override mechanisms, phased autonomy. |
| **Maturity progression** | **T1**: Optional review → **T2**: Approval before send/publish → **T3**: HITL checkpoints at each critical stage → **T4**: Graduated autonomy with audit. |
| **Primary archetypes** | Workflow Automation (●), Agentic Task (●), Governance (●), Ops Copilot (●), Software Dev (●), Summarization (◐) |

### F12: Safety & Content Controls

| Aspect | Detail |
|--------|--------|
| **What it enables** | Protection against harmful outputs, prompt injection, data leakage, and policy violations across all user-facing AI systems. |
| **Why it matters** | Enterprise AI must be safe by default. A single harmful output, data leak, or injection attack can cause reputational, legal, and financial damage. |
| **Key patterns** | Input guardrails (injection detection, PII masking), output guardrails (toxicity filtering, factuality checking), content classification, DLP integration, behavioral boundaries. |
| **Maturity progression** | **T1**: Provider content filters → **T2**: Custom filters + PII detection → **T3**: Multi-layer filtering + injection defense → **T4**: Adaptive moderation with adversarial defense. |
| **Primary archetypes** | All user-facing archetypes (●) |

### F13: Continuous Learning & Feedback

| Aspect | Detail |
|--------|--------|
| **What it enables** | The system improves over time by capturing user feedback, measuring quality, detecting drift, and iterating on prompts, retrieval, and models. |
| **Why it matters** | GenAI systems are not "set and forget." Without feedback loops, quality degrades silently. Enterprises that invest in active monitoring see 40%+ reduction in critical errors within months. |
| **Key patterns** | User feedback collection (thumbs up/down, corrections), evaluation datasets, LLM-as-Judge, A/B testing, drift detection, prompt versioning, quality metrics dashboards. |
| **Maturity progression** | **T1**: Manual review → **T2**: User feedback + basic metrics → **T3**: Continuous evaluation + A/B testing → **T4**: Automated quality gates + drift detection + auto-retraining triggers. |
| **Primary archetypes** | All production archetypes (●) |

### F14: Multi-Agent Collaboration

| Aspect | Detail |
|--------|--------|
| **What it enables** | Multiple specialized AI agents — each with distinct roles, tools, and expertise — coordinate to achieve goals beyond single-agent capability. |
| **Why it matters** | Complex enterprise tasks (e.g., "upgrade the payment service, migrate the database, and update documentation") require diverse skills working in concert. |
| **Key patterns** | Supervisor pattern, hierarchical delegation, peer-to-peer, swarm, shared state/blackboard, role-based specialization, A2A protocol. |
| **Maturity progression** | **T3**: Handoff between 2 specialized agents → **T4**: Full multi-agent orchestration with supervisor, dynamic delegation, and shared memory. |
| **Primary archetypes** | Agentic Task Automation (●), Software Dev advanced (◐), Research advanced (◐) |

### F15: Auditability & Compliance

| Aspect | Detail |
|--------|--------|
| **What it enables** | Complete traceability of inputs, outputs, decisions, reasoning, and actions for regulatory, legal, and enterprise governance requirements. |
| **Why it matters** | Regulated industries (healthcare, finance, government) require auditable AI. Even in unregulated contexts, auditability builds trust and enables accountability. |
| **Key patterns** | Immutable audit logging, reasoning traces, decision audit trails, model version tracking, data lineage, compliance dashboards, policy-as-code. |
| **Maturity progression** | **T1**: Basic request logs → **T2**: User action + output logging → **T3**: Full audit trail with reasoning traces → **T4**: Real-time compliance monitoring + SIEM integration. |
| **Primary archetypes** | Governance (●), Workflow Automation (●), Agentic Task (●), Ops Copilot (●) |

---

## Matrix A: Archetypes → Capability Features

This matrix answers: **"Which capability features does each archetype require?"**

Use this to identify your feature requirements. Start with your archetype (rows), read across to find required features (columns).

**Legend**: ● Required | ◐ Often Needed | ○ Optional | − Not Applicable

| | F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8 | F9 | F10 | F11 | F12 | F13 | F14 | F15 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **Archetype** | **Context Grounding** | **Multi-Source Synthesis** | **Structured Output** | **Interactive Refinement** | **Citation & Provenance** | **Adaptive Personal.** | **Autonomous Plan** | **Tool Orchestration** | **Real-Time Data** | **Long-Term Memory** | **Human Oversight** | **Safety Controls** | **Learning & Feedback** | **Multi-Agent** | **Audit & Compliance** |
| **Group A: Content & Knowledge** | | | | | | | | | | | | | | | |
| 1. Content Generation | ○ | − | ◐ | ◐ | ○ | ○ | − | − | − | ○ | ○ | ● | ● | − | ○ |
| 2. Summarization & Extraction | ◐ | ◐ | ● | ○ | ● | − | − | − | − | − | ◐ | ● | ● | − | ◐ |
| 3. Grounded Q&A | ● | ○ | ◐ | ● | ● | ○ | − | ○ | ○ | ◐ | ○ | ● | ● | − | ◐ |
| 4. Research & Synthesis | ● | ● | ● | ○ | ● | − | ● | ● | ◐ | ● | ◐ | ● | ● | ◐ | ◐ |
| **Group B: Insight & Decision** | | | | | | | | | | | | | | | |
| 5. Data Interpretation | ○ | ◐ | ● | ◐ | ◐ | − | ○ | ● | ● | ○ | ◐ | ● | ● | − | ◐ |
| 6. Recommendation | ◐ | ○ | ◐ | ◐ | ○ | ● | − | ○ | ○ | ● | ○ | ● | ● | − | ◐ |
| 7. Simulation & Synthetic Data | ○ | ○ | ● | ○ | − | − | ◐ | ◐ | − | − | ◐ | ● | ● | ○ | ◐ |
| **Group C: Process & Automation** | | | | | | | | | | | | | | | |
| 8. Software Dev Acceleration | ● | ◐ | ● | ● | ◐ | ○ | ◐ | ● | ○ | ◐ | ● | ● | ● | ◐ | ◐ |
| 9. Structured Workflow Auto. | ◐ | − | ● | ○ | ○ | − | ◐ | ● | ◐ | ◐ | ● | ● | ● | − | ● |
| 10. Agentic Task Automation | ● | ◐ | ● | ◐ | ◐ | ◐ | ● | ● | ● | ● | ● | ● | ● | ● | ● |
| 11. Ops & Monitoring Copilot | ● | ◐ | ● | ● | ◐ | − | ● | ● | ● | ● | ● | ● | ● | ◐ | ● |
| 12. AI Governance & Assurance | ● | ● | ● | ○ | ● | − | ○ | ◐ | ○ | ◐ | ● | ● | ● | ○ | ● |

### How to Read Matrix A

**Example**: You're building a **Grounded Q&A** system (Archetype 3):
- **Required (●)**: Contextual Grounding (F1), Citation & Provenance (F5), Interactive Refinement (F4), Safety Controls (F12), Learning & Feedback (F13)
- **Often Needed (◐)**: Long-Term Memory (F10)
- **Optional (○)**: Multi-Source Synthesis (F2), Adaptive Personalization (F6), Tool Orchestration (F8), Real-Time Data (F9), Human Oversight (F11), Audit & Compliance (F15)

This tells you: *A Grounded Q&A system must at minimum be grounded in curated knowledge, cite its sources, support multi-turn refinement, have safety guardrails, and include feedback mechanisms.*

---

## Matrix B: Capability Features → Technical Components

This matrix answers: **"What technical components enable each capability feature?"**

Use this after Matrix A. For each feature you identified as required, read across to find the components that enable it.

**Legend**: ● Primary enabler | ◐ Supporting role | ○ Optional/context-dependent | − Not involved

| | Foundation Models | Prompting | RAG / Retrieval | Output Processing | Context Mgmt | Memory Systems | Reasoning & Planning | Tools & Functions | Agents | Workflow Orchestration | HITL Patterns | Guardrails & Safety | Evaluation & Testing | Observability & Infra |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **F1: Contextual Grounding** | ● | ● | ● | ○ | ● | − | ○ | − | − | − | − | ○ | ● | ◐ |
| **F2: Multi-Source Synthesis** | ● | ● | ● | ● | ● | ◐ | ● | ◐ | ◐ | ◐ | − | − | ● | ◐ |
| **F3: Structured Output** | ● | ● | − | ● | − | − | − | − | − | ○ | − | ◐ | ● | ○ |
| **F4: Interactive Refinement** | ● | ● | ○ | ○ | ● | ● | − | − | − | − | ○ | ◐ | ◐ | ◐ |
| **F5: Citation & Provenance** | ○ | ◐ | ● | ● | ○ | − | − | − | − | − | − | − | ● | ● |
| **F6: Adaptive Personalization** | ● | ● | ◐ | ○ | ● | ● | ○ | − | − | − | − | ◐ | ● | ◐ |
| **F7: Autonomous Planning** | ● | ● | ○ | ○ | ● | ● | ● | ● | ● | ● | ◐ | ◐ | ● | ● |
| **F8: Tool Orchestration** | ● | ◐ | − | ◐ | ◐ | ○ | ◐ | ● | ◐ | ◐ | − | ◐ | ● | ● |
| **F9: Real-Time Data Access** | ● | ○ | ○ | ◐ | ◐ | − | − | ● | ○ | ◐ | − | ◐ | ● | ● |
| **F10: Long-Term Memory** | ○ | − | ◐ | − | ● | ● | − | − | ○ | − | − | ○ | ◐ | ◐ |
| **F11: Human Oversight Gates** | − | − | − | − | ○ | − | − | − | − | ● | ● | ◐ | ◐ | ● |
| **F12: Safety & Content Controls** | ○ | ◐ | − | ◐ | − | − | − | − | − | − | ◐ | ● | ● | ● |
| **F13: Learning & Feedback** | − | − | − | − | − | ◐ | − | − | − | − | ◐ | − | ● | ● |
| **F14: Multi-Agent Collaboration** | ● | ● | ○ | ○ | ● | ● | ● | ● | ● | ● | ◐ | ● | ● | ● |
| **F15: Auditability & Compliance** | − | − | − | − | − | − | − | − | − | ◐ | ● | ● | ● | ● |

### How to Read Matrix B

**Example**: You need **Contextual Grounding (F1)** for your Grounded Q&A system:
- **Primary enablers (●)**: Foundation Models, Prompting, RAG/Retrieval, Context Management, Evaluation & Testing
- **Supporting (◐)**: Observability & Infrastructure
- **Optional (○)**: Output Processing, Reasoning & Planning, Guardrails & Safety

This tells you: *Contextual Grounding primarily requires a solid RAG pipeline backed by good prompting, context management, and evaluation — with observability to monitor retrieval quality.*

---

## Tracing the Full Chain: Worked Example

### Scenario: Enterprise Knowledge Base Assistant

**Step 1: Identify Archetype** → Grounded Q&A (Archetype 3)

**Step 2: Matrix A — Identify Required Features**

| Feature | Requirement | Rationale |
|---------|-------------|-----------|
| F1: Contextual Grounding | ● Required | Core capability — must answer from internal knowledge |
| F4: Interactive Refinement | ● Required | Users need multi-turn conversation to refine answers |
| F5: Citation & Provenance | ● Required | Users must verify answers against source documents |
| F12: Safety & Content Controls | ● Required | Enterprise environment, must filter harmful content |
| F13: Learning & Feedback | ● Required | Must improve quality over time |
| F10: Long-Term Memory | ◐ Often Needed | Useful for returning users, but not day-one critical |
| F15: Auditability | ◐ Context-dependent | Required if regulated industry, optional otherwise |

**Step 3: Matrix B — Identify Required Components (for ● features)**

| Component | Needed For | Priority |
|-----------|-----------|----------|
| Foundation Models | F1, F4, F12 | Essential |
| Prompting | F1, F4, F5 | Essential |
| RAG / Retrieval | F1, F5 | Essential |
| Output Processing | F5 | Essential (for citations) |
| Context Management | F1, F4 | Essential |
| Memory Systems | F4 | Important (conversation history) |
| Guardrails & Safety | F12 | Essential |
| Evaluation & Testing | F1, F5, F12, F13 | Essential |
| Observability & Infra | F1, F5, F12, F13 | Essential |

**Step 4: Apply Component Selection Guide** → Evaluate each component using the Seven Questions.

**Result**: A clear, justified component list with rationale for every inclusion.

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

## Related Documents

- **[framework-overview.md](framework-overview.md)** — Start here for navigation
- **[genai-use-case-archetypes.md](genai-use-case-archetypes.md)** — Layer 1: The 12 archetypes
- **[genai-technical-components.md](genai-technical-components.md)** — Layer 3: Component deep-dive
- **[genai-component-selection-guide.md](genai-component-selection-guide.md)** — How to evaluate components
- **[genai-usecase-component-mapping.md](genai-usecase-component-mapping.md)** — Maturity tiers and stack patterns

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-02-27 | Initial creation. 15 capability features defined. Matrix A (Archetypes→Features) and Matrix B (Features→Components) created. Feature detail cards, worked example, and affinity map added. |
