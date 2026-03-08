# Stock Price Lookup Agent — Proposed Solution

*Generated: 2026-03-08 | Framework: GenAI & Agentic Architecture Framework v5.5*

---

## 1. Executive Summary

Retail investors want quick, clean access to current stock prices without navigating cluttered financial websites. Today, users rely on platforms like Yahoo Finance or Google Search, which bury the core data — price, daily range, volume, percentage change — behind ads, news feeds, and multi-page navigation, particularly on mobile devices.

The proposed solution is a conversational stock price lookup agent that accepts a natural language query (e.g., "What's the price of AAPL?") and returns a structured, human-readable summary of the stock's current performance — including price, daily high/low, trading volume, and percentage change — drawn from a live market data API. The system is purely informational, includes a clear "not financial advice" disclaimer, and requires no user authentication or personal data collection.

The expected business outcome is a frictionless, sub-3-second stock price lookup experience that replaces multi-step manual workflows. The solution is designed as a lean T2 (Enhanced) system with a total Year 1 cost of $10K–35K, achievable in 1–2 weeks, with a clear upgrade path to multi-turn conversations, additional data sources, and richer analytics in future iterations.

---

## 2. Use Case Archetype

### Primary Archetype

| Field | Value |
|-------|-------|
| **Archetype** | #5 — Data Interpretation & Analytics |
| **Group** | B: Insight & Decision Intelligence |
| **Description** | Explain trends and act on anomalies from structured data, from narrative insight to automated response. |

### Composition Pattern

**None** — this is a single-archetype solution. No archetype composition is required.

### Four Architectural Dimensions

| Dimension | Selection | Rationale |
|-----------|-----------|-----------|
| **Interaction Model** | One-shot | Stateless request-response. User asks for a stock price, receives the data, interaction complete. |
| **Autonomy Level** | Assistive (HITL for Execution) | The agent retrieves and presents data; the user decides what to do with it. No autonomous actions. |
| **Grounding Strategy** | Live Grounding (Tool Use) | Real-time stock price data via API. No static knowledge base or RAG pipeline. |
| **Governance Posture** | Light | Informational only, no PII, no financial advice, no regulated data. Disclaimer is the primary governance control. |

---

## 3. Capability Features

| Feature ID | Feature Name | Required / Optional | Rationale |
|-----------|-------------|-------------------|-----------|
| **F3** | Structured Output Generation | ● Required | Format stock data (price, high/low, volume, % change) consistently for user consumption |
| **F5** | Citation & Provenance | ✅ Context-selected (Optional) | Light implementation: data source attribution and delay disclaimer (e.g., "via Alpha Vantage, delayed 15 min") |
| **F8** | Tool Orchestration | ● Required | Core mechanism — call the stock price API to retrieve live data |
| **F9** | Real-Time Data Access | ● Required | Query live market data rather than relying on stale training knowledge |
| **F12** | Safety & Content Controls | ● Required (implicit) | Prompt injection defense, "not financial advice" disclaimer enforcement |
| **F13** | Continuous Learning & Feedback | ● Required (implicit) | User feedback collection (thumbs up/down), quality monitoring, golden dataset evaluation |
| **F15** | Auditability & Compliance | ✅ Context-selected (Optional) | Basic request/response logging with 90-day retention |

### Deferred Features

| Feature ID | Feature Name | Rationale for Deferral |
|-----------|-------------|----------------------|
| F1 | Contextual Grounding | No knowledge base; live API grounding only |
| F2 | Multi-Source Synthesis | Single data source for v1 |
| F4 | Interactive Refinement | One-shot interaction model; deferred to future multi-turn version |
| F6 | Adaptive Personalization | No user profiles or personalization needed |
| F7 | Autonomous Planning | Single tool call, no multi-step planning |
| F10 | Long-Term Memory | Stateless one-shot interaction |
| F11 | Human Oversight Gates | Inform-only — no actions to approve |
| F14 | Multi-Agent Collaboration | Single agent system |

### Feature Dependencies

All dependencies satisfied:
- F9 (Real-Time Data) depends on F8 (Tool Orchestration) → ✅ F8 included
- F13 (Learning & Feedback) depends on F15 (Auditability) → ✅ F15 included
- F5 (Citation) typically depends on F1 (Contextual Grounding) → ✅ Acceptable exception: source is the API itself, not a retrieved document

---

## 4. Technical Components

### Universal Components (Required by All Archetypes)

| Component | §Ref | Features Enabled | Complexity | Status | Rationale |
|-----------|------|-----------------|------------|--------|-----------|
| Foundation Models | §1.1 | F3, F9 | ★☆☆☆☆ | ✅ Include | Core LLM for query interpretation and natural-language response generation |
| Prompting Techniques | §1.2 | F3, F5, F8, F12 | ★★☆☆☆ | ✅ Include | System prompt defines behavior, output format, disclaimer, and tool calling instructions |
| Model Selection Strategy | §1.3 | All (prerequisite) | ★★☆☆☆ | ✅ Include | Evaluate cost-quality frontier; a smaller model (e.g., Claude Haiku, GPT-4o-mini) may suffice |

### Augmentation Layer

| Component | §Ref | Features Enabled | Complexity | Status | Rationale |
|-----------|------|-----------------|------------|--------|-----------|
| RAG & Retrieval | §2.1 | — | — | ❌ Exclude | No knowledge base needed — data comes from live API |
| Output Processing | §2.2 | F3, F5, F8 | ★★☆☆☆ | ✅ Include | Schema validation, citation string formatting, structured output parsing |

### Orchestration Layer

| Component | §Ref | Features Enabled | Complexity | Status | Rationale |
|-----------|------|-----------------|------------|--------|-----------|
| Context Management | §3.1 | — | — | ❌ Exclude | One-shot — no multi-turn context needed |
| Memory Systems | §3.2 | — | — | ❌ Exclude | Stateless interaction |
| Reasoning & Planning | §3.3 | — | — | ❌ Exclude | Single tool call — no planning needed |
| Tool Use & Function Calling | §3.4 | F8, F9 | ★★☆☆☆ | ✅ Include | Single function call to stock price API. Native function calling via LLM provider. |

### Autonomy Layer

| Component | §Ref | Features Enabled | Complexity | Status | Rationale |
|-----------|------|-----------------|------------|--------|-----------|
| Agentic Architectures | §4.1 | — | — | ❌ Exclude | No agent loop needed |
| Workflow Orchestration | §4.2 | — | — | ❌ Exclude | Single step — no workflow |
| HITL Patterns | §4.3 | — | — | ❌ Exclude | Inform-only — no actions to gate |
| Agent Runtime | §4.4 | — | — | ❌ Exclude | No persistent agent process |

### Operational Excellence (Cross-Cutting)

| Component | §Ref | Features Enabled | Complexity | Status | Rationale |
|-----------|------|-----------------|------------|--------|-----------|
| Safety & Guardrails | §5.1 | F12 | ★★☆☆☆ | ✅ Include | Input sanitization, prompt injection defense, "not financial advice" disclaimer enforcement |
| Evaluation & Testing | §5.2 | F3, F5, F8, F9, F12, F13, F15 | ★★☆☆☆ | ✅ Include | 50-query golden dataset, automated output validation, regression testing |
| Infrastructure & Deployment | §5.3 | F8, F9, F13 | ★★☆☆☆ | ✅ Include | Serverless or container hosting, API gateway |
| Observability | §5.4 | F8, F9, F12, F13, F15 | ★★☆☆☆ | ✅ Include | Structured logging, latency tracking, error rate monitoring, request tracing |
| Cost Management | §5.5 | Cross-cutting | ★☆☆☆☆ | ✅ Include | LLM API spending alerts, stock API usage monitoring, per-user rate limiting |
| Resilience & Fault Tolerance | §5.6 | F8, F9 | ★★☆☆☆ | ✅ Include | Retry with exponential backoff for API failures, graceful fallback messaging |
| Performance & Latency | §5.7 | F9 | ★☆☆☆☆ | ✅ Include | P95 < 3s target, latency percentile monitoring |
| DevOps & Change Management | §5.8 | Cross-cutting | ★★☆☆☆ | ✅ Include | CI/CD pipeline, prompt version control in Git, canary deployment for prompt changes |
| Data Readiness | §5.9 | Prerequisite | ★☆☆☆☆ | ✅ Include | Stock API contract verification, schema documentation, delay characterization |
| Identity & Authorization | §5.10 | Cross-cutting | ★☆☆☆☆ | ✅ Include | Secure API key management (secrets vault), optional user-level rate limiting |

---

## 5. Component Evaluation (Light Canvas)

This system is T2 with fewer than 10 capability components. The **Light Canvas** (3 questions) was applied per 05-component-selection-guide.md.

### Capability Components

| Component | WHY? (Feature enabled) | WHAT IF? (Risk mitigated) | CAN WE SHIP? (Maturity) | Decision |
|-----------|----------------------|--------------------------|------------------------|----------|
| **Foundation Models** (§1.1) | **Essential** — F3, F9. Core of the system; interprets queries, generates responses. | **Critical** — Without it, no system exists. Prevents raw JSON exposure. | **Battle-tested** — Major LLM APIs have production SLAs. | ✅ Include |
| **Prompting** (§1.2) | **Essential** — F3, F5, F8, F12. System prompt defines entire behavior. | **Important** — Poor prompting → inconsistent output, missing disclaimers, unreliable tool calls. | **Battle-tested** — Most mature technique in the GenAI stack. | ✅ Include |
| **Model Selection** (§1.3) | **High Value** — Structural prerequisite. Right model = right cost/quality balance. | **Important** — Wrong model wastes budget or delivers poor quality. | **Battle-tested** — Evaluation methodology well-established. | ✅ Include |
| **Output Processing** (§2.2) | **Essential** — F3, F5, F8. Schema validation, citation formatting, response parsing. | **Important** — Without validation, malformed or incomplete responses reach users. | **Battle-tested** — JSON Schema, Pydantic, structured output modes. | ✅ Include |
| **Tool Use & Functions** (§3.4) | **Essential** — F8, F9. The agent calls the stock price API. | **Critical** — Without tool calling, the LLM would hallucinate stock prices. | **Battle-tested** — Native function calling supported by all major providers. | ✅ Include |

### OE Components

| Component | WHY? | WHAT IF? | CAN WE SHIP? | Decision |
|-----------|------|----------|---------------|----------|
| Safety & Guardrails (§5.1) | Essential (F12) | Critical — unfiltered output mistaken for financial advice | Battle-tested | ✅ Include |
| Evaluation & Testing (§5.2) | Essential (F13) | Important — quality degrades silently without eval | Battle-tested | ✅ Include |
| Infrastructure (§5.3) | Essential | Critical — no infrastructure = no service | Battle-tested | ✅ Include |
| Observability (§5.4) | High Value (F15) | Important — failures invisible without monitoring | Battle-tested | ✅ Include |
| Cost Management (§5.5) | High Value | Important — unmonitored API costs spike | Battle-tested | ✅ Include |
| Resilience (§5.6) | High Value (F8, F9) | Important — API outages break service | Battle-tested | ✅ Include |
| Performance (§5.7) | High Value (F9) | Minor — not latency-critical but affects UX | Battle-tested | ✅ Include |
| DevOps (§5.8) | High Value | Important — manual deploys slow iteration | Battle-tested | ✅ Include |
| Data Readiness (§5.9) | Essential | Important — broken API contract = broken service | Battle-tested | ✅ Include |
| Identity & Auth (§5.10) | High Value | Minor — API key compromise is low-risk | Battle-tested | ✅ Include |

### Anti-Pattern Check

| Anti-Pattern | Status |
|-------------|--------|
| Kitchen Sink | ✅ Clear — 15 components, 9 excluded |
| Premature Complexity | ✅ Clear — no agents, multi-agent, planning, or memory |
| Observability Afterthought | ✅ Clear — observability included from day one |
| Missing Evaluation | ✅ Clear — golden dataset and eval pipeline included |
| Tech-First Thinking | ✅ Clear — selection traced from use case → features → components |
| Set-and-Forget | ✅ Clear — F13 feedback and continuous evaluation included |

---

## 6. Implementation Tier and Platform

### Implementation Tier

| Field | Value |
|-------|-------|
| **Confirmed Tier** | **T2 (Enhanced)** |
| **Justification** | Single predetermined tool (stock price API) + structured output. All 7 confirmed features are fully achievable at T2 per the Feature Maturity matrix. No features require T3 or T4 capability. |

### Feature Maturity Verification

| Feature | T2 Capability | Our Requirement | Match |
|---------|---------------|-----------------|-------|
| F3 Structured Output | Schema-constrained with validation | Format price data as structured response | ✅ |
| F5 Citation & Provenance | Document-level citations | Data source attribution string | ✅ |
| F8 Tool Orchestration | Single predetermined tool | Single stock price API call | ✅ Exact match |
| F9 Real-Time Data Access | Single data source queries | Single stock price API | ✅ Exact match |
| F12 Safety Controls | Custom filters + PII detection | Disclaimer + input filtering | ✅ |
| F13 Learning & Feedback | User feedback + basic metrics | Thumbs up/down + quality monitoring | ✅ |
| F15 Auditability | User action + output logging | Request/response logging | ✅ |

### NFR Gaps and Mitigations

| NFR Item | Status | Mitigation |
|----------|--------|-----------|
| OAuth/SSO | Optional for v1 | Add when user authentication is needed |
| RBAC | Optional for v1 | Single-role system initially |
| Response caching | Nice-to-have | Add if API costs or latency become a concern |
| All other T2 NFRs | ✅ Satisfied | See NFR checklist in conversation log |

### Platform Selection

| Field | Value |
|-------|-------|
| **Platform** | **Direct LLM API (Anthropic Claude or OpenAI) + Python** |
| **Decision rationale** | Simplest architecture for a T2 single-tool system. Native function calling, no framework overhead, direct control over prompts and tools. Lowest cost and fastest time-to-value. |
| **Decision tree path** | T2 → No M365 commitment → No cloud provider lock-in → OpenAI API + orchestration framework (framework optional for single-tool) |
| **Tier support** | T1–T2 fully supported |
| **Skill requirements** | Python + API integration (standard developer skills) |
| **Time to first value** | Days |
| **Time to production** | 1–2 weeks |
| **Vendor lock-in risk** | Low — LLM provider swappable via abstraction layer |

### TCO

| Cost Category | Estimate | Notes |
|---------------|----------|-------|
| Initial Development | $5K–15K | Prompt engineering, tool integration, output formatting, guardrails, eval dataset |
| LLM Consumption (Annual) | $1K–10K | ~500 tokens/query. At 1,000 queries/day ≈ $2K–5K/year with mid-tier model |
| Stock Price API (Annual) | $0–2K | Free tier for dev; paid tier for real-time or high volume |
| Infrastructure (Annual) | $1K–5K | Serverless function or small container |
| Operations (Annual) | $2K–5K | Monitoring, prompt updates, eval maintenance |
| **Total Year 1** | **$10K–35K** | |
| **Total Annual (Ongoing)** | **$5K–20K** | |

### Upgrade Path (T2 → T3)

| Trigger | What Changes |
|---------|-------------|
| Multi-turn conversation needed | Add Context Management (§3.1), Memory Systems (§3.2), upgrade to Conversational interaction model |
| Multiple data sources needed | Add multi-tool orchestration, possibly RAG for market news |
| Multi-step analytics needed | Add Workflow Orchestration (§4.2), potentially Reasoning & Planning (§3.3) |
| Framework needed | Add LangGraph or similar orchestration framework |
| New NFRs | Add distributed tracing, circuit breakers, HITL checkpoints per T3 checklist |

---

## 7. Governance Posture

### MAP — Risk Profile

| Dimension | Assessment |
|-----------|-----------|
| Error tolerance | Moderate — incorrect price is inconvenient but not harmful (informational only, no trades) |
| Data scope & sensitivity | Low — no PII, no PHI. Public market data only. |
| Dependency risks | Two external: LLM provider API, stock price API. Both third-party. |

### MEASURE — Quality Metrics

| Metric | Target | Method |
|--------|--------|--------|
| Price accuracy | 100% match with API source | Automated: compare LLM output vs. raw API response |
| Data freshness | Delay clearly stated | Automated: validate disclaimer presence |
| Response completeness | All fields present | Automated: schema validation |
| Response latency | P95 < 3s | Observability: percentile tracking |
| Disclaimer presence | 100% | Automated: output validation |
| Tool call success rate | > 99% | Observability: API monitoring |
| User satisfaction | > 80% positive | User feedback (thumbs up/down) |
| Golden dataset | 50 queries | Built before launch |

### MANAGE — Operational Controls

| Control | Implementation |
|---------|----------------|
| HITL checkpoints | None — informational only |
| Input guardrails | Prompt injection detection, input length limit, ticker validation |
| Output guardrails | Mandatory disclaimer, schema validation, numeric sanity check |
| PII handling | No PII collected. 90-day log retention, then purge. |
| Incident response | Kill-switch for harmful output. Escalation triggers: accuracy drop, API errors >5 min, user-reported errors. Graceful fallback messaging. |
| Cost controls | Per-user rate limiting, spending alerts, API budget monitoring |

### GOVERN — Oversight & Improvement

| Item | Policy |
|------|--------|
| Audit trail | All requests/responses logged. 90-day retention. |
| Model update cadence | Quarterly review. Golden dataset evaluation before/after any change. |
| Prompt update process | Git-versioned. Golden dataset eval gate. Canary deployment (10% / 24h). |
| Stakeholder review | Monthly: feedback, accuracy, costs. Quarterly: model, API provider, roadmap. |
| API provider review | Quarterly: ToS compliance, data quality, uptime, backup provider identified. |

---

## 8. Architecture Sketch

See the companion diagram: `proposed-solutions/stock-price-lookup-agent-2026-03-08.drawio`

The architecture follows **Pattern A: Simple Assistant** (06-implementation-tiers.md, §5) extended with a single tool call — positioning it at the boundary between Pattern A and Pattern B, but without RAG:

```
┌──────────────────────────────────────────────────────────────────────┐
│                          USER INTERFACE                              │
│                    (Chat UI / API Endpoint)                          │
│                         ┌─────────┐                                 │
│                         │  User   │                                 │
│                         └────┬────┘                                 │
└──────────────────────────────┼───────────────────────────────────────┘
                               │ Query: "What's the price of AAPL?"
                               ▼
┌──────────────────────────────────────────────────────────────────────┐
│                     SAFETY & GUARDRAILS (§5.1)                      │
│              Input validation · Injection defense                    │
└──────────────────────────────┬───────────────────────────────────────┘
                               ▼
┌──────────────────────────────────────────────────────────────────────┐
│                     FOUNDATION LAYER                                 │
│  ┌─────────────────────┐   ┌──────────────────────────────────┐     │
│  │ Foundation Model     │   │ Prompting (§1.2)                │     │
│  │ (§1.1)              │◄──│ System prompt: format, disclaimer,│     │
│  │ LLM API             │   │ tool instructions, few-shot       │     │
│  │ (Claude/GPT)        │   └──────────────────────────────────┘     │
│  └─────────┬───────────┘                                            │
│            │ Function call: get_stock_price(ticker="AAPL")          │
└────────────┼────────────────────────────────────────────────────────┘
             ▼
┌──────────────────────────────────────────────────────────────────────┐
│                     ORCHESTRATION LAYER                              │
│  ┌─────────────────────────────────────────────┐                    │
│  │ Tool Use & Function Calling (§3.4)          │                    │
│  │ Single function: get_stock_price()           │                    │
│  │ ┌─────────────────────────────────────────┐ │                    │
│  │ │ Stock Price API                         │ │                    │
│  │ │ (Alpha Vantage / Finnhub / Polygon)     │ │                    │
│  │ │ Returns: {price, high, low, vol, pct}   │ │                    │
│  │ └─────────────────────────────────────────┘ │                    │
│  └──────────────────────┬──────────────────────┘                    │
└─────────────────────────┼───────────────────────────────────────────┘
                          │ API response JSON
                          ▼
┌──────────────────────────────────────────────────────────────────────┐
│                     AUGMENTATION LAYER                               │
│  ┌─────────────────────────────────────────────┐                    │
│  │ Output Processing (§2.2)                    │                    │
│  │ Schema validation · Citation formatting      │                    │
│  │ Disclaimer injection · Structured response   │                    │
│  └──────────────────────┬──────────────────────┘                    │
└─────────────────────────┼───────────────────────────────────────────┘
                          ▼
┌──────────────────────────────────────────────────────────────────────┐
│                     SAFETY & GUARDRAILS (§5.1)                      │
│              Output validation · Disclaimer check                    │
└──────────────────────────┬───────────────────────────────────────────┘
                           │ Formatted response
                           ▼
                    ┌──────────────┐
                    │    User      │
                    └──────────────┘

┌──────────────────────────────────────────────────────────────────────┐
│              OPERATIONAL EXCELLENCE (Cross-Cutting)                  │
│  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐ ┌────────────┐ │
│  │ Observability│ │ Evaluation & │ │ Resilience   │ │ Cost Mgmt  │ │
│  │ (§5.4)      │ │ Testing      │ │ (§5.6)       │ │ (§5.5)     │ │
│  │ Logging     │ │ (§5.2)       │ │ Retry/       │ │ Spending   │ │
│  │ Metrics     │ │ Golden       │ │ Backoff/     │ │ Alerts     │ │
│  │ Tracing     │ │ Dataset      │ │ Fallback     │ │ Rate Limit │ │
│  └──────────────┘ └──────────────┘ └──────────────┘ └────────────┘ │
│  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐ ┌────────────┐ │
│  │ DevOps       │ │ Performance  │ │ Data Ready   │ │ Identity & │ │
│  │ (§5.8)      │ │ (§5.7)       │ │ (§5.9)       │ │ Auth       │ │
│  │ CI/CD       │ │ Latency      │ │ API Contract │ │ (§5.10)    │ │
│  │ Prompt VCS  │ │ Monitoring   │ │ Verification │ │ API Keys   │ │
│  └──────────────┘ └──────────────┘ └──────────────┘ └────────────┘ │
└──────────────────────────────────────────────────────────────────────┘
```

### Colour Conventions

| Layer | Colour (Fill / Stroke) | Components |
|-------|----------------------|------------|
| Foundation | Orange (#ffe6cc / #d79b00) | Foundation Models, Prompting |
| Augmentation | Purple (#e1d5e7 / #9673a6) | Output Processing |
| Orchestration | Green (#d5e8d4 / #82b366) | Tool Use & Function Calling |
| OE / Infrastructure | Dark (#bac8d3 / #23445d) | All OE components |
| User Interface | Gray (#f5f5f5 / #666666) | User, inputs/outputs |

---

## 9. Architecture Definition of Done

| # | Checklist Item | Status | Step |
|---|---------------|--------|------|
| 1 | Archetype(s) identified; if composite, composition pattern defined | ✅ Confirmed — Archetype 5, no composition | Step 1 |
| 2 | Four Architectural Dimensions defined | ✅ Confirmed — One-shot / Assistive / Live Grounding / Light governance | Step 1 |
| 3 | Data Readiness Gate passed; no unresolved red flags | ✅ PASS — zero red flags | Step 1 |
| 4 | Required features confirmed; optional features evaluated against dimensions and dependencies | ✅ Confirmed — 7 features selected, 8 deferred with rationale | Step 2 |
| 5 | Feature dependencies traced; all prerequisites included | ✅ All dependencies satisfied (F9→F8, F13→F15) | Step 2 |
| 6 | Components selected; each evaluated with the Seven Questions | ✅ 15 components, all pass Light Canvas | Steps 3–4 |
| 7 | Anti-patterns checked | ✅ Zero anti-patterns detected | Step 4 |
| 8 | Implementation tier confirmed; Feature Maturity matrix checked | ✅ T2 confirmed; all 7 features achievable at T2 | Step 5 |
| 9 | NFR checklist items reviewed for the target tier | ✅ All T2 NFRs satisfied; OAuth/caching optional | Step 5 |
| 10 | Platform selected with organisational fit rationale | ✅ Direct LLM API + Python | Step 5 |
| 11 | Governance posture defined: MAP / MEASURE / MANAGE / GOVERN | ✅ All four phases defined | Step 6 |
| 12 | Upgrade path documented if starting below target tier | ✅ T2→T3 triggers documented | Step 5 |

**Result: All 12 items confirmed. Architecture Definition of Done is COMPLETE.**

---

## 10. Open Questions and Next Steps

### Open Questions

| # | Question | Owner | Priority |
|---|----------|-------|----------|
| 1 | Which stock price API to use? Evaluate Alpha Vantage, Finnhub, Polygon for free tier limits, data freshness, and ToS. | Developer | High — blocks development |
| 2 | Which LLM provider and model? Run cost-quality evaluation with golden dataset across Claude Haiku, GPT-4o-mini, and Gemini Flash. | Developer | High — blocks development |
| 3 | What hosting platform? Serverless (AWS Lambda, Google Cloud Functions) vs. container (Cloud Run, ECS). | Developer | Medium |
| 4 | What is the user-facing interface? Chat widget, standalone web app, API endpoint, or messaging platform integration? | Product | Medium |
| 5 | What is the expected query volume at launch? Affects API tier and cost projections. | Product | Medium |

### Recommended Build Sequence

| Phase | Duration | Deliverables |
|-------|----------|-------------|
| **Phase 1: Foundation** | Days 1–3 | Model selection evaluation. Stock API selection and integration. System prompt engineering. Basic function calling working end-to-end. |
| **Phase 2: Quality** | Days 4–7 | Golden dataset (50 queries). Output schema validation. Disclaimer enforcement. Input guardrails. Automated evaluation pipeline. |
| **Phase 3: Production** | Days 8–14 | CI/CD pipeline. Observability (logging, metrics, tracing). Resilience (retry, fallback). Cost controls (rate limiting, spending alerts). API key secrets management. User feedback collection. |
| **Phase 4: Launch** | Day 14+ | Canary deployment. Monitor accuracy, latency, user feedback. Weekly quality reviews for first month. |

### Future Iteration Roadmap

| Version | Features Added | Tier Impact |
|---------|---------------|-------------|
| **v2** | Multi-turn conversation (follow-up questions, comparisons) | T2 (add Context Management, Memory) |
| **v3** | Multiple data sources (news, fundamentals, analyst ratings) | T2→T3 (add multi-tool orchestration) |
| **v4** | Price alerts, watchlist management | T3 (add Workflow Orchestration, HITL) |
| **v5** | Brokerage integration (trade execution) | T3→T4 (add Agentic, regulatory compliance) |
