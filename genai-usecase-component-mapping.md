# GenAI Use Case to Technical Component Mapping

A systematic mapping of Generative AI use cases to their supporting technical components, organized by implementation complexity to guide platform and architecture decisions.

---

## Table of Contents

1. [Complexity Tier Framework](#1-complexity-tier-framework)
2. [Component Complexity Classification](#2-component-complexity-classification)
3. [Use Case to Component Mapping Matrix](#3-use-case-to-component-mapping-matrix)
4. [Detailed Use Case Analysis](#4-detailed-use-case-analysis)
5. [Component Stack Patterns](#5-component-stack-patterns)
6. [Platform Selection Guide](#6-platform-selection-guide)

---

## 1. Complexity Tier Framework

### Implementation Tiers

| Tier | Name | Characteristics | Typical Components | Example |
|------|------|-----------------|-------------------|---------|
| **T1** | Basic | Single LLM call, no external data, minimal orchestration | LLM + Prompting | Simple Q&A chatbot |
| **T2** | Enhanced | RAG integration, basic memory, structured output | LLM + RAG + Output Parsing | Knowledge base assistant |
| **T3** | Orchestrated | Multi-step workflows, tool use, conditional logic | LLM + RAG + Tools + Orchestration | Research assistant with web search |
| **T4** | Agentic | Autonomous planning, multi-agent, complex reasoning | Full stack including agents, memory, multi-tool | Autonomous coding assistant |

### Complexity Dimensions

```
                    Low ──────────────────────────────────────► High

Autonomy:          Human-driven │ Assisted │ Semi-autonomous │ Autonomous
Data Integration:  None │ Static Context │ RAG │ Multi-source + Live
Reasoning:         Single-shot │ Chain-of-Thought │ Multi-step │ Planning + Reflection
Tool Use:          None │ Single tool │ Multi-tool │ Dynamic tool selection
Memory:            Stateless │ Session │ Persistent │ Episodic + Semantic
Output:            Free-form │ Templated │ Structured │ Multi-artifact
```

---

## 2. Component Complexity Classification

### Foundation Components (Required by All)

| Component | Description | Complexity Impact |
|-----------|-------------|-------------------|
| **LLM API** | Core language model access | Base requirement |
| **Basic Prompting** | Zero/few-shot prompts | Low |
| **System Prompts** | Role and behavior definition | Low |

### Progressive Component Layers

```
Layer 4: Agentic        ┌─────────────────────────────────────────────┐
                        │ Multi-Agent, Reflexion, A2A Protocols       │
                        └─────────────────────────────────────────────┘
                                              ▲
Layer 3: Orchestration  ┌─────────────────────────────────────────────┐
                        │ Workflows, State Machines, Error Handling   │
                        └─────────────────────────────────────────────┘
                                              ▲
Layer 2: Augmentation   ┌─────────────────────────────────────────────┐
                        │ RAG, Tools, Memory, Structured Output       │
                        └─────────────────────────────────────────────┘
                                              ▲
Layer 1: Foundation     ┌─────────────────────────────────────────────┐
                        │ LLM, Prompting, Context Management          │
                        └─────────────────────────────────────────────┘
```

### Component Complexity Ratings

| Component Category | Component | Complexity | Implementation Effort |
|--------------------|-----------|------------|----------------------|
| **Prompting** | Zero-shot | ★☆☆☆☆ | Hours |
| | Few-shot | ★★☆☆☆ | Hours |
| | Chain-of-Thought | ★★☆☆☆ | Hours |
| | ReAct | ★★★☆☆ | Days |
| | Tree of Thoughts | ★★★★☆ | Days-Weeks |
| **RAG** | Basic RAG | ★★☆☆☆ | Days |
| | Hybrid Search | ★★★☆☆ | Days |
| | Agentic RAG | ★★★★☆ | Weeks |
| | Graph RAG | ★★★★★ | Weeks-Months |
| **Memory** | Conversation Buffer | ★☆☆☆☆ | Hours |
| | Summarization Memory | ★★☆☆☆ | Days |
| | Vector Memory | ★★★☆☆ | Days |
| | Episodic + Semantic | ★★★★★ | Weeks |
| **Tools** | Single Function | ★★☆☆☆ | Hours-Days |
| | Multi-tool | ★★★☆☆ | Days |
| | MCP Integration | ★★★☆☆ | Days |
| | Code Execution | ★★★★☆ | Weeks |
| **Agents** | ReAct Agent | ★★★☆☆ | Days |
| | Plan-Execute | ★★★★☆ | Weeks |
| | Multi-Agent | ★★★★★ | Weeks-Months |
| | Reflexion | ★★★★★ | Weeks-Months |
| **Orchestration** | Sequential Chains | ★★☆☆☆ | Hours-Days |
| | Parallel Execution | ★★★☆☆ | Days |
| | State Machines | ★★★★☆ | Weeks |
| | Dynamic Graphs | ★★★★★ | Weeks |

---

## 3. Use Case to Component Mapping Matrix

### Master Matrix: Use Cases × Core Components

Legend: ● Required | ◐ Often Needed | ○ Optional | − Not Applicable

| Use Case | LLM | Prompt Eng | RAG | Memory | Tools | Agents | Orchestration | Structured Output | Guardrails |
|----------|-----|------------|-----|--------|-------|--------|---------------|-------------------|------------|
| **Content Generation** |
| Text Generation | ● | ● | ○ | ○ | − | − | ○ | ◐ | ● |
| Text Transformation | ● | ● | ○ | ○ | − | − | ○ | ◐ | ● |
| Multimedia Generation | ● | ● | ○ | ○ | ● | − | ◐ | ● | ● |
| Content Personalization | ● | ● | ● | ● | ○ | − | ◐ | ◐ | ● |
| Template Creation | ● | ● | ◐ | ○ | − | − | ○ | ● | ◐ |
| **Knowledge Work** |
| Info Retrieval & Synthesis | ● | ● | ● | ◐ | ◐ | ○ | ◐ | ◐ | ● |
| Document Analysis | ● | ● | ◐ | ○ | ◐ | − | ◐ | ● | ● |
| Research Assistance | ● | ● | ● | ● | ● | ◐ | ● | ◐ | ● |
| Question Answering | ● | ● | ● | ◐ | ○ | − | ○ | ○ | ● |
| Explanation & Education | ● | ● | ◐ | ◐ | ○ | − | ○ | ○ | ● |
| **Agentic & Automation** |
| Task Orchestration | ● | ● | ◐ | ● | ● | ● | ● | ● | ● |
| Tool Use & Integration | ● | ● | ○ | ◐ | ● | ◐ | ● | ● | ● |
| Planning & Decomposition | ● | ● | ○ | ● | ◐ | ● | ● | ● | ● |
| Self-Correction | ● | ● | ○ | ● | ○ | ● | ● | ◐ | ● |
| Human-in-the-Loop | ● | ● | ◐ | ● | ◐ | ◐ | ● | ◐ | ● |
| **Personal Productivity** |
| Writing Assistance | ● | ● | ○ | ◐ | ○ | − | ○ | ○ | ● |
| Scheduling & Organization | ● | ● | ○ | ● | ● | ◐ | ● | ● | ◐ |
| Learning & Skill Dev | ● | ● | ● | ● | ○ | − | ◐ | ○ | ● |
| Knowledge Management | ● | ● | ● | ● | ◐ | ○ | ◐ | ● | ◐ |
| Communication Enhancement | ● | ● | ○ | ◐ | ○ | − | ○ | ○ | ● |
| **Conversational AI** |
| Customer Support | ● | ● | ● | ● | ◐ | ○ | ◐ | ◐ | ● |
| Virtual Assistants | ● | ● | ● | ● | ● | ◐ | ● | ◐ | ● |
| Interactive Guidance | ● | ● | ● | ● | ○ | − | ● | ○ | ● |
| Roleplay & Simulation | ● | ● | ○ | ● | ○ | − | ○ | ○ | ● |
| Collaborative Dialogue | ● | ● | ○ | ● | ○ | − | ○ | ○ | ● |
| **Creative & Design** |
| Ideation & Brainstorming | ● | ● | ○ | ◐ | ○ | − | ○ | ○ | ◐ |
| Visual Design Generation | ● | ● | ○ | ○ | ● | − | ◐ | ● | ● |
| Narrative & Storytelling | ● | ● | ○ | ● | ○ | − | ◐ | ○ | ● |
| Music & Audio Creation | ● | ● | ○ | ○ | ● | − | ◐ | ● | ● |
| Style Transfer | ● | ● | ◐ | ○ | ● | − | ◐ | ● | ● |
| **Code & Software Dev** |
| Code Generation | ● | ● | ◐ | ◐ | ◐ | ○ | ◐ | ● | ● |
| Code Review & Analysis | ● | ● | ○ | ○ | ◐ | − | ○ | ● | ● |
| Refactoring | ● | ● | ○ | ◐ | ● | ◐ | ● | ● | ● |
| Documentation Generation | ● | ● | ◐ | ○ | ○ | − | ○ | ● | ◐ |
| Debugging & Troubleshooting | ● | ● | ◐ | ● | ● | ◐ | ● | ● | ● |
| **Decision Support** |
| Data Interpretation | ● | ● | ● | ○ | ◐ | − | ◐ | ● | ● |
| Scenario Analysis | ● | ● | ◐ | ● | ◐ | ○ | ● | ● | ● |
| Recommendation Generation | ● | ● | ● | ◐ | ○ | − | ◐ | ● | ● |
| Risk Assessment | ● | ● | ● | ○ | ○ | − | ◐ | ● | ● |
| Report Narration | ● | ● | ● | ○ | ◐ | − | ◐ | ● | ● |
| **Specialized Domains** |
| Healthcare & Clinical | ● | ● | ● | ● | ◐ | ○ | ● | ● | ● |
| Legal & Compliance | ● | ● | ● | ◐ | ○ | − | ◐ | ● | ● |
| Financial Services | ● | ● | ● | ◐ | ● | ○ | ● | ● | ● |
| Scientific Research | ● | ● | ● | ● | ● | ◐ | ● | ● | ● |
| Engineering & Technical | ● | ● | ● | ◐ | ● | ◐ | ● | ● | ● |

---

## 4. Detailed Use Case Analysis

### 4.1 Content Generation & Transformation

#### Complexity Progression

| Level | Implementation | Key Components | Example |
|-------|----------------|----------------|---------|
| **T1 - Basic** | Single prompt, direct generation | LLM + System Prompt | "Write a blog post about X" |
| **T2 - Enhanced** | Style/tone customization, templates | + Few-shot + Structured Output | Brand-voice content with templates |
| **T3 - Orchestrated** | Multi-step editing, source integration | + RAG + Workflow Chains | Research-backed articles with citations |
| **T4 - Agentic** | Autonomous content pipeline | + Agents + Tools + Memory | Full editorial workflow automation |

#### Component Stack by Tier

```
T1: [LLM] → [Prompt] → [Output]

T2: [LLM] → [Few-shot Prompt] → [Output Parser] → [Structured Output]
              ↑
         [Style Guide]

T3: [User Input] → [Query] → [RAG] → [LLM] → [Draft]
                                        ↓
                              [Review Chain] → [Edit Chain] → [Final]

T4: [Goal] → [Planner Agent] → [Research Agent] → [Writer Agent]
                    ↓                  ↓               ↓
              [Task Queue]      [Web Tools]    [Style Memory]
                                      ↓               ↓
                              [Editor Agent] ← [Reviewer Agent]
```

---

### 4.2 Knowledge Work & Research

#### Complexity Progression

| Level | Implementation | Key Components | Example |
|-------|----------------|----------------|---------|
| **T1 - Basic** | Direct Q&A from model knowledge | LLM + Zero-shot | General knowledge questions |
| **T2 - Enhanced** | RAG over document corpus | + Vector DB + Embeddings | Internal wiki Q&A |
| **T3 - Orchestrated** | Multi-source synthesis, fact-checking | + Hybrid Search + Re-ranking + Chains | Competitive intelligence reports |
| **T4 - Agentic** | Autonomous research with iteration | + Agents + Web Search + Memory | Deep research assistant |

#### Technical Requirements Matrix

| Capability | T1 | T2 | T3 | T4 |
|------------|----|----|----|----|
| LLM API | ✓ | ✓ | ✓ | ✓ |
| Vector Database | − | ✓ | ✓ | ✓ |
| Embedding Model | − | ✓ | ✓ | ✓ |
| Chunking Strategy | − | Basic | Semantic | Agentic |
| Search Type | − | Dense | Hybrid | Agentic RAG |
| Re-ranking | − | − | ✓ | ✓ |
| Web Search Tool | − | − | Optional | ✓ |
| Memory | − | Session | Persistent | Episodic |
| Orchestration | − | − | Chains | Graph |
| Planning | − | − | − | ✓ |

---

### 4.3 Agentic & Automation

#### Complexity Progression

| Level | Implementation | Key Components | Example |
|-------|----------------|----------------|---------|
| **T1 - Basic** | Single action with confirmation | LLM + Single Tool | "Send this email" |
| **T2 - Enhanced** | Multi-step with human approval | + Multi-tool + HITL | Form filling assistant |
| **T3 - Orchestrated** | Workflow automation | + State Machine + Error Handling | Invoice processing pipeline |
| **T4 - Agentic** | Autonomous goal pursuit | + Planning + Reflection + Multi-agent | Autonomous software engineer |

#### Agent Architecture Patterns

| Pattern | Complexity | Use When | Components Required |
|---------|------------|----------|---------------------|
| **Tool-Calling Agent** | ★★☆ | Single-purpose tool use | LLM + Tools + Output Parser |
| **ReAct Agent** | ★★★ | Iterative problem solving | + Observation Loop + Scratchpad |
| **Plan-and-Execute** | ★★★★ | Complex multi-step tasks | + Planner + Executor + Re-planner |
| **Reflexion** | ★★★★ | Learning from mistakes | + Self-critique + Memory |
| **Multi-Agent Supervisor** | ★★★★★ | Specialized sub-tasks | + Multiple Agents + Coordinator |
| **Multi-Agent Swarm** | ★★★★★ | Emergent collaboration | + Peer Agents + Message Passing |

---

### 4.4 Code & Software Development

#### Complexity Progression

| Level | Implementation | Key Components | Example |
|-------|----------------|----------------|---------|
| **T1 - Basic** | Code completion, simple generation | LLM + Code Prompt | Autocomplete, snippets |
| **T2 - Enhanced** | Context-aware generation | + Codebase RAG + Structured Output | Function generation with context |
| **T3 - Orchestrated** | Multi-file changes, testing | + Code Execution + Workflows | Feature implementation with tests |
| **T4 - Agentic** | Autonomous development | + Agents + Git Tools + CI/CD | Full task completion (SWE-agent) |

#### Component Stack for Code Assistant

```
T1: [User Request] → [Code LLM] → [Code Output]

T2: [User Request] → [Codebase Indexer] → [Relevant Context]
                            ↓
                     [Code LLM] → [Structured Code Output]

T3: [User Request] → [Planner] → [Code Generator] → [Test Generator]
                         ↓              ↓                  ↓
                   [Task List]   [File Editor]      [Test Runner]
                                       ↓                  ↓
                               [Syntax Check] ← [Results Parser]

T4: [Issue/Task] → [Planning Agent] → [Codebase Explorer Agent]
                          ↓                      ↓
                    [Implementation Plan]  [Relevant Files]
                          ↓                      ↓
                   [Coding Agent] → [Testing Agent] → [Review Agent]
                         ↓               ↓                ↓
                    [Git Tools]    [Sandbox]      [PR Creation]
```

---

### 4.5 Conversational & Interactive AI

#### Complexity Progression

| Level | Implementation | Key Components | Example |
|-------|----------------|----------------|---------|
| **T1 - Basic** | Stateless Q&A | LLM + System Prompt | FAQ bot |
| **T2 - Enhanced** | Context-aware conversation | + Conversation Memory + RAG | Support chatbot |
| **T3 - Orchestrated** | Multi-intent handling, routing | + Intent Classification + Workflows | Virtual assistant |
| **T4 - Agentic** | Proactive, goal-oriented | + Agents + Tools + Long-term Memory | Personal AI assistant |

#### Memory Requirements by Tier

| Memory Type | T1 | T2 | T3 | T4 |
|-------------|----|----|----|----|
| Conversation Buffer | − | ✓ | ✓ | ✓ |
| Summary Memory | − | Optional | ✓ | ✓ |
| Entity Memory | − | − | ✓ | ✓ |
| Vector Memory | − | − | Optional | ✓ |
| Episodic Memory | − | − | − | ✓ |
| Semantic Memory | − | − | − | ✓ |
| Procedural Memory | − | − | − | Optional |

---

### 4.6 Decision Support & Analytics

#### Complexity Progression

| Level | Implementation | Key Components | Example |
|-------|----------------|----------------|---------|
| **T1 - Basic** | Data description | LLM + Data Context | "Explain this chart" |
| **T2 - Enhanced** | Insight extraction | + Structured Output + Templates | Dashboard narration |
| **T3 - Orchestrated** | Multi-source analysis | + Data Tools + SQL + Workflows | Business intelligence reports |
| **T4 - Agentic** | Autonomous analysis | + Analyst Agent + Code Execution | Self-directed data exploration |

---

## 5. Component Stack Patterns

### Pattern A: Simple Assistant (T1-T2)

```
┌─────────────────────────────────────────────────┐
│                 User Interface                   │
├─────────────────────────────────────────────────┤
│              Basic Orchestration                 │
│         (Request → Process → Response)           │
├─────────────────────────────────────────────────┤
│                                                  │
│  ┌─────────────┐    ┌─────────────────────────┐ │
│  │   Prompts   │    │    Output Parsing       │ │
│  │  (System +  │    │   (Optional JSON/       │ │
│  │  Few-shot)  │    │    Structured)          │ │
│  └─────────────┘    └─────────────────────────┘ │
│                                                  │
├─────────────────────────────────────────────────┤
│                Foundation Model                  │
│              (LLM API - Single Call)             │
├─────────────────────────────────────────────────┤
│           Basic Guardrails (Content Filter)      │
└─────────────────────────────────────────────────┘

Components: 4-6 | Latency: <3s | Cost: $
```

### Pattern B: RAG-Enhanced Assistant (T2)

```
┌─────────────────────────────────────────────────┐
│                 User Interface                   │
├─────────────────────────────────────────────────┤
│               Chain Orchestration                │
│        (Query → Retrieve → Augment → Generate)   │
├─────────────────────────────────────────────────┤
│  ┌─────────────────────────────────────────────┐│
│  │              RAG Pipeline                    ││
│  │  ┌─────────┐  ┌─────────┐  ┌─────────────┐ ││
│  │  │ Query   │→ │ Vector  │→ │  Context    │ ││
│  │  │ Embed   │  │ Search  │  │  Assembly   │ ││
│  │  └─────────┘  └─────────┘  └─────────────┘ ││
│  └─────────────────────────────────────────────┘│
├─────────────────────────────────────────────────┤
│  ┌──────────────┐  ┌────────────────────────┐  │
│  │   Prompts    │  │  Conversation Memory   │  │
│  └──────────────┘  └────────────────────────┘  │
├─────────────────────────────────────────────────┤
│    Foundation Model    │    Embedding Model     │
├─────────────────────────────────────────────────┤
│  Vector Database  │  Guardrails  │  Observability│
└─────────────────────────────────────────────────┘

Components: 8-12 | Latency: 3-8s | Cost: $$
```

### Pattern C: Workflow Orchestration (T3)

```
┌─────────────────────────────────────────────────────────┐
│                    User Interface                        │
│            (Streaming + Progress + Approvals)            │
├─────────────────────────────────────────────────────────┤
│                 Workflow Orchestration                   │
│  ┌────────────────────────────────────────────────────┐ │
│  │   ┌─────┐    ┌─────┐    ┌─────┐    ┌─────┐        │ │
│  │   │Step1│ → │Step2│ → │Step3│ → │Step4│          │ │
│  │   └─────┘    └──┬──┘    └─────┘    └─────┘        │ │
│  │                 │ (conditional)                    │ │
│  │                 ▼                                  │ │
│  │            ┌─────┐                                 │ │
│  │            │Alt  │                                 │ │
│  │            └─────┘                                 │ │
│  └────────────────────────────────────────────────────┘ │
├─────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────┐ │
│  │    RAG      │  │   Tools     │  │    Memory       │ │
│  │  Pipeline   │  │  (Multi)    │  │  (Persistent)   │ │
│  └─────────────┘  └─────────────┘  └─────────────────┘ │
├─────────────────────────────────────────────────────────┤
│  ┌──────────────────────┐  ┌──────────────────────────┐│
│  │  Structured Output   │  │     State Management     ││
│  └──────────────────────┘  └──────────────────────────┘│
├─────────────────────────────────────────────────────────┤
│   Foundation Models   │  Embedding  │  Specialized Models│
├─────────────────────────────────────────────────────────┤
│ Vector DB │ Guardrails │ Error Handling │ Observability │
└─────────────────────────────────────────────────────────┘

Components: 12-18 | Latency: 10-60s | Cost: $$$
```

### Pattern D: Agentic System (T4)

```
┌───────────────────────────────────────────────────────────────┐
│                      User Interface                            │
│        (Streaming + HITL Approvals + Progress + Feedback)      │
├───────────────────────────────────────────────────────────────┤
│                    Agent Orchestration                         │
│  ┌─────────────────────────────────────────────────────────┐  │
│  │                   Supervisor Agent                       │  │
│  │  ┌─────────────────────────────────────────────────────┐│  │
│  │  │  Planning  │  Delegation  │  Monitoring  │  Review  ││  │
│  │  └─────────────────────────────────────────────────────┘│  │
│  └─────────────────────────────────────────────────────────┘  │
│       ▼              ▼              ▼              ▼           │
│  ┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐       │
│  │Research │   │ Writer  │   │ Coder   │   │Reviewer │       │
│  │ Agent   │   │ Agent   │   │ Agent   │   │ Agent   │       │
│  └─────────┘   └─────────┘   └─────────┘   └─────────┘       │
├───────────────────────────────────────────────────────────────┤
│         Shared Resources & Capabilities                        │
│  ┌───────────┐ ┌───────────┐ ┌───────────┐ ┌───────────────┐ │
│  │  Agentic  │ │   Tool    │ │  Memory   │ │   Reasoning   │ │
│  │    RAG    │ │   Suite   │ │  System   │ │    Engine     │ │
│  │           │ │ (MCP,APIs)│ │(All Types)│ │ (CoT,ToT,etc) │ │
│  └───────────┘ └───────────┘ └───────────┘ └───────────────┘ │
├───────────────────────────────────────────────────────────────┤
│     Graph-Based Workflow │ State Machines │ Error Recovery    │
├───────────────────────────────────────────────────────────────┤
│  Multiple Foundation Models │ Specialized Models │ Embeddings │
├───────────────────────────────────────────────────────────────┤
│ Vector DBs │ Knowledge Graphs │ Full Guardrails │ Evaluation  │
├───────────────────────────────────────────────────────────────┤
│        Full Observability │ Tracing │ Cost Management         │
└───────────────────────────────────────────────────────────────┘

Components: 20-35+ | Latency: Minutes-Hours | Cost: $$$$
```

---

## 6. Platform Selection Guide

### 6.1 Platform Categories by Capability

| Platform Type | Best For | Tier Support | Examples |
|---------------|----------|--------------|----------|
| **LLM APIs** | T1-T2, building blocks | T1-T4 (foundation) | OpenAI, Anthropic, Google |
| **Low-Code AI Builders** | T1-T2, rapid prototyping | T1-T2 | ChatGPT Custom GPTs, Claude Projects |
| **RAG Platforms** | T2, knowledge-intensive | T2-T3 | Pinecone + LangChain, Vectara |
| **Orchestration Frameworks** | T2-T3, workflows | T2-T3 | LangChain, LlamaIndex |
| **Agent Frameworks** | T3-T4, autonomous | T3-T4 | LangGraph, AutoGen, CrewAI |
| **Full Stack AI Platforms** | T2-T4, enterprise | T2-T4 | AWS Bedrock, Azure AI, Vertex AI |

### 6.2 Decision Matrix: Use Case → Platform Type

| Use Case Category | T1 Platform | T2 Platform | T3 Platform | T4 Platform |
|-------------------|-------------|-------------|-------------|-------------|
| **Content Generation** | LLM API | LLM + Templates | Orchestration Framework | Agent Framework |
| **Knowledge Work** | LLM API | RAG Platform | Orchestration + RAG | Agentic RAG |
| **Agentic/Automation** | LLM + Tool | Multi-tool Setup | Workflow Platform | Agent Framework |
| **Conversational** | LLM API | Chatbot Platform | Virtual Agent Platform | Agent Framework |
| **Code Development** | Code LLM API | IDE Integration | Code Agent | Full SWE Agent |
| **Decision Support** | LLM API | RAG + Analytics | BI Integration | Analysis Agent |

### 6.3 Component → Platform/Tool Mapping

| Component | Open Source Options | Commercial Options |
|-----------|--------------------|--------------------|
| **LLM** | LLaMA, Mistral, Qwen | OpenAI, Anthropic, Google |
| **Orchestration** | LangChain, LlamaIndex | LangSmith, proprietary |
| **Agents** | LangGraph, AutoGen, CrewAI | OpenAI Assistants, Anthropic Agents |
| **Vector DB** | Chroma, Milvus, Weaviate | Pinecone, Zilliz |
| **Memory** | Custom implementation | LangGraph, Mem0 |
| **Tools/MCP** | Open MCP servers | Commercial MCP providers |
| **Guardrails** | NeMo Guardrails, Guardrails AI | Proprietary filters |
| **Evaluation** | RAGAS, DeepEval | LangSmith, Braintrust |
| **Observability** | OpenTelemetry, Langfuse | LangSmith, Arize |
| **Serving** | vLLM, TGI | AWS Bedrock, Azure OpenAI |

### 6.4 Selection Criteria Checklist

#### For T1-T2 (Simple-Enhanced)

- [ ] Single LLM provider sufficient?
- [ ] Managed RAG acceptable or need custom?
- [ ] Latency requirements (<5s typical)?
- [ ] Cost sensitivity (per-token pricing OK)?
- [ ] Minimal operational overhead desired?

**Recommendation**: Start with LLM API + managed services

#### For T3 (Orchestrated)

- [ ] Complex workflow requirements?
- [ ] Multiple data source integration?
- [ ] Custom tool development needed?
- [ ] Human approval workflows required?
- [ ] State persistence requirements?

**Recommendation**: Orchestration framework (LangChain/LlamaIndex) + appropriate infrastructure

#### For T4 (Agentic)

- [ ] Autonomous operation required?
- [ ] Multi-agent coordination needed?
- [ ] Long-running task support?
- [ ] Complex planning requirements?
- [ ] Full observability and control needed?

**Recommendation**: Agent framework (LangGraph/AutoGen/CrewAI) + full supporting infrastructure

---

## 7. Quick Reference: Use Case Starter Configurations

### Minimal Viable Configurations by Use Case

| Use Case | Minimum Tier | Core Stack | Key Additions for Enhancement |
|----------|--------------|------------|-------------------------------|
| FAQ Chatbot | T1 | LLM + System Prompt | + RAG for knowledge base |
| Content Writer | T1 | LLM + Few-shot | + Templates + Style memory |
| Research Assistant | T2 | LLM + RAG | + Web search + Multi-source |
| Code Assistant | T2 | Code LLM + Context | + File tools + Execution |
| Customer Support | T2 | LLM + RAG + Memory | + Handoff + Analytics |
| Data Analyst | T2 | LLM + SQL Tools | + Visualization + Iteration |
| Virtual Assistant | T3 | LLM + Tools + Memory | + Proactive + Multi-domain |
| Autonomous Coder | T4 | Full Agent Stack | + Git + CI/CD + Review |
| Research Agent | T4 | Full Agent Stack | + Web + Synthesis + Iteration |

---

## Appendix: Component Dependency Graph

```
                        ┌─────────────────────────┐
                        │     User Interface       │
                        └───────────┬─────────────┘
                                    │
                        ┌───────────▼─────────────┐
                        │  Human-in-the-Loop      │
                        │  (Approvals, Feedback)   │
                        └───────────┬─────────────┘
                                    │
┌───────────────────────────────────┼───────────────────────────────────┐
│                      ORCHESTRATION LAYER                               │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  │
│  │  Workflows  │  │   State     │  │   Error     │  │  Routing    │  │
│  │  (DAG/Graph)│  │ Management  │  │  Handling   │  │  & Branching│  │
│  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘  │
└─────────┼────────────────┼────────────────┼────────────────┼──────────┘
          │                │                │                │
          ▼                ▼                ▼                ▼
┌───────────────────────────────────────────────────────────────────────┐
│                        AGENTIC LAYER                                   │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  │
│  │   Agents    │◄─│   Memory    │  │    Tools    │  │  Reasoning  │  │
│  │  (ReAct,    │  │ (Short/Long │  │ (Functions, │  │  (CoT, ToT, │  │
│  │  Plan-Exec) │──│  Term)      │  │  MCP, Code) │  │  Planning)  │  │
│  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘  │
└─────────┼────────────────┼────────────────┼────────────────┼──────────┘
          │                │                │                │
          ▼                ▼                ▼                ▼
┌───────────────────────────────────────────────────────────────────────┐
│                     AUGMENTATION LAYER                                 │
│  ┌────────────────────────────────────────┐  ┌─────────────────────┐ │
│  │              RAG Pipeline               │  │  Structured Output  │ │
│  │  ┌────────┐ ┌────────┐ ┌────────────┐ │  │  (JSON, Code, etc.) │ │
│  │  │Chunking│→│Embedding│→│Vector Search│ │  └─────────────────────┘ │
│  │  └────────┘ └────────┘ └────────────┘ │                           │
│  │  ┌────────┐ ┌────────┐ ┌────────────┐ │                           │
│  │  │Rewrite │ │Rerank  │ │  Context   │ │                           │
│  │  └────────┘ └────────┘ └────────────┘ │                           │
│  └────────────────────────────────────────┘                           │
└───────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌───────────────────────────────────────────────────────────────────────┐
│                       PROMPTING LAYER                                  │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  │
│  │   System    │  │  Few-Shot   │  │   Context   │  │   Prompt    │  │
│  │   Prompts   │  │  Examples   │  │   Window    │  │   Caching   │  │
│  └─────────────┘  └─────────────┘  └─────────────┘  └─────────────┘  │
└───────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌───────────────────────────────────────────────────────────────────────┐
│                      FOUNDATION LAYER                                  │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  │
│  │    LLMs     │  │    VLMs     │  │  Embedding  │  │  Specialized│  │
│  │             │  │             │  │   Models    │  │   Models    │  │
│  └─────────────┘  └─────────────┘  └─────────────┘  └─────────────┘  │
└───────────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌───────────────────────────────────────────────────────────────────────┐
│                    CROSS-CUTTING CONCERNS                              │
│  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐ ┌──────────────┐ │
│  │  Guardrails  │ │  Evaluation  │ │ Observability│ │Infrastructure│ │
│  │  & Safety    │ │  & Testing   │ │  & Tracing   │ │ & Deployment │ │
│  └──────────────┘ └──────────────┘ └──────────────┘ └──────────────┘ │
└───────────────────────────────────────────────────────────────────────┘
```

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 1.0 | 2026-01-17 | Initial mapping document |

---

*This document serves as a guide for mapping GenAI use cases to technical components. Use the complexity tiers and component matrices to inform platform selection and architecture decisions based on your specific requirements.*
