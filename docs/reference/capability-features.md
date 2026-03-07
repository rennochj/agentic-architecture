# GenAI Capability Features

*15 features across 3 groups. The bridge between archetypes (what) and components (how). All production deployments implicitly require **F12 Safety Controls** and **F13 Learning & Feedback**.*

---

| Group | ID | Feature | What It Enables | Key Patterns | Primary Archetypes |
|-------|----|---------|-----------------|--------------|-------------------|
| **Content & Knowledge** | F1 | **Contextual Grounding** | Accurate, domain-specific responses from authoritative sources | RAG, hybrid search, re-ranking | Grounded Q&A · Research · Summarization · Recommendation · Ops · Software Dev · Governance · Conversational |
| | F2 | **Multi-Source Synthesis** | Coherent analytical artifacts from many disparate sources | Outline-first generation, contradiction detection | Research & Synthesis · Governance |
| | F3 | **Structured Output Generation** | Schema-valid, parseable outputs for downstream systems | JSON Schema, grammar decoding, Pydantic validation | Content Generation · Summarization · Software Dev · Workflow · Agentic · Data · Simulation |
| | F4 | **Interactive Refinement** | Multi-turn iteration toward the desired result | Context management, history compression, reference resolution | Grounded Q&A · Content Generation · Software Dev · Conversational · Ops |
| | F5 | **Citation & Provenance** | Every claim traceable to its source | Source linking, chunk-level attribution, confidence indicators | Grounded Q&A · Research · Summarization · Governance |
| **Intelligence & Personalization** | F6 | **Adaptive Personalization** | Outputs tailored to user role, preferences, and history | User modeling, preference capture, persistent memory | Content Generation · Recommendation · Conversational |
| | F7 | **Autonomous Planning & Execution** | Decompose goals, execute with tools, adapt on failure | ReAct, Plan-and-Execute, Reflexion, re-planning | Agentic Task · Ops Copilot · Research · Simulation |
| | F8 | **Tool Orchestration** | Invoke APIs, databases, and code interpreters | Function calling, MCP, tool schemas, multi-tool orchestration | Data · Agentic · Ops · Software Dev · Workflow · Research |
| | F9 | **Real-Time Data Access** | Query live systems for current information | SQL tools, API integration, streaming data, freshness validation | Data Interpretation · Ops Copilot · Agentic Task |
| | F10 | **Long-Term Memory & Context** | Persist knowledge and history across sessions | Episodic/semantic/procedural memory, consolidation, pruning | Recommendation · Agentic · Ops · Research · Conversational |
| **Control & Operations** | F11 | **Human Oversight Gates** | Human review and approval at critical decision points | Approval workflows, confidence escalation, risk-based routing | Workflow · Agentic · Governance · Ops · Software Dev · Conversational |
| | F12 | **Safety & Content Controls** | Guard against harmful outputs, injection, and data leakage | Input/output guardrails, PII masking, DLP, behavioral limits | All user-facing archetypes |
| | F13 | **Continuous Learning & Feedback** | Improve quality over time from signals and metrics | User ratings, LLM-as-Judge, A/B testing, drift detection | All production archetypes |
| | F14 | **Multi-Agent Collaboration** | Coordinate specialized agents for goals beyond single-agent scope | Supervisor pattern, hierarchical delegation, A2A protocol | Agentic Task Automation |
| | F15 | **Auditability & Compliance** | Full traceability of decisions for governance and regulation | Immutable audit logs, reasoning traces, data lineage | Governance · Workflow · Agentic · Ops |

---

## Using the Matrices (in 03-capability-features.md)

**Matrix A** (Archetypes → Features): Start with your archetype row. ● = Required, ◐ = Often Needed, ○ = Optional.

**Matrix B** (Features → Components): For each required feature, read across to find the technical components that enable it.

**When ◐ becomes ●**: F1 when Grounding Strategy ≠ Ungrounded · F5 when F1 is ● · F10 when returning users + Conversational model · F11 when Autonomy = Semi/Fully Autonomous · F14 when single-agent scope is insufficient for the task · F15 when regulatory compliance is required · F9 when data must be fresher than the knowledge base update cycle.

---

## Feature Dependencies

| Feature | Requires | Why |
|---------|----------|-----|
| F5 Citation & Provenance | F1 Contextual Grounding | Can't cite sources without retrieving them |
| F7 Autonomous Planning | F8 Tool Orchestration | Plans need actions to have effect |
| F9 Real-Time Data | F8 Tool Orchestration | Live queries require tool invocation |
| F14 Multi-Agent | F7 Autonomous Planning + F8 Tool Orchestration | Agents must plan and act, not just generate |
| F6 Adaptive Personalization | F10 Long-Term Memory | Cross-session personalization requires persistence |
| F11 Human Oversight | F15 Auditability | Approvals without records are unauditable |
| F13 Learning & Feedback | F15 Auditability | Feedback loops require logging infrastructure |

---

## Anti-Patterns

| Anti-Pattern | Remedy |
|---|---|
| **Feature bloat** — selecting all 15 "just in case" | Start with ● features only; add ◐ when Architectural Dimensions demand it |
| **Missing foundation** — action features (F7/F8/F14) without F12/F11 | Foundation Cluster (F12, F13, F15) is never optional in production |
| **Citation theater** — F5 implemented as document links only | Be explicit about maturity tier; T2 ≠ full provenance |
| **Personalization without consent** — F6 built without a data retention and consent strategy | Pair F6 with explicit privacy controls and data minimization before building user profiles |
| **Planning without guardrails** — F7 autonomous actions without F11 checkpoints | Every irreversible action requires at least one human oversight gate |
| **Feedback without action** — F13 signals collected but never reviewed | Assign ownership; set a review cadence and improvement cadence |
| **Audit as afterthought** — F15 retrofitted post-launch | Instrument basic request/response logging from day one, even at T1 |
| **Dependency blindness** — selecting F14 without F7/F8 at each agent | Check the Feature Dependencies table before finalising your feature set |
