# Generative AI & Agentic Use Case Archetypes: A Consolidated Guide

*Version 4.0 (Consolidated from v1-v3). Last Updated: 2026-01-20*

This document provides a comprehensive taxonomy of Generative AI and Agentic AI use cases. It synthesizes previous versions into a single, actionable guide for architects, developers, and product leaders. It is designed to help teams identify, define, and design AI-powered capabilities in a structured and risk-aware manner.

**Core Principles of this Taxonomy:**

- **Archetype, Not Interface:** It separates the core job-to-be-done (the *archetype*) from the interaction style (e.g., chat, API, proactive).
- **Value-Oriented Grouping:** Archetypes are grouped by the type of value they create (e.g., understanding content, generating insights, automating processes).
- **Risk-Aware by Design:** It aligns with the NIST AI Risk Management Framework by embedding risk considerations directly into the selection and design process.

---

## Part 1: The Four Architectural Dimensions

To define a complete use case, you must specify its position along four cross-cutting architectural dimensions. A use case is not just its core function; it is the combination of that function with these four characteristics.

| Dimension | Description | Key Considerations & Levels |
| --- | --- | --- |
| **1. Interaction Model** | The "how" of user and system interaction. This defines the user experience and the API surface. | **One-shot:** Simple, stateless request-response (e.g., summarizing a single article).<br>**Conversational:** Multi-turn dialogue allowing for clarification and refinement (e.g., a support chatbot).<br>**Proactive:** The system initiates action based on triggers or observations (e.g., a monitoring copilot that flags an anomaly).<br>**API-driven:** The capability is exposed as a programmatic interface for another system to consume. |
| **2. Autonomy Level** | The degree of independent action the system is permitted to take. This is a critical control plane. | **Assistive (Human-in-the-Loop for Execution):** The AI suggests actions, but a human must execute them. (e.g., suggesting a code change that a developer must accept).<br>**Semi-Autonomous (Human-in-the-Loop for Approval):** The AI can execute bounded steps but requires human approval before acting. (e.g., drafting an email and waiting for "send" confirmation).<br>**Fully Autonomous (Human-in-the-Loop for Audit):** The AI can execute end-to-end goals without intervention, with humans reviewing actions after the fact. (e.g., an agent that can book travel and is audited for budget compliance). |
| **3. Grounding Strategy** | The data and tools used to ensure factual accuracy, relevance, and timeliness. | **Ungrounded:** Relies on the model's general, pre-trained knowledge. Best for creative or unconstrained tasks.<br>**Curated Grounding (RAG):** The model's knowledge is augmented with a specific, curated body of information (e.g., internal documents, a knowledge base) via Retrieval-Augmented Generation.<br>**Live Grounding (Tool Use):** The model can use tools (e.g., call APIs, query databases, search the web) to access real-time, dynamic information. |
| **4. Governance Posture** | The required level of risk management, compliance, and oversight. | This is not a single choice but a set of constraints imposed by the domain. Considerations include:<br>- **Data Handling:** Requirements for PII, PHI, or other sensitive data.<br>- **Auditability:** The need for detailed logging of inputs, outputs, and intermediate steps.<br>- **Safety & Compliance:** The need for input/output filters, content classifiers, and adherence to legal or regulatory standards (e.g., GDPR, HIPAA). |

---

## Part 2: Use Case Archetype Groups

The following 12 archetypes are the core "what" of the use case. They are organized into three groups based on the primary value they deliver.

### Group A: Content & Knowledge Synthesis
*These archetypes focus on understanding, transforming, and creating content.*

#### 1. Content Generation
- **Description:** Create or rewrite content (text, code, images, audio, video) based on prompts, templates, or other inputs.
- **Typical Outputs:** Drafts, creative assets, translations, rewritten tone/style.
- **Sub-Cases from v1:**
    - *Text Generation:* Creating original written content including articles, reports, marketing copy, and documentation from prompts or outlines.
    - *Image & Video Generation:* Creating visual media such as illustrations, photos, and video clips from textual descriptions or reference materials.
    - *Audio & Music Generation:* Composing melodies, generating sound effects, creating voiceovers, or producing other audio content.
    - *Template & Draft Creation:* Generating initial drafts, boilerplate content, or structured templates for human refinement.
- **Common Patterns:** Prompt engineering, few-shot examples, structured output constraints (e.g., JSON schema), post-processing validation.
- **Primary Risks:** Hallucination, brand/compliance drift, intellectual property leakage, generation of unsafe or biased content.

#### 2. Summarization & Extraction
- **Description:** Condense information or pull structured data from unstructured or semi-structured inputs.
- **Typical Outputs:** Executive summaries, key-value fields from documents, named entities, timelines, obligations from contracts.
- **Sub-Cases from v1:**
    - *Text Transformation:* Converting existing content between formats, styles, tones, or languages (e.g., summarization, paraphrasing, translation).
    - *Document Analysis:* Extracting insights, key points, entities, or structured data from unstructured documents.
- **Common Patterns:** OCR/document parsing pipelines, schema-guided extraction, confidence scoring, human-in-the-loop for verification.
- **Primary Risks:** Silent extraction errors (subtle inaccuracies), bias in labeling, poor calibration of confidence scores, data retention issues with source documents.

#### 3. Grounded Q&A
- **Description:** Answer questions using a specific, curated body of knowledge, providing citations and evidence for the answers. This is the classic RAG pattern.
- **Typical Outputs:** Answers with source links, document snippets, and clear indications of what is known versus unknown.
- **Sub-Cases from v1:**
    - *Question Answering:* Providing direct answers to questions based on provided context, documents, or knowledge bases.
    - *Explanation & Education:* Breaking down complex topics into understandable explanations tailored to the audience's level.
- **Common Patterns:** Retrieval-Augmented Generation (RAG), chunking and embedding strategies, re-ranking of retrieved results, robust citation and provenance tracking.
- **Primary Risks:** Prompt injection via retrieved content, providing answers from stale or outdated knowledge, overconfident but incorrect answers, source misattribution.

#### 4. Research & Synthesis
- **Description:** Produce a higher-level, analytical artifact (e.g., a report, briefing, or literature review) by synthesizing information from many sources.
- **Typical Outputs:** Research briefs, competitive analysis reports, literature reviews, executive summaries with evidence.
- **Sub-Cases from v1:**
    - *Information Retrieval & Synthesis:* Finding, aggregating, and combining information from multiple sources into coherent summaries or reports.
    - *Research Assistance:* Supporting literature reviews, competitive analysis, market research, and exploratory investigations.
- **Common Patterns:** Iterative retrieval and decomposition (outline-first generation), evidence mapping, evaluation gates to check for contradictions.
- **Primary Risks:** Source quality issues (garbage-in, garbage-out), amplification of bias from sources, missing counter-evidence, non-reproducible results.

### Group B: Insight & Decision Support
*These archetypes focus on interpreting data and informing human decisions.*

#### 5. Data Interpretation & Analytics
- **Description:** Explain trends, anomalies, and insights from structured data (e.g., from dashboards, databases, or BI tools) in natural language.
- **Typical Outputs:** Narrative explanations of KPI changes, plain-language summaries of anomalies, answers to questions about data.
- **Sub-Cases from v1:**
    - *Data Interpretation:* Explaining patterns, anomalies, and trends in data in natural language.
    - *Report & Dashboard Narration:* Converting charts, metrics, and dashboards into narrative explanations.
- **Common Patterns:** Tool use for querying data sources (e.g., SQL, Python), constrained generation to ensure fidelity to the data.
- **Primary Risks:** Confident-but-wrong explanations of data (spurious correlations), governance and data access control gaps, misinterpretation of user intent.

#### 6. Recommendation & Personalization
- **Description:** Tailor content, workflows, or experiences to a user, segment, or context to increase relevance or effectiveness.
- **Typical Outputs:** Personalized content, next-best-action suggestions, adaptive learning plans, prioritized task lists.
- **Sub-Cases from v1:**
    - *Content Personalization:* Adapting content dynamically for specific audiences, contexts, or individual preferences.
    - *Recommendation Generation:* Providing actionable suggestions based on analysis of available information.
    - *Learning & Skill Development:* Providing personalized tutoring, practice exercises, and adaptive learning experiences.
- **Common Patterns:** User/context modeling, preference capture and memory (session or persistent), consent management for data use.
- **Primary Risks:** Privacy violations, creating filter bubbles or unfair outcomes, over-personalization leading to a poor user experience, data minimization failures.

#### 7. Simulation & Synthetic Data
- **Description:** Generate data, scenarios, or environments for training, testing, or what-if analysis.
- **Typical Outputs:** Synthetic datasets for model training, adversarial test cases for red-teaming, catalogs of simulated scenarios.
- **Sub-Cases from v1:**
    - *Synthetic Dataset Creation:* Generating high-quality, structured or unstructured data for training AI models, especially where real-world data is scarce or private.
    - *Adversarial & Edge Case Testing:* Generating novel and challenging scenarios to test the robustness and safety of AI systems.
    - *Scenario Analysis:* Exploring "what-if" scenarios and their potential outcomes.
- **Common Patterns:** Constraint-based generation, statistical validation to match real-world distributions, privacy checks to prevent data leakage.
- **Primary Risks:** Leakage of sensitive patterns from source data, unrealistic data distributions ("overfitting to synthetic reality"), introducing unexpected biases.

### Group C: Process & Task Automation
*These archetypes focus on taking action and executing multi-step processes in systems.*

#### 8. Software Development Acceleration
- **Description:** Assist with coding, testing, reviewing, and debugging tasks across the software development lifecycle.
- **Typical Outputs:** Code diffs, unit tests, pull request summaries, refactoring suggestions, debugging hypotheses, API documentation.
- **Sub-Cases from v1:**
    - *Code Generation:* Writing code from natural language descriptions, specifications, or examples.
    - *Code Review & Analysis:* Reviewing code for bugs, security issues, style violations, and improvement opportunities.
    - *Refactoring & Modernization:* Transforming code to improve structure, performance, or migrate to new patterns/frameworks.
    - *Documentation Generation:* Creating technical documentation, API references, and inline comments from code.
    - *Debugging & Troubleshooting:* Analyzing errors, suggesting fixes, and helping diagnose software issues.
- **Common Patterns:** RAG over the codebase, sandboxed code execution, linting and testing loops, integration with IDEs and CI/CD pipelines.
- **Primary Risks:** Insertion of vulnerable or non-performant code, license and IP compliance issues, unsafe automation in production environments, brittle changes without adequate tests.

#### 9. Structured Workflow Automation
- **Description:** Automate deterministic business processes where GenAI is used for specific steps requiring natural language understanding or generation.
- **Typical Outputs:** Completed forms, drafted emails sent for approval, reconciled records, populated CRM fields.
- **Sub-Cases from v1:**
    - *Workflow Automation:* Executing complex business processes, such as data entry, report generation, or system updates, by integrating with multiple tools and APIs.
    - *Writing Assistance:* Helping draft, edit, proofread, and improve emails, documents, and communications.
- **Common Patterns:** Integration with workflow engines (e.g., BPM, RPA), idempotent tool calls, human-in-the-loop approval steps.
- **Primary Risks:** Incorrect side-effects in external systems, handling of partial failures, creating "automation debt" that is hard to maintain, unclear accountability for errors.

#### 10. Agentic Task Automation
- **Description:** Plan and execute multi-step, dynamic tasks by selecting and orchestrating tools (APIs, databases, etc.) and adapting to observations.
- **Typical Outputs:** A completed end-to-end task (e.g., a booked trip, a provisioned server, a completed investigation), along with a detailed action log.
- **Sub-Cases from v1:**
    - *Interactive Task Execution:* Collaborating with a user in a conversational manner to complete tasks that require clarification, feedback, or step-by-step guidance.
    - *Autonomous Customer Agents:* Handling complex customer service journeys end-to-end, from initial query to resolution, including follow-ups and transactions.
- **Common Patterns:** Planning and execution loops (e.g., ReAct), function/tool calling, state management, robust error handling, human checkpoints for high-stakes actions.
- **Primary Risks:** Tool misuse (using the wrong tool or parameters), prompt injection leading to unauthorized actions, runaway costs from looping, unsafe actions with real-world consequences.

#### 11. Operations & Monitoring Copilot
- **Description:** Assist human operators by monitoring signals, diagnosing issues, and suggesting or taking controlled remediation actions.
- **Typical Outputs:** Incident summaries, root-cause hypotheses, remediation playbooks, drafts of status communications.
- **Sub-Cases from v1:**
    - *Proactive System Monitoring:* Actively monitoring systems, identifying potential issues, and taking corrective actions or escalating to humans as needed.
- **Common Patterns:** Integrations with observability tools (e.g., Datadog, Splunk), runbooks-as-code, strict permissions and access controls, detailed audit logs.
- **Primary Risks:** Incorrect remediation actions causing further outages, alert fatigue amplification, permission creep, poor auditability of automated actions.

#### 12. AI Governance & Assurance
- **Description:** Use GenAI to support Governance, Risk, and Compliance (GRC) functions, such as policy checks, control testing, and audit evidence gathering.
- **Typical Outputs:** Compliance reports, risk registers, red-teaming findings, drafts of model cards and datasheets.
- **Sub-Cases from v1:**
    - *Risk Assessment:* Identifying potential risks, issues, or concerns and their likelihood/impact.
    - *Legal & Compliance:* Analyzing contracts, regulations, case law, and supporting compliance workflows.
- **Common Patterns:** RAG over compliance frameworks and internal policies, evaluation harnesses for testing other AI systems, detailed audit and provenance logging.
- **Primary Risks:** False assurance from automated checks, generating incomplete or misleading evidence, over-reliance on automated judgments for complex compliance questions.

---

## Part 3: Use Case Selection Framework (NIST RMF Aligned)

Use this framework to guide your design and risk management activities, moving from a high-level concept to a well-defined, governable system.

### 1. MAP: Define the Context

- **What is the primary archetype?** Select one from the 12 above that represents the core value proposition.
- **What are the four architectural dimensions?** Define the desired Interaction Model, Autonomy Level, Grounding Strategy, and Governance Posture.
- **Who are the stakeholders?** Identify the end-users, operators, beneficiaries, and any parties who might be negatively impacted.
- **What is the expected benefit?** Clearly state the goal, whether it's efficiency gains, a new capability, or risk reduction.

### 2. MEASURE: Assess the Risks

- **What is the error tolerance?** Is the output a low-stakes draft or a regulated financial decision?
- **What is the potential blast radius of an error?** An incorrect summary has a different impact than an incorrect server shutdown command.
- **How will you measure quality and effectiveness?** Define metrics for offline evaluation (e.g., accuracy, relevance), online monitoring (e.g., latency, drift), and user feedback.
- **What are the primary risks for this archetype?** Refer to the "Primary Risks" listed for your chosen archetype as a starting point.

### 3. MANAGE: Implement Controls

- **What is the required oversight model?** Based on the Autonomy Level, define the specific human-in-the-loop stages: review, approval, or audit.
- **What technical controls are needed?** This can include input validation, output filtering and guardrails, fine-grained tool access controls, and provenance logging.
- **How will you handle failures and escalations?** Design procedures for rollback, human handoff, and incident response when the AI fails or encounters a situation it cannot handle.

### 4. GOVERN: Document & Monitor

- **How will the use case be documented?** Create and maintain essential documentation like model cards, datasheets, and architectural diagrams.
- **What is the continuous monitoring strategy?** Implement logging, metrics for performance and concept drift, and alerting mechanisms for anomalies or failures.
- **What is the process for updating the system?** Define a change management process that includes re-evaluation, regression testing, and stakeholder notification.

---

## Appendix: Quick Architectural Tier Heuristic

This heuristic can help map a use case to a common implementation maturity model.

- **Tier 1: Simple Application**
  - **Archetypes:** Content Generation, Summarization.
  - **Architecture:** Single API call to a model; minimal integration. Ungrounded. Assistive.
- **Tier 2: Grounded Application**
  - **Archetypes:** Grounded Q&A, Data Interpretation, Structured Workflow Automation.
  - **Architecture:** Uses RAG for grounding, produces structured outputs, may have session memory. Curated Grounding. Assistive or Semi-Autonomous.
- **Tier 3: Agentic Application**
  - **Archetypes:** Agentic Task Automation, Software Development Acceleration, Operations Copilot.
  - **Architecture:** Multi-step orchestration, tool use, conditional logic, strong observability. Live Grounding. Semi-Autonomous or Fully Autonomous.
- **Tier 4: Governed, Multi-Agent System**
  - **Archetypes:** AI Governance, complex multi-actor workflows.
  - **Architecture:** Involves multiple agents collaborating, strong governance and auditability, and human-in-the-loop for complex oversight. All grounding strategies. All autonomy levels.
