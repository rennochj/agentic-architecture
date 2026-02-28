# Technical Components of Generative AI & Agentic AI Solutions

*Version 3.0. Last Updated: 2026-02-27*

A comprehensive catalog of the technical building blocks that comprise modern GenAI and Agentic AI systems. This document is the Layer 3 reference for the GenAI & Agentic Architecture Framework.

**How to use this document**: After identifying your required capability features (Layer 2), use this catalog to understand the technical components that enable those features. Each component category links back to the features it supports.

---

## Component Architecture Overview

Components are organized into four progressive maturity layers plus cross-cutting Operational Excellence concerns:

```
┌─────────────────────────────────────────────────────────────────┐
│                     User Interface Layer                         │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  AUTONOMY LAYER (T4)                                             │
│  Agentic Architectures · Workflow Orchestration · HITL Patterns  │
│                                                                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  ORCHESTRATION LAYER (T3)                                        │
│  Context Management · Memory Systems · Reasoning & Planning ·   │
│  Tool Use & Function Calling                                     │
│                                                                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  AUGMENTATION LAYER (T2)                                         │
│  RAG & Information Retrieval · Output Processing &               │
│  Structured Generation                                           │
│                                                                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  FOUNDATION LAYER (T1)                                           │
│  Foundation Models · Prompting Techniques                        │
│                                                                  │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  OPERATIONAL EXCELLENCE (Cross-Cutting)                          │
│  Safety & Guardrails · Evaluation & Testing ·                    │
│  Infrastructure & Deployment · Observability                     │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Table of Contents

1. [Foundation Layer](#1-foundation-layer)
   - 1.1 Foundation Models
   - 1.2 Prompting Techniques
2. [Augmentation Layer](#2-augmentation-layer)
   - 2.1 Information Augmentation & Retrieval (RAG)
   - 2.2 Output Processing & Structured Generation
3. [Orchestration Layer](#3-orchestration-layer)
   - 3.1 Context Management
   - 3.2 Memory Systems
   - 3.3 Reasoning & Planning
   - 3.4 Tool Use & Function Calling
4. [Autonomy Layer](#4-autonomy-layer)
   - 4.1 Agentic Architectures
   - 4.2 Workflow Orchestration
   - 4.3 Human-in-the-Loop Patterns
5. [Operational Excellence](#5-operational-excellence-cross-cutting)
   - 5.1 Safety, Guardrails & Alignment
   - 5.2 Evaluation & Testing
   - 5.3 Infrastructure & Deployment
   - 5.4 Observability

---

## 1. Foundation Layer

*Tier: T1 (Basic). Focus: Reliable generation and data access.*
*Enables Features: F1 (Contextual Grounding), F3 (Structured Output), F4 (Interactive Refinement), F6 (Personalization)*

### 1.1 Foundation Models

#### 1.1.1 Model Types
- **Large Language Models (LLMs)** — Text-to-text generation, instruction-following, chat-optimized, code-specialized
- **Vision-Language Models (VLMs)** — Image understanding, generation, editing, visual Q&A
- **Diffusion Models** — High-fidelity image/video generation, latent diffusion
- **Multimodal Models** — Text + Image + Audio, video understanding, document understanding (OCR + reasoning)
- **Speech Models** — Speech-to-text (ASR), text-to-speech (TTS), voice cloning, real-time voice agents
- **Embedding Models** — Text, image, multimodal, and code embeddings

#### 1.1.2 Model Architectures
- **Transformer-based** — Encoder-only (BERT-style), Decoder-only (GPT-style), Encoder-decoder (T5-style)
- **Mixture of Experts (MoE)** — Sparse activation, expert routing
- **State Space Models** — Mamba architecture, linear attention variants
- **Hybrid Architectures** — Transformer + retrieval, Transformer + diffusion

#### 1.1.3 Model Adaptation
- **Fine-tuning** — Full fine-tuning, PEFT (LoRA, QLoRA, Adapters, Prefix tuning, Prompt tuning), Instruction tuning, Domain adaptation
- **Alignment Training** — RLHF, DPO, Constitutional AI, RLAIF
- **Distillation** — Knowledge distillation, model compression, teacher-student training

#### 1.1.4 Model Optimization
- **Quantization** — INT8/INT4, GPTQ, AWQ, GGML/GGUF, mixed-precision
- **Pruning** — Structured and unstructured
- **Speculative Decoding** — Draft model acceleration, parallel token generation

### 1.2 Prompting Techniques

#### 1.2.1 Basic Prompting
- **Zero-Shot** — Direct instruction without examples
- **One-Shot / Few-Shot** — 1 or 2-10 examples for in-context learning, example selection strategies

#### 1.2.2 Reasoning Prompts
- **Chain-of-Thought (CoT)** — Step-by-step reasoning, few-shot and zero-shot variants
- **Self-Consistency** — Multiple reasoning paths with majority voting
- **Tree of Thoughts (ToT)** — Branching paths with exploration and backtracking
- **Graph of Thoughts (GoT)** — Non-linear reasoning structures, thought combination
- **Skeleton-of-Thought** — Outline-first generation with parallel expansion

#### 1.2.3 Decomposition Prompts
- **Least-to-Most** — Problem decomposition, sequential sub-problem solving
- **Decomposed Prompting (DecomP)** — Sub-task delegation, modular problem solving
- **Plan-and-Solve** — Explicit planning phase then structured execution

#### 1.2.4 Agentic Prompting
- **ReAct** — Interleaved reasoning + action with tool integration
- **Reflexion** — Self-reflection and iterative improvement with episodic memory
- **REWOO** — Reasoning without observation, planned tool use

#### 1.2.5 Advanced Techniques
- **Prompt Chaining** — Sequential execution, output-to-input linking
- **Meta-Prompting** — Prompts that generate/optimize prompts
- **Generated Knowledge Prompting** — Knowledge generation before answering
- **Automatic Prompt Engineering (APE)** — Automated optimization
- **Contrastive Prompting** — Positive/negative examples for boundary definition

#### 1.2.6 Prompt Optimization
- **Prompt Compression** — Token reduction (LLMLingua and variants)
- **Prompt Caching** — Prefix caching, KV-cache reuse
- **Dynamic Prompting** — Context-aware prompt selection, adaptive few-shot selection

#### 1.2.7 Role & Persona
- **System Prompts** — Persona definition, behavioral constraints, output formatting
- **Role-Playing** — Expert personas, domain specialization
- **Multi-Persona** — Debate/discussion formats, perspective synthesis

---

## 2. Augmentation Layer

*Tier: T2 (Enhanced). Focus: Knowledge augmentation and output fidelity.*
*Enables Features: F1 (Contextual Grounding), F2 (Multi-Source Synthesis), F3 (Structured Output), F5 (Citation & Provenance)*

### 2.1 Information Augmentation & Retrieval (RAG)

#### 2.1.1 RAG Patterns
- **Basic RAG** — Query → Retrieve → Generate (single-step)
- **Advanced RAG** — Pre-retrieval optimization (query rewriting, decomposition, HyDE), Retrieval optimization (hybrid search, re-ranking, contextual compression), Post-retrieval optimization (filtering, scoring, reordering)

#### 2.1.2 RAG Architectures
- **Naive RAG** — Simple retrieve-and-generate
- **Modular RAG** — Pluggable components, flexible pipelines
- **Agentic RAG** — Tool-based retrieval, iterative and self-correcting
- **Graph RAG** — Knowledge graph integration, entity-relationship retrieval
- **Multi-Modal RAG** — Cross-modal search (image + text)

#### 2.1.3 Vector Storage & Search
- **Vector Databases** — Purpose-built (Pinecone, Weaviate, Qdrant, Milvus, Chroma), Integrated (PostgreSQL/pgvector, Elasticsearch)
- **Indexing Algorithms** — HNSW, IVF, Product/Scalar Quantization
- **Search Types** — Dense (embedding similarity), Sparse (BM25, TF-IDF), Hybrid, Filtered, Multi-vector

#### 2.1.4 Document Processing
- **Chunking Strategies** — Fixed-size, semantic, recursive, document-structure aware, agentic, parent-child
- **Document Parsing** — PDF extraction, HTML/web scraping, table extraction, image/diagram processing
- **Metadata Extraction** — Automatic tagging, entity extraction, relationship extraction

#### 2.1.5 Knowledge Integration
- **Knowledge Graphs** — Entity-relationship modeling, graph databases (Neo4j), ontology integration
- **Structured Data Integration** — SQL/database querying, API integration, schema understanding

### 2.2 Output Processing & Structured Generation

#### 2.2.1 Structured Output
- **JSON Generation** — Schema-constrained, nested structures
- **Code Generation** — Syntax-valid code, multi-file generation
- **Structured Data** — Tables, lists, key-value pairs

#### 2.2.2 Output Constraints
- **Grammar-Based** — CFG, regular expressions
- **Schema Validation** — JSON Schema, Pydantic models, TypeScript types
- **Constrained Decoding** — Token-level constraints, guided generation

#### 2.2.3 Output Parsing & Validation
- **Format Extraction** — XML/JSON parsing, code block extraction
- **Entity Extraction** — Named entities, structured data
- **Validation & Repair** — Syntax correction, schema conformance

#### 2.2.4 Output Enhancement
- **Formatting** — Markdown rendering, code highlighting
- **Citation & Attribution** — Source linking, reference tracking
- **Streaming** — Token-by-token output, partial response handling

---

## 3. Orchestration Layer

*Tier: T3 (Orchestrated). Focus: State, memory, reasoning, and action.*
*Enables Features: F4 (Interactive Refinement), F6 (Personalization), F7 (Autonomous Planning), F8 (Tool Orchestration), F9 (Real-Time Data), F10 (Long-Term Memory)*

### 3.1 Context Management

#### 3.1.1 Context Window Strategies
- **Context Packing** — Efficient token usage, priority-based inclusion
- **Context Truncation** — Sliding window, summarization
- **Context Extension** — Position interpolation, attention modifications

#### 3.1.2 Information Prioritization
- **Relevance Ranking** — Query-based scoring, recency weighting
- **Importance Scoring** — Entity importance, information density
- **Dynamic Selection** — Adaptive retrieval, context refinement

#### 3.1.3 Multi-Turn Management
- **Conversation Threading** — Topic tracking, reference resolution
- **History Compression** — Summary injection, key point extraction
- **Context Switching** — Task transitions, state preservation

### 3.2 Memory Systems

#### 3.2.1 Short-Term Memory
- **Context Window** — Token limits, attention span
- **Conversation History** — Message buffer, rolling window
- **Working Memory** — Current task state, intermediate results

#### 3.2.2 Long-Term Memory
- **Persistent Storage** — Vector-based memory, structured databases
- **Memory Types** — Episodic (event sequences, experience records), Semantic (facts, conceptual relationships), Procedural (task procedures, learned workflows)
- **Memory Operations** — Write/store, Read/retrieve, Update/consolidate, Forget/prune

#### 3.2.3 Memory Management
- **Summarization** — Conversation summarization, progressive compression, hierarchical summaries
- **Consolidation** — Important memory identification, redundancy elimination
- **Retrieval** — Recency-based, relevance-based, importance-based, hybrid

### 3.3 Reasoning & Planning

#### 3.3.1 Reasoning Types
- **Deductive** — Rule-based inference, logical conclusions
- **Inductive** — Pattern recognition, generalization
- **Abductive** — Hypothesis generation, best-explanation inference
- **Analogical** — Cross-domain mapping, example-based
- **Causal** — Cause-effect analysis, counterfactual reasoning

#### 3.3.2 Planning Approaches
- **Task Decomposition** — Hierarchical planning, sub-goal generation
- **Plan Generation** — Step-by-step planning, parallel task identification
- **Plan Execution** — Sequential, conditional branching, loop handling
- **Plan Adaptation** — Re-planning on failure, dynamic adjustment, constraint handling

#### 3.3.3 Advanced Reasoning
- **Multi-Step Reasoning** — Complex inference chains, intermediate state tracking
- **Mathematical Reasoning** — Symbolic computation, numerical reasoning, proof generation
- **Code Reasoning** — Program synthesis, bug identification, code explanation
- **Commonsense Reasoning** — World knowledge application, implicit inference

### 3.4 Tool Use & Function Calling

#### 3.4.1 Function Calling
- **Native Function Calling** — Structured tool definitions, JSON schema, parameter extraction
- **Parallel Function Calling** — Multiple simultaneous calls, dependency management
- **Nested Function Calling** — Tools that call other tools, recursive invocation

#### 3.4.2 Tool Types
- **Information Retrieval** — Web search, database queries, API calls, file system access
- **Computation** — Code execution (sandboxed), calculators, data analysis
- **Action** — File operations, system commands, external service integration
- **Communication** — Email, notifications, user interaction

#### 3.4.3 Tool Integration Patterns
- **Model Context Protocol (MCP)** — Standardized tool interface, server-based tools, resource/prompt sharing
- **Tool Descriptions** — Natural language descriptions, schema definitions, usage examples
- **Tool Selection** — Automatic choice, routing, multi-tool orchestration

#### 3.4.4 Code Execution
- **Sandboxed Environments** — Secure containers, resource limits, network isolation
- **Code Interpreters** — Python, JavaScript, multi-language support
- **REPL Integration** — Interactive execution, state persistence

---

## 4. Autonomy Layer

*Tier: T4 (Agentic). Focus: Collaboration, autonomy, and self-improvement.*
*Enables Features: F7 (Autonomous Planning), F11 (Human Oversight), F14 (Multi-Agent Collaboration)*

### 4.1 Agentic Architectures

#### 4.1.1 Single-Agent Patterns
- **ReAct Agent** — Reasoning + Action loop with observation integration
- **Plan-and-Execute Agent** — Upfront planning with step execution
- **Reflexion Agent** — Self-critique and iterative improvement
- **Tool-Using Agent** — Tool selection, use, and result interpretation

#### 4.1.2 Multi-Agent Systems
- **Collaboration Patterns** — Supervisor (central coordinator), Hierarchical (manager-worker), Peer-to-Peer (equal agents), Swarm (decentralized coordination)
- **Communication Protocols** — Message passing, shared state, blackboard systems
- **Specialization** — Role-based agents, domain experts, skill-based routing

#### 4.1.3 Agent Components
- **Perception** — Input processing, environment sensing
- **Cognition** — Reasoning engine, decision making
- **Action** — Tool invocation, output generation
- **Learning** — Experience accumulation, strategy adaptation

#### 4.1.4 Agent Frameworks
- **Orchestration Layers** — LangChain/LangGraph, AutoGen, CrewAI, OpenAI Assistants, Anthropic Claude Tools
- **Agent Protocols** — A2A (Agent-to-Agent), standard message formats, capability discovery

### 4.2 Workflow Orchestration

#### 4.2.1 Flow Patterns
- **Sequential Chains** — Linear execution, output forwarding
- **Parallel Execution** — Concurrent branches, fan-out patterns
- **Conditional Branching** — If-then-else logic, router patterns
- **Loops & Iteration** — While loops, for-each processing, retry logic
- **Map-Reduce** — Parallel processing, result aggregation

#### 4.2.2 Graph-Based Orchestration
- **DAG** — Node dependencies, execution ordering
- **Cyclic Graphs** — Feedback loops, iterative refinement
- **State Machines** — State transitions, event-driven flow
- **Dynamic Graphs** — Runtime modification, adaptive workflows

#### 4.2.3 State Management
- **Conversation State** — Message history, turn management
- **Workflow State** — Execution progress, intermediate results
- **Persistence** — Checkpointing, recovery mechanisms
- **State Channels** — Shared state access, conflict resolution

#### 4.2.4 Error Handling
- **Retry Strategies** — Exponential backoff, circuit breakers
- **Fallback Mechanisms** — Alternative paths, graceful degradation
- **Error Recovery** — State rollback, compensation actions

### 4.3 Human-in-the-Loop Patterns

#### 4.3.1 Interaction Modes
- **Approval Workflows** — Action confirmation, review gates
- **Feedback Collection** — Thumbs up/down, detailed feedback, corrections
- **Collaborative Editing** — Suggestion mode, iterative refinement

#### 4.3.2 Escalation Patterns
- **Uncertainty Escalation** — Confidence thresholds, ambiguity detection
- **Risk-Based Escalation** — High-stakes actions, irreversible operations
- **Error Escalation** — Failure handling, manual intervention

#### 4.3.3 User Experience
- **Transparency** — Reasoning display, source attribution, confidence indicators
- **Control** — Stop/cancel, override mechanisms, preference settings
- **Feedback Loops** — Learning from corrections, preference adaptation

---

## 5. Operational Excellence (Cross-Cutting)

*Spans all tiers. Applies to every production GenAI system.*
*Enables Features: F12 (Safety & Content Controls), F13 (Continuous Learning & Feedback), F15 (Auditability & Compliance)*

### 5.1 Safety, Guardrails & Alignment

#### 5.1.1 Input Guardrails
- **Content Filtering** — Harmful content detection, PII detection, topic restrictions
- **Prompt Injection Defense** — Injection detection, input sanitization, delimiter strategies
- **Rate Limiting** — Request throttling, abuse prevention

#### 5.1.2 Output Guardrails
- **Content Moderation** — Toxicity filtering, bias detection, factuality checking
- **Hallucination Mitigation** — Grounding verification, source attribution, uncertainty quantification
- **Output Validation** — Format verification, constraint checking, safety classification

#### 5.1.3 Alignment Techniques
- **Constitutional AI** — Principle-based guidance, self-critique
- **Value Alignment** — Helpfulness, harmlessness, honesty
- **Behavioral Boundaries** — Refusal training, scope limitations

#### 5.1.4 Security
- **Data Privacy** — PII handling, data retention policies
- **Access Control** — Authentication, authorization, audit logging
- **Secure Execution** — Sandboxing, resource isolation

### 5.2 Evaluation & Testing

#### 5.2.1 Evaluation Types
- **Automated** — Metric-based scoring, reference comparison
- **Human** — Quality ratings, preference ranking, A/B testing
- **LLM-as-Judge** — Model-based evaluation, pairwise comparison, rubric scoring

#### 5.2.2 Evaluation Metrics
- **Generation Quality** — BLEU, ROUGE, METEOR, BERTScore, Perplexity
- **Task-Specific** — Accuracy, F1, Pass@k (code), Exact match
- **Safety Metrics** — Toxicity scores, bias measures, refusal rates

#### 5.2.3 Benchmarks
- **General** — MMLU, HellaSwag, ARC, WinoGrande
- **Reasoning** — GSM8K, MATH, Big-Bench
- **Code** — HumanEval, MBPP, SWE-bench
- **Agent** — WebArena, AgentBench, GAIA

#### 5.2.4 Testing Strategies
- **Unit Testing** — Component isolation, mock responses
- **Integration Testing** — End-to-end flows, tool integration
- **Regression Testing** — Baseline comparison, performance tracking
- **Red Teaming** — Adversarial testing, edge case discovery

### 5.3 Infrastructure & Deployment

#### 5.3.1 Model Serving
- **Inference Engines** — vLLM, TensorRT-LLM, ONNX Runtime, Triton
- **Serving Patterns** — Real-time inference, batch processing, streaming
- **Scaling** — Horizontal scaling, load balancing, auto-scaling

#### 5.3.2 API Management
- **Gateways** — Rate limiting, authentication, request routing
- **Patterns** — REST APIs, Streaming APIs, WebSocket connections
- **Client Libraries** — Language bindings, retry logic, error handling

#### 5.3.3 Caching
- **Response Caching** — Exact match, semantic caching
- **KV-Cache** — Prefix caching, attention caching
- **Embedding Caching** — Vector cache, query cache

#### 5.3.4 Cost Optimization
- **Token Optimization** — Prompt compression, response limits
- **Model Selection** — Model routing, cascade patterns
- **Batching** — Request batching, continuous batching

### 5.4 Observability

#### 5.4.1 Deep Tracing
- **Reasoning Path Visualization** — Chain of Thought traces
- **Retrieved Context Inspector** — What was read and why
- **Tool Execution Logs** — Inputs, outputs, timing

#### 5.4.2 Monitoring
- **Latency & Throughput** — Request timing, queue depths
- **Error Rates** — By category, by component
- **Quality Metrics** — Output quality scores, drift detection
- **Cost Attribution** — Per request, per step, per user/team

#### 5.4.3 Logging
- **Request/Response** — Full input/output capture
- **Structured Logs** — JSON format, correlated
- **Feedback Capture** — User ratings, corrections, escalations

#### 5.4.4 Analytics & Alerting
- **Usage Analytics** — Adoption, engagement, patterns
- **Anomaly Detection** — Automated alerting on deviations
- **Dashboards** — Operational, quality, cost views

---

## Appendix: Component → Feature Mapping

Quick reference showing which features each component category primarily enables.

| Component Category | Primary Features Enabled |
|---|---|
| **Foundation Models** | F1, F2, F3, F4, F6, F7, F8 |
| **Prompting Techniques** | F1, F2, F3, F4, F5, F6, F7 |
| **RAG / Retrieval** | F1, F2, F5 |
| **Output Processing** | F2, F3, F5 |
| **Context Management** | F1, F4, F6, F7, F10 |
| **Memory Systems** | F4, F6, F7, F10, F14 |
| **Reasoning & Planning** | F2, F7, F14 |
| **Tools & Functions** | F7, F8, F9, F14 |
| **Agents** | F7, F14 |
| **Workflow Orchestration** | F7, F9, F11 |
| **HITL Patterns** | F11, F15 |
| **Guardrails & Safety** | F12, F15 |
| **Evaluation & Testing** | F1-F15 (quality assurance for all features) |
| **Observability & Infrastructure** | F5, F8, F9, F11, F12, F13, F15 |

---

## Related Documents

- **[01-overview.md](01-overview.md)** — Start here
- **[03-capability-features.md](03-capability-features.md)** — Layer 2: Features enabled by these components
- **[05-component-selection-guide.md](05-component-selection-guide.md)** — How to evaluate components
- **[06-implementation-tiers.md](06-implementation-tiers.md)** — Maturity tiers and stack patterns
- **[07-platform-selection.md](07-platform-selection.md)** — Platforms and tools that implement these components

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 3.0 | 2026-02-27 | Harmonized layer terminology (Foundation/Augmentation/Orchestration/Autonomy + Operational Excellence). Added feature linkage per layer. Added Component→Feature appendix. Reorganized for consistency with four-layer framework model. |
| 2.0 | 2026-02-02 | Reorganized by Architecture Maturity Model. |
| 1.0 | 2026-01-17 | Initial comprehensive analysis. |
