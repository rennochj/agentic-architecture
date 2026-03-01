# GenAI Use Case Archetypes

*13 archetypes across 3 groups. All production deployments implicitly require **F12 Safety Controls** and **F13 Learning & Feedback**.*

---

| Group | # | Archetype | Core Job | Key Features |
|-------|---|-----------|----------|--------------|
| **A · Content & Knowledge Synthesis** | 1 | **Content Generation** | Create or rewrite content — text, code, images, audio, video | F3 · F4 · F6 · F12 · F13 |
| | 2 | **Summarization & Extraction** | Condense information or extract structured data from unstructured inputs | F1 · F3 · F5 · F12 · F13 |
| | 3 | **Grounded Q&A** | Answer questions from a curated knowledge base with citations | F1 · F4 · F5 · F12 · F13 |
| | 4 | **Research & Synthesis** | Produce analytical artifacts by synthesizing information from many sources | F1 · F2 · F3 · F5 · F7 · F8 · F13 |
| **B · Insight & Decision Intelligence** | 5 | **Data Interpretation & Analytics** | Explain trends and anomalies from structured data; trigger automated responses | F3 · F8 · F9 · F12 · F13 |
| | 6 | **Recommendation & Personalization** | Tailor content, workflows, or experiences to a user or context | F1 · F6 · F10 · F12 · F13 |
| | 7 | **Simulation & Synthetic Data** | Generate datasets, scenarios, or environments for training and testing | F3 · F7 · F12 · F13 |
| **C · Process & Task Automation** | 8 | **Software Dev Acceleration** | Assist with coding, testing, review, and debugging across the SDLC | F1 · F3 · F4 · F8 · F11 · F12 · F13 |
| | 9 | **Structured Workflow Automation** | Automate deterministic business processes using GenAI for NLU/NLG steps | F3 · F8 · F11 · F12 · F13 · F15 |
| | 10 | **Agentic Task Automation** | Plan and execute multi-step, dynamic tasks by orchestrating tools | F7 · F8 · F9 · F10 · F11 · F12 · F13 · F14 · F15 |
| | 11 | **Ops & Monitoring Copilot** | Monitor signals, diagnose issues, and suggest or take controlled remediation | F1 · F7 · F8 · F9 · F10 · F11 · F12 · F13 · F15 |
| | 12 | **AI Governance & Assurance** | Support GRC: policy checks, control testing, audit evidence gathering | F1 · F2 · F3 · F5 · F11 · F12 · F13 · F15 |
| | 13 | **Conversational Agent** | Conduct sustained, goal-directed conversations for support, sales, coaching, or advisory | F1 · F4 · F6 · F10 · F11 · F12 · F13 |

---

## Composing Archetypes

Real solutions often combine archetypes. Apply these rules when they do:

| Pattern | Mechanism | Example |
|---------|-----------|---------|
| **Sequential** | Output of A feeds input of B | Research & Synthesis → Content Generation |
| **Parallel** | Two archetypes run on the same context | Agentic Task Automation ∥ Data Interpretation & Analytics |
| **Nested** | Outer archetype delegates to inner as sub-tasks | Agentic Task Automation → Grounded Q&A + Software Dev Acceleration |

**Rules**: Union the features · Tier to the highest participant · Define interface contracts · Inherit strictest governance · Evaluate end-to-end.

---

**Feature Key**

| ID | Feature | ID | Feature | ID | Feature |
|----|---------|----|---------|----|---------|
| F1 | Contextual Grounding | F6 | Adaptive Personalization | F11 | Human Oversight |
| F2 | Multi-Source Synthesis | F7 | Autonomous Planning | F12 | Safety Controls |
| F3 | Structured Output | F8 | Tool Orchestration | F13 | Learning & Feedback |
| F4 | Interactive Refinement | F9 | Real-Time Data | F14 | Multi-Agent Collaboration |
| F5 | Citation & Provenance | F10 | Long-Term Memory | F15 | Auditability & Compliance |
