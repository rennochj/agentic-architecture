# Use Case Archetypes — Reference Summary

*13 archetypes · 3 groups · v5.4. All production systems implicitly require **F12 Safety Controls** and **F13 Learning & Feedback**.*

---

## The Four Architectural Dimensions

Every use case is defined by its core archetype **plus** these four cross-cutting choices:

| Dimension | Options |
|-----------|---------|
| **Interaction Model** | One-shot · Conversational · Proactive · API-driven |
| **Autonomy Level** | Assistive (HITL executes) · Semi-Autonomous (HITL approves) · Fully Autonomous (HITL audits) |
| **Grounding Strategy** | Ungrounded · Curated (RAG) · Live (Tool Use) |
| **Governance Posture** | Data handling · Auditability depth · Safety & compliance constraints |

---

## The 13 Archetypes

| Group | # | Archetype | What it does | Primary Features | Key Risks |
|-------|---|-----------|--------------|-----------------|-----------|
| **A · Content & Knowledge Synthesis** | 1 | **Content Generation** | Create or rewrite content (text, code, image, audio, video) from prompts or templates | F3 · F4 · F6 · F12 · F13 | Hallucination, brand/compliance drift, IP leakage, bias |
| | 2 | **Summarization & Extraction** | Condense or extract structured data from unstructured inputs | F1 · F3 · F5 · F12 · F13 | Silent errors, poor confidence calibration, data retention |
| | 3 | **Grounded Q&A** | Answer questions from a curated knowledge base with citations | F1 · F4 · F5 · F12 · F13 | Prompt injection, stale knowledge, overconfident errors |
| | 4 | **Research & Synthesis** | Produce analytical artifacts by synthesizing many sources | F1 · F2 · F3 · F5 · F7 · F8 · F13 | Source bias, missing counter-evidence, non-reproducibility |
| **B · Insight & Decision Intelligence** | 5 | **Data Interpretation & Analytics** | Explain trends and act on anomalies from structured data, from narrative insight to automated response | F3 · F8 · F9 · F12 · F13 | Spurious correlations, data access gaps, misread intent |
| | 6 | **Recommendation & Personalization** | Tailor and deliver content, workflows, or experiences to user or context | F1 · F6 · F10 · F12 · F13 | Privacy violations, filter bubbles, unfair outcomes |
| | 7 | **Simulation & Synthetic Data** | Generate data, environments, or scenarios for training and testing | F3 · F7 · F12 · F13 | Sensitive pattern leakage, unrealistic distributions, bias |
| **C · Process & Task Automation** | 8 | **Software Dev Acceleration** | Assist with coding, testing, review, refactoring, and debugging | F1 · F3 · F4 · F8 · F11 · F12 · F13 | Vulnerable code, license/IP risk, brittle changes |
| | 9 | **Structured Workflow Automation** | Automate business processes using GenAI for NLU/NLG steps | F3 · F8 · F11 · F12 · F13 · F15 | Side-effects in external systems, partial failures, automation debt |
| | 10 | **Agentic Task Automation** | Plan and execute multi-step tasks by orchestrating tools adaptively | F7 · F8 · F9 · F10 · F11 · F12 · F13 · F14 · F15 | Tool misuse, prompt injection → unauthorized action, runaway costs |
| | 11 | **Ops & Monitoring Copilot** | Monitor signals, diagnose issues, and suggest or take remediation | F1 · F7 · F8 · F9 · F10 · F11 · F12 · F13 · F15 | Incorrect remediation, alert fatigue, permission creep |
| | 12 | **AI Governance & Assurance** | Support GRC via policy checks, control testing, and audit evidence | F1 · F2 · F3 · F5 · F11 · F12 · F13 · F15 | False assurance, incomplete evidence, over-automation of judgment |
| | 13 | **Conversational Agent** | Sustained, goal-directed dialogue for support, sales, coaching, advisory | F1 · F4 · F6 · F10 · F11 · F12 · F13 | Tone-deaf responses, failed escalation, over-promising, privacy leakage |

---

## Archetype Composition

| Pattern | Mechanism | Example |
|---------|-----------|---------|
| **Sequential** | Output of A becomes input to B | Research & Synthesis → Content Generation |
| **Parallel** | Two archetypes run on the same context | Ops Copilot ∥ Data Interpretation |
| **Nested** | Outer archetype delegates to inner as sub-tasks | Agentic Task Automation → Grounded Q&A + Structured Workflow |

**Design rules**: Union features · Tier to the highest participant · Define interface contracts · Inherit strictest governance · Evaluate end-to-end.

---

## Feature Key

| ID | Feature | ID | Feature | ID | Feature |
|----|---------|----|---------|----|---------|
| F1 | Contextual Grounding | F6 | Adaptive Personalization | F11 | Human Oversight |
| F2 | Multi-Source Synthesis | F7 | Autonomous Planning | F12 | Safety Controls |
| F3 | Structured Output | F8 | Tool Orchestration | F13 | Learning & Feedback |
| F4 | Interactive Refinement | F9 | Real-Time Data | F14 | Multi-Agent Collaboration |
| F5 | Citation & Provenance | F10 | Long-Term Memory | F15 | Auditability & Compliance |
