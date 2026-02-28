# GenAI Use Case Archetypes

*10 archetypes across 5 groups. All production deployments implicitly require **F12 Safety Controls** and **F13 Learning & Feedback**.*

---

| Group | # | Archetype | Core Job | Key Features |
|-------|---|-----------|----------|--------------|
| **A · Content & Creative** | 1 | **Content Generation & Transformation** | Create, modify, and adapt content — text, image, audio, video | F3 · F6 · F12 · F13 |
| | 6 | **Creative & Design** | Ideation, visual generation, narrative, and style adaptation | F3 · F6 · F13 |
| **B · Knowledge & Research** | 2 | **Knowledge Work & Research** | Gather, synthesize, and apply information; Q&A; document analysis | F1 · F2 · F4 · F5 |
| | 9 | **Specialized Domain Applications** | Domain-grounded AI for healthcare, legal, financial, and engineering | F1 · F2 · F5 · F15 |
| **C · Interaction & Productivity** | 4 | **Personal Productivity** | Writing assistance, scheduling, knowledge management, communication | F4 · F6 · F10 |
| | 5 | **Conversational & Interactive AI** | Customer support, virtual assistants, guided dialogue | F4 · F10 · F11 |
| **D · Development & Decision** | 7 | **Code & Software Development** | Coding, testing, review, refactoring, and debugging across the SDLC | F1 · F3 · F4 · F8 · F11 |
| | 8 | **Decision Support & Analytics** | Data insights, scenario analysis, risk assessment, recommendations | F3 · F5 · F8 · F9 |
| **E · Autonomy & Simulation** | 3 | **Autonomous Systems & Agents** | Multi-step task planning, tool orchestration, adaptive execution | F7 · F8 · F11 · F14 · F15 |
| | 10 | **Simulation & Synthetic Data** | Synthetic datasets, adversarial tests, scenarios, digital twins | F3 · F7 · F12 |

---

## Composing Archetypes

Real solutions often combine archetypes. Apply these rules when they do:

| Pattern | Mechanism | Example |
|---------|-----------|---------|
| **Sequential** | Output of A feeds input of B | Knowledge Work & Research → Content Generation |
| **Parallel** | Two archetypes run on the same context | Autonomous Agents ∥ Decision Support & Analytics |
| **Nested** | Outer archetype delegates to inner as sub-tasks | Autonomous Agents → Knowledge Work + Code & Software Dev |

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
