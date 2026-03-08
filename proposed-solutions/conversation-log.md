# Agentic AI Solution Design — Conversation Log

*Session started: 2026-03-08*

---

## Step 1: IDENTIFY — Use Case Archetype & Architectural Dimensions

### Question 1: Use Case Description

**Architect asks:**
Please describe the problem or use case you want to address. What is the business challenge, who are the users, and what outcome are you looking for?

**User answers:**
I want to build a simple agent to look up a stock price and return it to the user. The users will be retail investors who want quick access to stock prices without having to navigate a complex website. The outcome I want is for the agent to provide accurate and timely stock price information in a conversational format.

---

### Question 2: Clarifying Questions

**Architect asks:**

Please answer the following questions to help me fully characterise your use case. Add your answers below each question, then confirm the file is updated.

**Q2.1 — Current workflow:** How do your users currently look up stock prices? (e.g., brokerage app, financial website, Google search?) What is the pain point with the current approach?

**User answers:**
Currently, users typically look up stock prices using financial websites like Yahoo Finance or Google search. The pain point is that these platforms can be cluttered with ads, news, and other information that can be overwhelming for users who just want a quick price check. Additionally, on mobile devices, it can be cumbersome to navigate through multiple pages to find the current stock price.

**Q2.2 — Scope of data:** Should the agent return only the current/latest price, or also additional data such as daily high/low, volume, percentage change, or historical trends?

**User answers:**
The agent should return additional data along with the current price, such as daily high/low, volume, and percentage change. This will provide users with a more comprehensive snapshot of the stock's performance without needing to look elsewhere.

**Q2.3 — Data source:** Do you have a specific stock price API or data provider in mind (e.g., Alpha Vantage, Yahoo Finance, Bloomberg, a brokerage API), or is this open for recommendation?

**User answers:**
I am open to recommendations for the data source. I would prefer something that is reliable, has a good track record for uptime, and offers a free tier for development purposes. If there are options that provide real-time data, that would be a plus.

**Q2.4 — Interaction style:** Is this a one-shot interaction (user asks, gets a price, done) or should the agent support multi-turn conversation (e.g., "What about AAPL? And how does that compare to last week?")?

**User answers:**
In it intended as a one-shot interaction for the initial version, where the user asks for a stock price and gets the information back immediately. However, I would like to eventually support multi-turn conversations in future iterations, where users can ask follow-up questions about the stock or compare it to historical data. For now, let's focus on the one-shot interaction to keep it simple.

**Q2.5 — Actions beyond lookup:** Should the agent only *inform* (return prices), or should it also be able to *act* (e.g., set price alerts, place trades, add to a watchlist)?

**User answers:**
For the initial version, the agent should only *inform* by returning stock prices and related data. I want to keep it simple and focused on providing accurate information. However, in future versions, I would be interested in exploring additional capabilities such as setting price alerts or integrating with a brokerage API to place trades, but let's start with the informational aspect first.

**Q2.6 — Constraints:** Are there any regulatory, organisational, or technical constraints to be aware of? For example:
- Is financial advice regulation (e.g., SEC, FCA) a concern, or is this purely informational?
- Are there data residency or privacy requirements?
- Is there an existing tech stack or cloud provider this must fit into?

**User answers:**
For the initial version, the agent will be purely informational and not provide financial advice, so regulatory concerns are minimal. There are no specific data residency or privacy requirements for this use case. The agent should be designed to integrate easily with common tech stacks and cloud providers, but there are no strict constraints at this stage.

---

### Step 1 Analysis: Archetype Candidates

**Architect's analysis:**

Based on your responses, here are the top 3 archetype candidates:

#### Candidate 1: **Archetype 5 — Data Interpretation & Analytics** (Recommended)

**Rationale:** The core job-to-be-done is *querying a real-time structured data source (stock price API) and presenting the results in natural language*. This aligns directly with Archetype 5's description: "Explain trends and act on anomalies from structured data." Your agent retrieves structured financial data (price, high/low, volume, % change) via an API and narrates it conversationally. The primary features (F3 Structured Output, F8 Tool Orchestration, F9 Real-Time Data Access) match your requirements precisely.

**Fit score:** Strong — the data-to-narrative pattern is the essence of this archetype.

#### Candidate 2: **Archetype 3 — Grounded Q&A**

**Rationale:** The interaction pattern (user asks a question, gets a factual answer) resembles Grounded Q&A. However, Archetype 3 is designed for *curated knowledge bases* (RAG over documents), not real-time API data. Your system doesn't retrieve from a knowledge corpus — it calls a live API. This makes it a weaker fit.

**Fit score:** Partial — right interaction pattern, wrong grounding mechanism.

#### Candidate 3: **Archetype 13 — Conversational Agent**

**Rationale:** Could apply if the system were multi-turn with persona, escalation, and sustained dialogue. Since the initial version is one-shot and purely informational, this is premature. It may become relevant in future iterations when you add follow-up questions and comparisons.

**Fit score:** Weak for v1 — deferral candidate for future iterations.

**Recommendation:** **Archetype 5 — Data Interpretation & Analytics** as the primary archetype. No composition needed — this is a single-archetype solution.

---

### Step 1 Analysis: Four Architectural Dimensions

| Dimension | Selection | Rationale |
|-----------|-----------|-----------|
| **Interaction Model** | **One-shot** | Stateless request-response. User asks for a stock price, gets the answer. No session state needed for v1. |
| **Autonomy Level** | **Assistive** (HITL for Execution) | The agent retrieves and presents data; the user decides what to do with it. No autonomous actions. |
| **Grounding Strategy** | **Live Grounding (Tool Use)** | The system calls a real-time stock price API — no static knowledge base or RAG pipeline needed. |
| **Governance Posture** | **Light** | Informational only, no PII, no financial advice, no regulated data. A disclaimer ("not financial advice") is the primary governance control. |

---

### Step 1 Analysis: Data Readiness Gate

| # | Question | Assessment | Status |
|---|----------|------------|--------|
| 1 | **Is the data accessible?** | Yes — public stock price APIs (Alpha Vantage, Yahoo Finance, Polygon, Finnhub) are accessible via HTTP REST APIs with API keys. No firewall or network policy issues for a cloud-deployed agent. | ✅ Pass |
| 2 | **Is the data legally cleared for AI use?** | Yes — stock price data from public APIs is factual market data available for informational use. API terms of service must be verified for the chosen provider, but this is standard for informational display. No PII, PHI, or restricted data involved. | ✅ Pass |
| 3 | **Does the data cover the domain sufficiently?** | Yes — major stock price APIs cover all US exchanges and many international markets. Current price, daily high/low, volume, and percentage change are standard fields. | ✅ Pass |
| 4 | **Is the data in a usable format?** | Yes — APIs return well-structured JSON with documented schemas. No parsing, OCR, or format conversion needed. | ✅ Pass |
| 5 | **What is the baseline quality?** | High — established financial data providers source from exchanges with strict data integrity. Delayed data (15-20 min) is free; real-time may require a paid tier. | ✅ Pass |
| 6 | **Is the data representative and unbiased?** | Yes — stock prices are factual market data, not subjective or demographically biased. | ✅ Pass |

**Data Readiness Gate: PASS** — No red flags identified. Zero blockers.

---

### Step 1 Summary

| Item | Decision |
|------|----------|
| **Primary Archetype** | Archetype 5 — Data Interpretation & Analytics |
| **Composition Pattern** | None (single archetype) |
| **Interaction Model** | One-shot |
| **Autonomy Level** | Assistive |
| **Grounding Strategy** | Live Grounding (Tool Use) |
| **Governance Posture** | Light (informational, disclaimer only) |
| **Data Readiness Gate** | ✅ PASS — no red flags |

---

### Step 1 Confirmation Gate

**Architect asks:**
Please review the Step 1 Summary above and confirm:
1. Do you agree with **Archetype 5 — Data Interpretation & Analytics** as the primary archetype?
2. Do the **Four Architectural Dimensions** accurately reflect your intent?
3. Are there any concerns with the **Data Readiness Gate** assessment?

Please add your confirmation below, then ask me to continue.

**User confirms:**
I am in agreement with the Step 1 summary.

---

## Step 2: MAP — Capability Features

### Matrix A Lookup: Archetype 5 — Data Interpretation & Analytics

From Matrix A (03-capability-features.md), the feature profile for Archetype 5:

| Feature | Matrix A Rating | Description |
|---------|----------------|-------------|
| **F1** Contextual Grounding | ◐ Optional | Not needed — no RAG/knowledge base; data comes from live API |
| **F2** Multi-Source Synthesis | ◐ Often Needed | Not needed for v1 — single API data source |
| **F3** Structured Output | ● Required | The agent must format price data (price, high/low, volume, % change) consistently |
| **F4** Interactive Refinement | ◐ Often Needed | Not needed for v1 — one-shot interaction model |
| **F5** Citation & Provenance | ◐ Often Needed | Nice to have — attributing the data source (e.g., "via Alpha Vantage, delayed 15 min") |
| **F6** Adaptive Personalization | − Not Applicable | Not needed — no user profiles or personalization |
| **F7** Autonomous Planning | ◐ Optional | Not needed — single tool call, no multi-step planning |
| **F8** Tool Orchestration | ● Required | Core capability — the agent must call a stock price API |
| **F9** Real-Time Data Access | ● Required | Core capability — querying live market data |
| **F10** Long-Term Memory | ◐ Optional | Not needed — stateless one-shot interaction |
| **F11** Human Oversight Gates | ◐ Often Needed | Not needed — purely informational, no actions to approve |
| **F12** Safety & Content Controls | ● Required (implicit) | Required for all production systems — prevent prompt injection, enforce "not financial advice" disclaimer |
| **F13** Learning & Feedback | ● Required (implicit) | Required for all production systems — user feedback and quality monitoring |
| **F14** Multi-Agent Collaboration | − Not Applicable | Not needed — single agent |
| **F15** Auditability & Compliance | ◐ Often Needed | Light — basic request logging sufficient; no regulated compliance |

### Dimensional Filter: Evaluating ◐ (Often Needed) Features

Applying the Four Architectural Dimensions to decide whether each ◐ feature upgrades to required:

| Feature | Dimension Check | Decision |
|---------|----------------|----------|
| **F1** Contextual Grounding | Grounding Strategy = Live (Tool Use), not Curated (RAG) → F1 not triggered | **Defer** — no knowledge base needed |
| **F2** Multi-Source Synthesis | Single data source → no synthesis needed | **Defer** |
| **F4** Interactive Refinement | Interaction Model = One-shot → no multi-turn | **Defer** for v1 |
| **F5** Citation & Provenance | Good practice to show data source and delay disclaimer | **Include** (light implementation — source attribution string) |
| **F7** Autonomous Planning | Autonomy Level = Assistive → no planning needed | **Defer** |
| **F10** Long-Term Memory | Interaction Model = One-shot → stateless | **Defer** |
| **F11** Human Oversight | Autonomy Level = Assistive, inform-only → no actions to gate | **Defer** |
| **F15** Auditability | Governance Posture = Light → basic logging only | **Include** (light — request/response logging) |

### Feature Dependencies Check

| Selected Feature | Dependencies | Status |
|------------------|-------------|--------|
| F3 (Structured Output) | None | ✅ |
| F5 (Citation & Provenance) | Depends on F1 (Contextual Grounding) | ⚠️ F5 typically requires F1, but in this case the "source" is the API itself, not a retrieved document. Light implementation (data source attribution) does not require a RAG pipeline. **Acceptable exception.** |
| F8 (Tool Orchestration) | None | ✅ |
| F9 (Real-Time Data Access) | Depends on F8 (Tool Orchestration) | ✅ F8 is included |
| F12 (Safety Controls) | None | ✅ |
| F13 (Learning & Feedback) | Depends on F15 (Auditability) | ✅ F15 is included |
| F15 (Auditability) | None | ✅ |

All dependencies satisfied.

### Step 2 Summary

**Confirmed Features:**

| Feature | Status | Rationale |
|---------|--------|-----------|
| **F3** Structured Output | ● Required | Format stock data consistently for user consumption |
| **F5** Citation & Provenance | ✅ Context-selected | Light: data source attribution and delay disclaimer |
| **F8** Tool Orchestration | ● Required | Call stock price API |
| **F9** Real-Time Data Access | ● Required | Query live market data |
| **F12** Safety & Content Controls | ● Required (implicit) | Prompt injection defense, "not financial advice" disclaimer |
| **F13** Learning & Feedback | ● Required (implicit) | User feedback collection, quality monitoring |
| **F15** Auditability & Compliance | ✅ Context-selected | Basic request/response logging |

**Deferred Features:**

| Feature | Rationale |
|---------|-----------|
| F1 Contextual Grounding | No knowledge base; live API grounding only |
| F2 Multi-Source Synthesis | Single data source |
| F4 Interactive Refinement | One-shot interaction model for v1 |
| F6 Adaptive Personalization | No user profiles needed |
| F7 Autonomous Planning | Single tool call, no multi-step planning |
| F10 Long-Term Memory | Stateless one-shot interaction |
| F11 Human Oversight Gates | No actions to approve — inform only |
| F14 Multi-Agent Collaboration | Single agent |

**Total: 7 confirmed features, 8 deferred.**

---

### Step 2 Confirmation Gate

**Architect asks:**
Please review the confirmed feature set above. Does the set of 7 features (F3, F5, F8, F9, F12, F13, F15) look right for your use case? Are there any deferred features you think should be included, or any confirmed features you'd like to remove?

Please add your confirmation below, then ask me to continue.

**User confirms:**
I am in agreement with Step 2. Please continue.

---

## Step 3: IDENTIFY — Technical Components

### Matrix C Quick Lookup: Archetype 5 — Data Interpretation & Analytics

From Matrix C (03-capability-features.md), Archetype 5's differentiating components are:
- **Output Processing** (§2.2)
- **Tool Use & Functions** (§3.4)

Plus the **universal components** required by all archetypes:
- Foundation Models (§1.1)
- Prompting (§1.2)
- Safety & Guardrails (§5.1)
- Evaluation & Testing (§5.2)
- Observability & Infrastructure (§5.3–5.4)

Plus structural prerequisites:
- Model Selection Strategy (§1.3)
- Data Readiness Assessment (§5.9.0)

**Minimum Tier:** T2 (Enhanced)

### Matrix B Cross-Reference: Feature → Component Traceability

Tracing each confirmed feature through Matrix B to identify all enabling components:

| Feature | Primary Enablers (●) | Supporting (◐) |
|---------|----------------------|-----------------|
| **F3** Structured Output | Foundation Models, Prompting, Output Processing, Evaluation & Testing | Safety & Guardrails |
| **F5** Citation & Provenance | Output Processing, Evaluation & Testing, Observability & Infrastructure | Prompting |
| **F8** Tool Orchestration | Tool Use & Functions, Evaluation & Testing, Observability & Infrastructure | Prompting, Output Processing, Safety & Guardrails |
| **F9** Real-Time Data Access | Foundation Models, Tool Use & Functions, Evaluation & Testing, Observability & Infrastructure | Output Processing, Safety & Guardrails |
| **F12** Safety & Content Controls | Safety & Guardrails, Evaluation & Testing, Observability & Infrastructure | Prompting, Output Processing |
| **F13** Learning & Feedback | Evaluation & Testing, Observability & Infrastructure | |
| **F15** Auditability & Compliance | Observability & Infrastructure, Evaluation & Testing, Safety & Guardrails | HITL Patterns (deferred — not needed for light auditability) |

### Existing Components & Exclusions

**Architect asks (answered from Q2.6):** No existing components in place. No organisational constraints or exclusions. Open platform — no vendor lock-in requirements.

### Candidate Component List by Layer

#### Foundation Layer (§1)

| Component | §Ref | Features Enabled | Complexity | Include? |
|-----------|------|-----------------|------------|----------|
| **Foundation Models** | §1.1 | F3, F9 | ★☆☆☆☆ (API call) | ✅ Include |
| **Prompting Techniques** | §1.2 | F3, F5, F8, F12 | ★★☆☆☆ (Few-shot) | ✅ Include |
| **Model Selection Strategy** | §1.3 | All features (structural prerequisite) | ★★☆☆☆ | ✅ Include |

#### Augmentation Layer (§2)

| Component | §Ref | Features Enabled | Complexity | Include? |
|-----------|------|-----------------|------------|----------|
| **RAG & Retrieval** | §2.1 | — | — | ❌ Not needed (no knowledge base) |
| **Output Processing** | §2.2 | F3, F5, F8 | ★★☆☆☆ | ✅ Include |

#### Orchestration Layer (§3)

| Component | §Ref | Features Enabled | Complexity | Include? |
|-----------|------|-----------------|------------|----------|
| **Context Management** | §3.1 | — | — | ❌ Not needed (one-shot, no multi-turn) |
| **Memory Systems** | §3.2 | — | — | ❌ Not needed (stateless) |
| **Reasoning & Planning** | §3.3 | — | — | ❌ Not needed (single tool call) |
| **Tool Use & Function Calling** | §3.4 | F8, F9 | ★★☆☆☆ (Single Function) | ✅ Include |

#### Autonomy Layer (§4)

| Component | §Ref | Features Enabled | Complexity | Include? |
|-----------|------|-----------------|------------|----------|
| **Agentic Architectures** | §4.1 | — | — | ❌ Not needed (no agent loop) |
| **Workflow Orchestration** | §4.2 | — | — | ❌ Not needed (single step) |
| **HITL Patterns** | §4.3 | — | — | ❌ Not needed (inform only) |
| **Agent Runtime** | §4.4 | — | — | ❌ Not needed (no persistent agent) |

#### Operational Excellence (§5 — Cross-Cutting)

| Component | §Ref | Features Enabled | Complexity | Include? |
|-----------|------|-----------------|------------|----------|
| **Safety & Guardrails** | §5.1 | F12 | ★★☆☆☆ | ✅ Include |
| **Evaluation & Testing** | §5.2 | F3, F5, F8, F9, F12, F13, F15 | ★★☆☆☆ | ✅ Include |
| **Infrastructure & Deployment** | §5.3 | F8, F9, F13 | ★★☆☆☆ | ✅ Include |
| **Observability** | §5.4 | F8, F9, F12, F13, F15 | ★★☆☆☆ | ✅ Include |
| **Cost Management** | §5.5 | Cross-cutting | ★☆☆☆☆ | ✅ Include (light — API billing monitoring) |
| **Resilience & Fault Tolerance** | §5.6 | F8, F9 | ★★☆☆☆ | ✅ Include (retry + fallback for API failures) |
| **Performance & Latency** | §5.7 | F9 | ★☆☆☆☆ | ✅ Include (light — response time target) |
| **DevOps & Change Management** | §5.8 | Cross-cutting | ★★☆☆☆ | ✅ Include (CI/CD, prompt versioning) |
| **Data Readiness** | §5.9 | Structural prerequisite | ★☆☆☆☆ | ✅ Include (API contract verification) |
| **Identity & Authorization** | §5.10 | Cross-cutting | ★☆☆☆☆ | ✅ Include (light — API key management) |
| **Incident Response** | §5.11 | Cross-cutting | ★☆☆☆☆ | ✅ Include (light — basic runbook) |

### Step 3 Summary

**Included Components (15 total):**

| Layer | Component | §Ref | Features Enabled | Complexity |
|-------|-----------|------|-----------------|------------|
| **Foundation** | Foundation Models | §1.1 | F3, F9 | ★☆☆☆☆ |
| **Foundation** | Prompting Techniques | §1.2 | F3, F5, F8, F12 | ★★☆☆☆ |
| **Foundation** | Model Selection Strategy | §1.3 | All (prerequisite) | ★★☆☆☆ |
| **Augmentation** | Output Processing | §2.2 | F3, F5, F8 | ★★☆☆☆ |
| **Orchestration** | Tool Use & Function Calling | §3.4 | F8, F9 | ★★☆☆☆ |
| **OE** | Safety & Guardrails | §5.1 | F12 | ★★☆☆☆ |
| **OE** | Evaluation & Testing | §5.2 | F3, F5, F8, F9, F12, F13, F15 | ★★☆☆☆ |
| **OE** | Infrastructure & Deployment | §5.3 | F8, F9, F13 | ★★☆☆☆ |
| **OE** | Observability | §5.4 | F8, F9, F12, F13, F15 | ★★☆☆☆ |
| **OE** | Cost Management | §5.5 | Cross-cutting | ★☆☆☆☆ |
| **OE** | Resilience & Fault Tolerance | §5.6 | F8, F9 | ★★☆☆☆ |
| **OE** | Performance & Latency | §5.7 | F9 | ★☆☆☆☆ |
| **OE** | DevOps & Change Management | §5.8 | Cross-cutting | ★★☆☆☆ |
| **OE** | Data Readiness | §5.9 | Prerequisite | ★☆☆☆☆ |
| **OE** | Identity & Authorization | §5.10 | Cross-cutting | ★☆☆☆☆ |

**Excluded Components:** RAG & Retrieval (§2.1), Context Management (§3.1), Memory Systems (§3.2), Reasoning & Planning (§3.3), Agentic Architectures (§4.1), Workflow Orchestration (§4.2), HITL Patterns (§4.3), Agent Runtime (§4.4), Incident Response (§5.11 — deferred to post-launch).

**Estimated overall complexity:** Low (★★☆☆☆ average). This is a lean T2 system with 5 capability components and 10 lightweight OE components. Implementation effort: **days to weeks**.

---

### Step 3 Confirmation Gate

**Architect asks:**
Please review the candidate component list above:
1. Are there any components you already have in place that we should note?
2. Are there any components you'd like to exclude or add?
3. Does the overall complexity estimate seem reasonable?

Please add your confirmation below, then ask me to continue to Step 4 (Component Evaluation).

**User confirms:**
I am in agreement, please continue to Step 4.

---

## Step 4: EVALUATE — Component Suitability

### Evaluation Method

This is a **T2 system with 5 capability components** (plus 10 lightweight OE components). Per the framework (05-component-selection-guide.md), the **Light Canvas** applies — three questions per component:

1. **WHY?** — What feature does this enable? (Essential / High Value / Nice to Have / Not Needed)
2. **WHAT IF?** — What risk does this mitigate? (Critical Risk / Important / Minor / No Risk)
3. **CAN WE SHIP?** — How production-ready is this? (Battle-tested / Stable / Emerging / Experimental)

**Inclusion rule (Light Canvas):** Include if Essential/High Value AND (Critical/Important risk OR Stable+).

### Light Canvas Evaluation: Capability Components

#### 1. Foundation Models (§1.1)

| Question | Answer |
|----------|--------|
| **WHY?** | **Essential** — Enables F3 (Structured Output), F9 (Real-Time Data). The LLM is the core of the system; it interprets user queries and generates natural-language responses from API data. |
| **WHAT IF?** | **Critical Risk** — Without a foundation model, there is no system. Mitigates the risk of users receiving raw JSON instead of human-readable responses. |
| **CAN WE SHIP?** | **Battle-tested** — Major LLM APIs (OpenAI, Anthropic, Google) are production-grade with SLAs. |
| **Decision** | ✅ **INCLUDE** |

#### 2. Prompting Techniques (§1.2)

| Question | Answer |
|----------|--------|
| **WHY?** | **Essential** — Enables F3 (consistent output formatting), F5 (source attribution instruction), F8 (tool calling behavior), F12 (disclaimer enforcement). The system prompt defines the agent's entire behavior. |
| **WHAT IF?** | **Important** — Poor prompting leads to inconsistent formatting, missing disclaimers, and unreliable tool calls. |
| **CAN WE SHIP?** | **Battle-tested** — Few-shot prompting and system prompts are the most mature technique in the GenAI stack. |
| **Decision** | ✅ **INCLUDE** |

#### 3. Model Selection Strategy (§1.3)

| Question | Answer |
|----------|--------|
| **WHY?** | **High Value** — Structural prerequisite. Ensures the right model is chosen (capability vs. cost vs. latency) before building. A small, fast model may suffice for this use case, saving significant cost over a frontier model. |
| **WHAT IF?** | **Important** — Choosing the wrong model wastes budget or delivers poor quality. The Customization Ladder prevents over-engineering (e.g., fine-tuning when prompting suffices). |
| **CAN WE SHIP?** | **Battle-tested** — Evaluation methodology (golden dataset, head-to-head comparison) is well-established. |
| **Decision** | ✅ **INCLUDE** |

#### 4. Output Processing (§2.2)

| Question | Answer |
|----------|--------|
| **WHY?** | **Essential** — Enables F3 (structured output formatting — price, high/low, volume, % change), F5 (citation/attribution string), F8 (parsing tool call results). Ensures the user receives clean, consistent output. |
| **WHAT IF?** | **Important** — Without output validation, the agent might return malformed data, missing fields, or inconsistent formatting. |
| **CAN WE SHIP?** | **Battle-tested** — JSON schema validation, Pydantic models, and structured output modes are production-proven. |
| **Decision** | ✅ **INCLUDE** |

#### 5. Tool Use & Function Calling (§3.4)

| Question | Answer |
|----------|--------|
| **WHY?** | **Essential** — Enables F8 (Tool Orchestration) and F9 (Real-Time Data Access). This is the core mechanism — the agent calls the stock price API to get live data. Without it, the system has nothing to report. |
| **WHAT IF?** | **Critical Risk** — Without tool calling, the LLM would hallucinate stock prices from training data. This is the single most important risk mitigation in the system. |
| **CAN WE SHIP?** | **Battle-tested** — Native function calling is supported by all major LLM providers (OpenAI, Anthropic, Google). Single-function calling is the simplest tool use pattern. |
| **Decision** | ✅ **INCLUDE** |

### Light Canvas Evaluation: OE Components

OE components are cross-cutting production requirements. A brief assessment for each:

| OE Component | WHY? | WHAT IF? | CAN WE SHIP? | Decision |
|-------------|------|----------|---------------|----------|
| **Safety & Guardrails** (§5.1) | Essential (F12) — prompt injection defense, "not financial advice" disclaimer | Critical — unfiltered output could be mistaken for financial advice | Battle-tested — provider content filters + custom guardrails | ✅ **INCLUDE** |
| **Evaluation & Testing** (§5.2) | Essential (F3, F8, F13) — validates output quality, tool call accuracy | Important — without eval, quality degrades silently | Battle-tested — golden datasets, LLM-as-Judge | ✅ **INCLUDE** |
| **Infrastructure & Deployment** (§5.3) | Essential — API hosting, deployment | Critical — no infrastructure = no service | Battle-tested — standard cloud deployment | ✅ **INCLUDE** |
| **Observability** (§5.4) | High Value (F13, F15) — request logging, latency tracking, error monitoring | Important — without observability, failures are invisible | Battle-tested — standard logging/metrics tools | ✅ **INCLUDE** |
| **Cost Management** (§5.5) | High Value — API billing monitoring | Important — unmonitored API usage can spike unexpectedly | Battle-tested — spending alerts, usage dashboards | ✅ **INCLUDE** |
| **Resilience** (§5.6) | High Value (F8, F9) — retry logic for API failures | Important — stock API outages would break the service | Battle-tested — exponential backoff, circuit breakers | ✅ **INCLUDE** |
| **Performance** (§5.7) | High Value (F9) — response time target for user experience | Minor — users expect fast responses but this isn't latency-critical | Battle-tested — standard latency monitoring | ✅ **INCLUDE** |
| **DevOps** (§5.8) | High Value — CI/CD, prompt versioning | Important — manual deployments slow iteration | Battle-tested — standard CI/CD pipelines | ✅ **INCLUDE** |
| **Data Readiness** (§5.9) | Essential (prerequisite) — API contract verification | Important — broken API contract = broken service | Battle-tested — API schema validation | ✅ **INCLUDE** |
| **Identity & Auth** (§5.10) | High Value — API key management for stock data provider | Minor — API key compromise is low-risk but easy to prevent | Battle-tested — secrets management | ✅ **INCLUDE** |

### Anti-Pattern Check (05, §Anti-Patterns)

| Anti-Pattern | Assessment |
|-------------|------------|
| **Kitchen Sink** | ✅ Not present — 15 components total, 9 excluded. Lean stack. |
| **Premature Complexity** | ✅ Not present — no agents, no multi-agent, no planning, no memory. Appropriate for T2. |
| **Observability Afterthought** | ✅ Not present — observability, logging, and evaluation included from day one. |
| **Missing Evaluation** | ✅ Not present — Evaluation & Testing (§5.2) included with golden dataset requirement. |
| **Tech-First Thinking** | ✅ Not present — component selection traced from use case → archetype → features → components. |
| **Set-and-Forget** | ✅ Not present — F13 (Learning & Feedback) and continuous evaluation included. |

No anti-patterns detected.

### Step 4 Summary

**Component Evaluation Results:**

| Component | WHY? | WHAT IF? | CAN WE SHIP? | Decision |
|-----------|------|----------|---------------|----------|
| Foundation Models (§1.1) | Essential | Critical | Battle-tested | ✅ Include |
| Prompting (§1.2) | Essential | Important | Battle-tested | ✅ Include |
| Model Selection (§1.3) | High Value | Important | Battle-tested | ✅ Include |
| Output Processing (§2.2) | Essential | Important | Battle-tested | ✅ Include |
| Tool Use & Functions (§3.4) | Essential | Critical | Battle-tested | ✅ Include |
| Safety & Guardrails (§5.1) | Essential | Critical | Battle-tested | ✅ Include |
| Evaluation & Testing (§5.2) | Essential | Important | Battle-tested | ✅ Include |
| Infrastructure (§5.3) | Essential | Critical | Battle-tested | ✅ Include |
| Observability (§5.4) | High Value | Important | Battle-tested | ✅ Include |
| Cost Management (§5.5) | High Value | Important | Battle-tested | ✅ Include |
| Resilience (§5.6) | High Value | Important | Battle-tested | ✅ Include |
| Performance (§5.7) | High Value | Minor | Battle-tested | ✅ Include |
| DevOps (§5.8) | High Value | Important | Battle-tested | ✅ Include |
| Data Readiness (§5.9) | Essential | Important | Battle-tested | ✅ Include |
| Identity & Auth (§5.10) | High Value | Minor | Battle-tested | ✅ Include |

**Removed components:** None. All 15 candidates pass the Light Canvas.
**Anti-patterns identified:** None.

---

### Step 4 Confirmation Gate

**Architect asks:**
Please review the component evaluation above:
1. Do you agree with the Light Canvas assessments?
2. Are there any components you think should be deferred or removed?
3. Are you satisfied that no anti-patterns are present?

Please add your confirmation below, then ask me to continue to Step 5 (Implementation Tier & Platform).

**User confirms:**
I am agreeement with the Step 4 evaluation. Please continue.

---

## Step 5: SELECT — Implementation Tier and Platform

### Implementation Tier Confirmation

#### Tier Assessment

Mapping the confirmed components and features against the T1–T4 tier definitions (06-implementation-tiers.md, §1):

| Signal | Assessment |
|--------|-----------|
| Single LLM call, no retrieval, no tools | ❌ Not T1 — we have tool use |
| RAG in place, basic memory, structured output | ◐ Partial T2 — structured output + single tool, but no RAG or memory |
| Multi-step workflows, tool use, conditional logic, HITL gates | ❌ Not T3 — single step, no workflow, no HITL |
| Autonomous planning, multi-agent, self-correction | ❌ Not T4 |

**Confirmed Tier: T2 (Enhanced)**

The system uses a single predetermined tool (stock price API) with structured output — this is the defining pattern of T2. It doesn't need RAG or memory but adds tool use, which is a T2 capability.

#### Feature Maturity by Tier Verification

Checking that every confirmed feature is achievable at T2 (from 06-implementation-tiers.md, §1 Feature Maturity matrix):

| Feature | T2 Capability | Our Requirement | Sufficient? |
|---------|---------------|-----------------|-------------|
| **F3** Structured Output | Schema-constrained with validation | Format price data as structured response | ✅ Yes |
| **F5** Citation & Provenance | Document-level citations | Data source attribution string | ✅ Yes (light implementation) |
| **F8** Tool Orchestration | Single predetermined tool | Single stock price API call | ✅ Yes — exact match |
| **F9** Real-Time Data Access | Single data source queries | Single stock price API | ✅ Yes — exact match |
| **F12** Safety & Content Controls | Custom filters + PII detection | Disclaimer enforcement + input filtering | ✅ Yes |
| **F13** Learning & Feedback | User feedback + basic metrics | Thumbs up/down + quality monitoring | ✅ Yes |
| **F15** Auditability & Compliance | User action + output logging | Request/response logging | ✅ Yes |

All 7 features are fully achievable at T2. No tier upgrade needed.

#### NFR Checklist for T2 (06-implementation-tiers.md, §7)

| NFR Item | Status | Notes |
|----------|--------|-------|
| ✅ OAuth 2.0 / SSO integration | Optional for v1 | Can start with API key; add SSO if user auth is needed later |
| ✅ Data encryption at rest | Applicable | Standard cloud provider encryption |
| ✅ RBAC implemented | Optional for v1 | Single-role system initially |
| ✅ PII detection/masking | Light | User queries may contain no PII; basic filter as safeguard |
| ✅ Secrets management | Required | Stock API key must be stored securely |
| ✅ P95 latency targets defined | Required | Target: <3s end-to-end response |
| ✅ Response caching | Optional | Could cache recent lookups to reduce API calls |
| ✅ Retry with exponential backoff | Required | For stock API resilience |
| ✅ Structured logging + basic metrics | Required | Request/response logging, latency, error rate |
| ✅ Request tracing enabled | Required | Correlate LLM call ↔ tool call ↔ response |
| ✅ Custom content filters | Required | "Not financial advice" disclaimer |
| ✅ Source citations implemented | Required | Data source attribution |
| ✅ CI/CD pipeline | Required | Automated deployment |
| ✅ Prompt version control | Required | Track prompt changes |
| ✅ Spending alerts | Required | Monitor LLM API + stock API costs |

**NFR gaps identified:** None critical. OAuth/SSO and RBAC are optional for v1 (single-role, no user auth required initially). Response caching is a nice-to-have optimisation.

---

### Platform Selection

#### Context (from user responses)
- No existing cloud provider commitment
- No vendor lock-in requirements
- Open to recommendations
- Team skill level not specified — assuming general developer capability
- Budget: lean (implied by "simple agent" framing)

#### Decision Tree Walk-Through (07-platform-selection.md, §3)

```
START: What is your use case complexity tier?
├─► T2 (Enhanced)
│   └─► Are you in the Microsoft 365 ecosystem?
│       └─► Not specified / No strong commitment
│           └─► What is your cloud provider?
│               └─► Multi/None
│                   └─► OpenAI API + orchestration framework
```

#### Platform Candidates

| Platform | Fit Assessment |
|----------|---------------|
| **LLM API + Lightweight Framework** (e.g., OpenAI API or Anthropic API + Python) | **Best fit** — maximum simplicity for a T2 single-tool use case. Direct function calling support. Minimal infrastructure overhead. Lowest initial cost. |
| **Cloud AI Platform** (Azure AI / AWS Bedrock / Vertex AI) | Viable but overkill — these platforms add value at T3+ with managed RAG, orchestration, and enterprise controls. Unnecessary complexity for a single-tool T2 system. |
| **Copilot Studio** | Poor fit — designed for M365 ecosystem integration. No M365 dependency here. |
| **Agent Frameworks** (LangChain/LangGraph) | Marginal — LangChain adds abstraction over function calling but the overhead isn't justified for a single-tool use case. Could be considered if future multi-tool expansion is expected soon. |

#### Platform Recommendation

**Primary: Direct LLM API (Anthropic Claude or OpenAI) + Python**

| Dimension | Assessment |
|-----------|-----------|
| **Why this platform** | Simplest architecture for a T2 single-tool system. Native function calling. No framework overhead. Direct control over prompts, tool definitions, and output processing. |
| **Tier support** | T1–T2 fully supported. Can extend to T3 by adding an orchestration framework later. |
| **Skill requirements** | Python + API integration — standard developer skills. |
| **Time to first value** | Days |
| **Time to production** | 1–2 weeks |
| **Vendor lock-in risk** | Low — LLM provider can be swapped via API abstraction layer. Tool calling patterns are portable. |

#### TCO Estimate (07-platform-selection.md, §4)

| Cost Category | Estimate | Notes |
|---------------|----------|-------|
| **Initial Development** | $5K–15K | Simple agent: prompt engineering, tool integration, output formatting, basic guardrails, eval dataset |
| **LLM Consumption (Annual)** | $1K–10K | Depends on volume. A stock price query is ~500 tokens round-trip. At 1,000 queries/day ≈ $2K–5K/year with a mid-tier model. |
| **Stock Price API (Annual)** | $0–2K | Free tier (Alpha Vantage, Finnhub) covers development + moderate production. Paid tier for real-time or high volume. |
| **Infrastructure (Annual)** | $1K–5K | Lightweight hosting (serverless function or small container). |
| **Operations (Annual)** | $2K–5K | Monitoring, prompt updates, eval maintenance. |
| **Total Year 1** | **$10K–35K** | |
| **Total Annual (Ongoing)** | **$5K–20K** | |

**ROI context:** At the T2 Basic level, expected time-to-ROI is 3–6 months if the agent replaces manual lookups or improves user engagement for a financial services product.

---

### Step 5 Summary

| Item | Decision | Justification |
|------|----------|---------------|
| **Implementation Tier** | **T2 (Enhanced)** | Single predetermined tool + structured output. All 7 features achievable at T2. No tier upgrade needed. |
| **Feature Maturity** | All features verified at T2 | F8/F9 = single tool/single data source (exact T2 match) |
| **NFR Gaps** | None critical | OAuth/SSO optional for v1. Response caching is a nice-to-have. |
| **Platform** | **Direct LLM API (Anthropic/OpenAI) + Python** | Simplest architecture, lowest cost, fastest time-to-value for T2 single-tool system. |
| **TCO (Year 1)** | $10K–35K | Lean initial investment with low ongoing costs. |
| **Upgrade Path** | T2 → T3 | Add orchestration framework (LangGraph) when multi-tool or multi-step is needed. Add RAG if knowledge base grounding becomes a requirement. |

---

### Step 5 Confirmation Gate

**Architect asks:**
Please review the Step 5 analysis:
1. Do you agree with **T2 (Enhanced)** as the implementation tier?
2. Does the **Direct LLM API + Python** platform recommendation fit your context?
3. Are the TCO estimates reasonable for your budget?
4. Any concerns about the NFR gaps or upgrade path?

Please add your confirmation below, then ask me to continue to Step 6 (Governance).

**User confirms:**
I am in agreement, please continue. 

---

## Step 6: GOVERN — Risk and Governance Posture

### MAP — Characterise the Risk Profile

| Dimension | Assessment |
|-----------|-----------|
| **Error tolerance** | **Moderate.** An incorrect stock price is inconvenient and could undermine trust, but the system is informational only — it cannot execute trades or provide financial advice. The blast radius is limited to user frustration and credibility loss. A stale or incorrect price will not cause direct financial harm because the user is informed this is not financial advice. |
| **Data scope and sensitivity** | **Low.** No PII is collected or stored. User queries contain only stock ticker symbols and natural language questions. Stock price data is public market data. No PHI, no regulated personal data. |
| **Dependency risks** | **Two external dependencies:** (1) LLM provider API — outage means complete service failure; (2) Stock price API — outage or rate limit means no data to report. Both are third-party services outside our operational control. |

### MEASURE — Define Quality Metrics and Thresholds

| Metric | Target | Measurement Method |
|--------|--------|-------------------|
| **Price accuracy** | 100% match with API source data | Automated: compare LLM output values against raw API response JSON. Any discrepancy = critical bug. |
| **Data freshness** | Clearly stated delay (e.g., "delayed 15 min") | Automated: validate that delay disclaimer is always present in output. |
| **Response completeness** | All requested fields present (price, high, low, volume, % change) | Automated: schema validation of structured output. |
| **Response latency** | P95 < 3 seconds | Observability: latency percentile tracking. |
| **Disclaimer presence** | 100% of responses include "not financial advice" | Automated: output validation rule. |
| **Tool call success rate** | > 99% | Observability: monitor API call success/failure rate. |
| **User satisfaction** | > 80% positive (thumbs up) | User feedback collection. |
| **Golden dataset** | 50 stock price queries with expected outputs | Build before launch. Cover: valid tickers, invalid tickers, after-hours queries, penny stocks, international stocks, edge cases. |
| **Human review rate** | 0% at steady state | System is fully automated for informational queries — no human review loop needed. Escalation path exists for user-reported errors. |

### MANAGE — Define Operational Controls

| Control Area | Implementation |
|-------------|----------------|
| **HITL checkpoints** | **None required.** System is informational only — no irreversible actions. User-reported errors trigger manual review. |
| **Input guardrails** | (1) Prompt injection detection — reject or sanitize adversarial inputs. (2) Input length limit — prevent context window abuse. (3) Ticker symbol validation — check against known ticker list before API call. |
| **Output guardrails** | (1) "Not financial advice" disclaimer appended to every response. (2) Output schema validation — ensures all required fields are present. (3) Numeric sanity check — flag obviously wrong values (negative prices, extreme outliers). |
| **PII and data handling** | No PII collected. User queries are logged for quality monitoring but contain no sensitive data. Retention policy: 90 days for request/response logs, then purge. |
| **Incident response** | **Kill-switch:** Disable the agent endpoint if the LLM produces harmful or misleading financial content. **Triggers for escalation:** (1) Price accuracy drops below 100% match. (2) Stock API returns errors for >5 minutes. (3) User reports factually incorrect information. **Fallback:** Return a graceful error message ("Unable to retrieve stock price at this time. Please try again shortly.") rather than hallucinated data. |
| **Cost controls** | (1) Per-user rate limiting (e.g., 100 queries/day). (2) LLM API spending alerts at $X/month threshold. (3) Stock API call budget monitoring. |

### GOVERN — Define Oversight and Improvement Cycles

| Governance Item | Policy |
|----------------|--------|
| **Audit trail** | All requests and responses logged with timestamp, user identifier (anonymous), ticker queried, raw API response, LLM output, and latency. Retention: 90 days. |
| **Model update cadence** | Review LLM model version quarterly or when provider announces a major update. Run golden dataset evaluation before and after any model change. No automatic model upgrades without evaluation gate. |
| **Prompt update process** | All prompt changes version-controlled in Git. Changes must pass golden dataset evaluation before deployment. Canary deployment for prompt changes (10% traffic for 24 hours before full rollout). |
| **Stakeholder review frequency** | Monthly: review user feedback summary, accuracy metrics, cost trends, and error logs. Quarterly: review model performance, API provider evaluation, and feature roadmap. |
| **Stock API provider review** | Quarterly: verify API terms of service compliance, data quality, uptime history. Maintain a backup API provider recommendation in case primary provider becomes unavailable or changes terms. |

### Step 6 Summary

| NIST RMF Phase | Key Controls |
|---------------|-------------|
| **MAP** | Error tolerance: moderate (informational only). No PII. Two external dependencies (LLM API, stock price API). |
| **MEASURE** | Price accuracy = 100% match. P95 latency < 3s. Disclaimer presence = 100%. Golden dataset of 50 queries. |
| **MANAGE** | Input guardrails (injection defense, ticker validation). Output guardrails (disclaimer, schema validation, sanity checks). Kill-switch for harmful output. Graceful fallback on API failure. Rate limiting. |
| **GOVERN** | 90-day audit trail. Quarterly model review with eval gate. Prompt changes version-controlled with canary deployment. Monthly stakeholder review. |

**Highest-priority risks and controls:**

| Risk | Severity | Control |
|------|----------|---------|
| LLM hallucinates stock price instead of using tool | High | Tool call validation — reject responses not backed by API data |
| Stock API outage | Medium | Graceful fallback message + monitoring alert |
| Output mistaken for financial advice | Medium | Mandatory "not financial advice" disclaimer on every response |
| Prompt injection | Low | Input guardrails + sanitization |

**Unresolved governance gaps:** None. The light governance posture is appropriate for an informational, no-PII, no-action T2 system.

---

### Step 6 Confirmation Gate

**Architect asks:**
Please review the governance posture above:
1. Do the MAP/MEASURE/MANAGE/GOVERN controls seem appropriate?
2. Are the risk priorities correctly ranked?
3. Any additional risks or controls you want to add?

Please add your confirmation below, then ask me to continue to the final output.

**User confirms:**
I am in agreement with the Step 6 governance posture. Please continue to the final output.


---

## Final Output — Deliverables Generated

**Date:** 2026-03-08

All 6 steps completed and confirmed. The following deliverables have been generated:

| # | Deliverable | Path |
|---|-------------|------|
| 1 | Proposed Solution Document (10 sections) | `proposed-solutions/stock-price-lookup-agent-2026-03-08.md` |
| 2 | Architecture Diagram (.drawio) | `proposed-solutions/stock-price-lookup-agent-2026-03-08.drawio` |
| 3 | Conversation Log (this file) | `conversation-log.md` |

### Architecture Definition of Done — Final Checklist

| # | Item | Status |
|---|------|--------|
| 1 | Archetype selected & justified | DONE |
| 2 | Architectural dimensions defined | DONE |
| 3 | Data Readiness Gate passed | DONE |
| 4 | Features confirmed via Matrix A | DONE |
| 5 | Feature dependencies satisfied | DONE |
| 6 | Components traced via Matrix C → Matrix B | DONE |
| 7 | Light Canvas passed (all components) | DONE |
| 8 | Anti-pattern check clean | DONE |
| 9 | Tier assigned & Feature Maturity verified | DONE |
| 10 | Platform selected with rationale | DONE |
| 11 | NFR checklist reviewed | DONE |
| 12 | Governance posture defined | DONE |

**Session Status: COMPLETE**

---
