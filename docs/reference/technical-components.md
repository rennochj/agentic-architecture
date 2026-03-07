# GenAI Technical Components

*13 components across 4 maturity layers + 11 Operational Excellence cross-cutting concerns. All production deployments require **§5.1 Safety**, **§5.2 Evaluation**, **§5.3 Infrastructure**, **§5.4 Observability**, **§5.8 DevOps**, and **§5.11 Incident Response**.*

---

## Layer Components

| Layer | § | Component | What It Does | Primary Features |
|-------|---|-----------|--------------|-----------------|
| **T1 · Foundation** | §1.1 | **Foundation Models** | Core generation: LLMs, VLMs, speech, embedding, and diffusion models | F1 · F2 · F3 · F4 · F6 · F7 |
| | §1.2 | **Prompting Techniques** | Zero-shot, few-shot, CoT, structured prompting, agentic prompting | F1 · F2 · F3 · F4 · F6 · F7 |
| | §1.3 | **Model Selection & Customization Strategy** | Customization ladder (zero-shot → RAG → fine-tuning → distillation); use-case evaluation methodology | All features — sets the capability ceiling for the entire stack |
| **T2 · Augmentation** | §2.1 | **RAG & Information Retrieval** | Ground responses in retrieved knowledge; hybrid search, re-ranking | F1 · F2 · F5 |
| | §2.2 | **Output Processing & Structured Generation** | Schema-validated, parseable outputs; extraction, classification, routing | F2 · F3 · F5 |
| **T3 · Orchestration** | §3.1 | **Context Management** | Window strategies, history compression, multi-turn state management | F1 · F2 · F4 · F6 · F7 · F10 |
| | §3.2 | **Memory Systems** | Episodic, semantic, and procedural memory; cross-session persistence | F4 · F6 · F7 · F10 |
| | §3.3 | **Reasoning & Planning** | Chain-of-thought, ReAct, Plan-and-Execute, multi-step decomposition | F2 · F7 · F14 |
| | §3.4 | **Tool Use & Function Calling** | API, database, and code execution; MCP; multi-tool orchestration | F7 · F8 · F9 · F14 |
| **T4 · Autonomy** | §4.1 | **Agentic Architectures** | Single / multi-agent patterns: supervisor, pipeline, swarm | F7 · F14 |
| | §4.2 | **Workflow Orchestration** | DAG, event-driven, and stateful multi-step workflows | F7 · F11 |
| | §4.3 | **Human-in-the-Loop Patterns** | Approval gates, confidence escalation, warm/cold transfer | F11 · F15 |
| | §4.4 | **Agent Runtime & Deployment** | Hosting patterns, session lifecycle, compute isolation; managed vs. self-hosted trade-offs | F7 · F14 |

---

## Operational Excellence (Cross-Cutting — All Tiers)

| § | OE Component | What It Governs | Key Capabilities | When Required |
|---|--------------|-----------------|-----------------|---------------|
| §5.1 | **Safety, Guardrails & Alignment** | Harmful content, injection, PII, behavioral limits | Input/output filters · PII masking · DLP · behavioral alignment | :material-circle: Always |
| §5.2 | **Evaluation & Testing** | Output quality, agent performance, regressions | LLM-as-Judge · golden datasets · red-teaming · testability by design | :material-circle: Always |
| §5.3 | **Infrastructure & Deployment** | Model serving, API management, caching | Inference engines · API gateways · semantic caching | :material-circle: Always |
| §5.4 | **Observability** | Tracing, monitoring, logging, alerting | Reasoning traces · quality drift detection · cost signals | :material-circle: Always |
| §5.5 | **Cost Management & Budget Controls** | Budget guardrails, attribution, spend governance | Per-agent ceilings · model routing · cost dashboards | :material-circle: Production |
| §5.6 | **Resilience & Fault Tolerance** | Failover, graceful degradation, state recovery, agent failure modes | Multi-provider failover · checkpointing · loop detection | :material-circle-half-full: T3+ |
| §5.7 | **Performance & Latency Management** | Latency budgets, parallelism, throughput, perceived responsiveness | TTFT · parallel agents · streaming · optimistic UI | :material-circle-half-full: Latency-sensitive |
| §5.8 | **DevOps & Change Management** | Prompt versioning, model lifecycle, AI-native CI/CD | Prompts as code · eval-gated pipelines · canary / blue-green | :material-circle: Always |
| §5.9 | **Data & Knowledge Governance** | Corpus lifecycle, data quality, PII in datasets, index freshness | Ingestion pipelines · deduplication · right-to-erasure | :material-circle-half-full: RAG / fine-tuning |
| §5.10 | **Identity, Access & Authorization** | Model access, agent scopes, credentials, multi-tenant isolation | Role-based model access · least-privilege agents · credential vaulting | :material-circle: Enterprise / multi-user |
| §5.11 | **Incident Response & Runbooks** | AI incident classification, kill switches, post-incident analysis | Severity taxonomy · kill switches · five operational playbooks | :material-circle: Production |

---

## How to Use

**Step 1 — Start with Archetypes**: Identify your archetype(s) from `02-use-case-archetypes.md`. Required features (:material-circle:) in Matrix A tell you which capabilities you need.

**Step 2 — Map Features to Components**: For each required feature, read Matrix B in `03-capability-features.md` to find the components that enable it.

**Step 3 — Apply the Tier Ladder**: Start at T1 (Foundation). Add T2 only when grounding is required. Add T3 when you need state, memory, or tool use. Add T4 only when autonomous planning and multi-step execution are required.

**Step 4 — Apply OE**: Every production system requires the :material-circle: OE sections. Add :material-circle-half-full: sections based on the conditions in the "When Required" column above.

| Rule | Guidance |
|------|----------|
| **Never skip OE** | §5.1 + §5.2 + §5.3 + §5.4 + §5.8 are mandatory at every tier; add §5.5 and §5.11 before any production launch |
| **Cost before T4** | Add §5.5 Budget Guardrails before building any agentic system; costs scale multiplicatively at T4 |
| **IAM before agents** | Add §5.10 before giving agents tool access; least-privilege authorization is an agentic safety concern |
| **Corpus governance with RAG** | Any system with a knowledge base needs §5.9 from day one; retrofitting corpus governance is expensive |
| **Higher tier → inherit lower** | T3 requires T1 + T2. T4 requires T1 + T2 + T3. Never skip a layer |

---

## Tier Reference

| Tier | Label | Cost Baseline | Core Unlocked Capability |
|------|-------|---------------|--------------------------|
| T1 | Foundation | $ | Reliable generation with well-crafted prompts |
| T2 | Augmentation | $$ | Knowledge-grounded, schema-valid responses |
| T3 | Orchestration | $$$ | Stateful, multi-turn, tool-using systems |
| T4 | Autonomy | $$$$ | Autonomous planning, multi-agent collaboration |
| OE | Cross-Cutting | Varies | Production safety, quality, reliability, governance |

---

**Feature Key**

| ID | Feature | ID | Feature | ID | Feature |
|----|---------|----|---------|----|---------|
| F1 | Contextual Grounding | F6 | Adaptive Personalization | F11 | Human Oversight |
| F2 | Multi-Source Synthesis | F7 | Autonomous Planning | F12 | Safety Controls |
| F3 | Structured Output | F8 | Tool Orchestration | F13 | Learning & Feedback |
| F4 | Interactive Refinement | F9 | Real-Time Data | F14 | Multi-Agent Collaboration |
| F5 | Citation & Provenance | F10 | Long-Term Memory | F15 | Auditability & Compliance |
