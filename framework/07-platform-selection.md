# GenAI Platform Selection Guide

*Version 4.0. Last Updated: 2026-02-27*

A comprehensive guide for evaluating and selecting GenAI implementation platforms. This document helps you compare platform options, assess organizational fit, model total cost of ownership, and make defensible architecture decisions.

---

## How to Use This Document

1. **Know your archetype, features, and tier** — via [02-use-case-archetypes.md](02-use-case-archetypes.md), [03-capability-features.md](03-capability-features.md), and [06-implementation-tiers.md](06-implementation-tiers.md).
2. **Identify candidate platform categories** — Section 1.
3. **Compare capabilities** — functional and NFR matrices in Section 2.
4. **Walk the decision trees** — Section 3.
5. **Model cost** — TCO framework in Section 4.
6. **Assess organizational fit** — Section 5.
7. **Score and decide** — Integrated scorecard in Section 6.

---

## 1. Platform Categories

### 1.1 Platform Categories Defined

| Platform Category | Description | Key Characteristics |
|-------------------|-------------|---------------------|
| **Enterprise Low-Code AI** | Microsoft-ecosystem AI builders with enterprise integration | Deep M365/Azure integration, governed by default, limited extensibility |
| **Third-Party SaaS AI** | AI features embedded in business applications | Domain-specific, pre-built workflows, vendor lock-in |
| **Cloud AI Platforms** | Hyperscaler AI/ML services | Broad services, pay-per-use, requires integration work |
| **Open-Source Frameworks** | Community-driven AI development tools | Maximum flexibility, requires expertise, no vendor lock-in |
| **Custom Development** | Bespoke solutions built from components | Full control, highest effort, maximum differentiation |
| **Hybrid** | Combination of above approaches | Balanced trade-offs, integration complexity |

### 1.2 Platform Categories by Capability

| Platform Type | Best For | Tier Support | Examples |
|---------------|----------|--------------|----------|
| **LLM APIs** | T1-T2, building blocks | T1-T4 (foundation) | OpenAI, Anthropic, Google |
| **Enterprise Low-Code AI** | T1-T3, enterprise scenarios | T1-T3 | Copilot Studio, Power Platform AI |
| **Third-Party SaaS AI** | T1-T2, domain-specific | T1-T2 | Salesforce Einstein, ServiceNow, Zendesk AI |
| **Low-Code AI Builders** | T1-T2, rapid prototyping | T1-T2 | ChatGPT Custom GPTs, Claude Projects |
| **RAG Platforms** | T2, knowledge-intensive | T2-T3 | Pinecone + LangChain, Vectara |
| **Orchestration Frameworks** | T2-T3, workflows | T2-T3 | LangChain, LlamaIndex |
| **Agent Frameworks** | T3-T4, autonomous | T3-T4 | LangGraph, AutoGen, CrewAI |
| **Full Stack AI Platforms** | T2-T4, enterprise | T2-T4 | AWS Bedrock, Azure AI, Vertex AI |
| **Custom Development** | T2-T4, unique requirements | T1-T4 | Python + frameworks, .NET + Semantic Kernel |

---

## 2. Platform Capability Matrices

### 2.1 Functional Capability Matrix

Legend: ● Full Support | ◐ Partial/Limited | ○ Requires Extension | − Not Supported

| Capability | Copilot Studio | Salesforce Einstein | ServiceNow AI | Azure AI / Bedrock | LangChain/Graph | Custom Dev |
|------------|----------------|---------------------|---------------|-------------------|-----------------|------------|
| **Complexity Tier Support** |
| T1 - Basic | ● | ● | ● | ● | ● | ● |
| T2 - Enhanced | ● | ◐ | ◐ | ● | ● | ● |
| T3 - Orchestrated | ◐ | ○ | ○ | ● | ● | ● |
| T4 - Agentic | ○ | − | − | ● | ● | ● |
| **Core Components** |
| LLM Integration | ● | ● | ● | ● | ● | ● |
| Prompt Management | ● | ◐ | ◐ | ● | ● | ● |
| RAG / Knowledge Base | ● | ◐ | ◐ | ● | ● | ● |
| Conversation Memory | ● | ● | ● | ● | ● | ● |
| Long-term Memory | ◐ | ○ | ○ | ● | ● | ● |
| Single Tool/Action | ● | ● | ● | ● | ● | ● |
| Multi-tool Orchestration | ◐ | ○ | ○ | ● | ● | ● |
| Custom Tool Development | ◐ | ○ | ○ | ● | ● | ● |
| Code Execution | − | − | − | ● | ● | ● |
| Workflow / Chains | ● | ◐ | ◐ | ● | ● | ● |
| Conditional Logic | ● | ◐ | ◐ | ● | ● | ● |
| Parallel Execution | ○ | − | − | ● | ● | ● |
| Agent Autonomy | ○ | − | − | ● | ● | ● |
| Multi-agent Coordination | − | − | − | ◐ | ● | ● |
| Structured Output | ● | ◐ | ◐ | ● | ● | ● |
| Streaming | ◐ | ◐ | ◐ | ● | ● | ● |
| **Integration** |
| Enterprise Systems | ● | ● (Salesforce) | ● (ServiceNow) | ◐ | ○ | ● |
| Microsoft 365 | ● | ○ | ○ | ◐ | ○ | ● |
| Custom APIs | ◐ | ◐ | ◐ | ● | ● | ● |
| Databases | ◐ | ◐ | ◐ | ● | ● | ● |
| File Systems | ◐ | ○ | ○ | ● | ● | ● |

### 2.2 Non-Functional Capability Matrix

Legend: ● Built-in | ◐ Partial/Configurable | ○ Requires Custom Work | − Not Available

| NFR Category | Copilot Studio | Salesforce Einstein | ServiceNow AI | Azure AI / Bedrock | LangChain/Graph | Custom Dev |
|--------------|----------------|---------------------|---------------|-------------------|-----------------|------------|
| **Information Security** |
| Enterprise SSO/OIDC | ● | ● | ● | ● | ○ | ○ |
| MFA Integration | ● | ● | ● | ● | ○ | ○ |
| RBAC | ● | ● | ● | ● | ○ | ○ |
| Data Encryption at Rest | ● | ● | ● | ● | ○ | ○ |
| Data Encryption in Transit | ● | ● | ● | ● | ● | ○ |
| PII Masking/Redaction | ◐ | ◐ | ◐ | ● | ○ | ○ |
| DLP Integration | ● | ◐ | ◐ | ● | ○ | ○ |
| Prompt Injection Defense | ◐ | ◐ | ◐ | ◐ | ○ | ○ |
| Audit Logging | ● | ● | ● | ● | ○ | ○ |
| **Performance & Scale** |
| Auto-scaling | ● | ● | ● | ● | ○ | ○ |
| Global Distribution | ● | ● | ● | ● | ○ | ○ |
| Response Caching | ◐ | ◐ | ◐ | ● | ○ | ○ |
| Semantic Caching | − | − | − | ◐ | ○ | ○ |
| Rate Limiting | ● | ● | ● | ● | ○ | ○ |
| **Resilience** |
| Automatic Failover | ● | ● | ● | ● | ○ | ○ |
| Circuit Breakers | ● | ● | ● | ● | ○ | ○ |
| State Recovery | ◐ | ◐ | ◐ | ● | ○ | ○ |
| Multi-region HA | ● | ● | ● | ● | ○ | ○ |
| **Observability** |
| Built-in Analytics | ● | ● | ● | ● | ◐ | ○ |
| Custom Metrics | ◐ | ◐ | ◐ | ● | ● | ● |
| Distributed Tracing | ◐ | ◐ | ◐ | ● | ● | ● |
| Cost Attribution | ● | ● | ● | ● | ○ | ○ |
| **Responsible AI** |
| Content Filtering | ● | ● | ● | ● | ○ | ○ |
| Custom Guardrails | ◐ | ○ | ○ | ● | ● | ● |
| Bias Detection | ○ | ○ | ○ | ◐ | ○ | ○ |
| Explainability/Citations | ◐ | ◐ | ◐ | ◐ | ● | ● |
| HITL Workflows | ● | ● | ● | ◐ | ● | ● |
| **Compliance** |
| SOC 2 Type II | ● | ● | ● | ● | N/A | ○ |
| ISO 27001 | ● | ● | ● | ● | N/A | ○ |
| HIPAA BAA Available | ● | ● | ● | ● | N/A | ○ |
| GDPR Compliance | ● | ● | ● | ● | ○ | ○ |
| FedRAMP (US Gov) | ● | ◐ | ◐ | ● | N/A | ○ |
| Data Residency Control | ● | ● | ● | ● | ○ | ○ |
| **DevOps** |
| CI/CD Integration | ◐ | ◐ | ◐ | ● | ● | ● |
| Version Control | ◐ | ◐ | ◐ | ● | ● | ● |
| Infrastructure as Code | ◐ | ○ | ○ | ● | ● | ● |
| A/B Testing | ○ | ○ | ○ | ● | ● | ● |

### 2.3 NFR Delivery Comparison (Narrative)

| NFR Category | Copilot Studio | Third-Party SaaS | Cloud AI Platforms | Custom Development |
|:---|:---|:---|:---|:---|
| **Security** | Inherited from M365/Azure. Strong enterprise security by default. | Inherited from vendor. Strong within vendor's security model. | Must configure. Building blocks available, requires assembly. | Must build. Full responsibility but full control. |
| **Authentication** | Azure AD/Entra ID native. Zero additional work for M365 orgs. | Native to platform. May need federation for external users. | IAM services available. Requires integration work. | Implement with identity providers. Full control over flows. |
| **Compliance** | Inherits Microsoft compliance certifications. Easiest path for regulated industries. | Vendor certifications apply. Check specifics per vendor. | Rich compliance controls. May require configuration. | Must achieve independently. Highest effort, full control. |
| **Performance** | Managed, auto-scaled. Limited tuning options. | Managed by vendor. Limited visibility/control. | Full control with managed services. Requires expertise. | Full control and optimization. Requires expertise. |
| **Observability** | Built-in analytics. Limited custom metrics. | Vendor dashboards. Limited custom observability. | Full observability stack available. Requires integration. | Complete control. Must build/integrate everything. |
| **Responsible AI** | Azure AI content filters inherited. Limited custom guardrails. | Basic moderation. Limited customization. | Rich tools available. Requires setup. | Full control over all aspects. Requires implementation. |

---

## 3. Decision Trees

### 3.1 Primary Decision Tree

```
START: What is your use case complexity tier?
│
├─► T1-T2 (Basic/Enhanced)
│   │
│   └─► Are you in the Microsoft 365 ecosystem?
│       │
│       ├─► YES: Do you need deep M365 integration (Teams, SharePoint, D365)?
│       │   ├─► YES ──► Copilot Studio (primary)
│       │   └─► NO ──► Is this tied to a specific business domain?
│       │       ├─► CRM/Sales ──► Salesforce Einstein (if SFDC shop)
│       │       ├─► ITSM ──► ServiceNow AI (if ServiceNow shop)
│       │       └─► General ──► Evaluate Copilot Studio vs Cloud AI
│       │
│       └─► NO: What is your cloud provider?
│           ├─► AWS ──► Amazon Bedrock
│           ├─► GCP ──► Vertex AI
│           └─► Multi/None ──► OpenAI API + orchestration framework
│
├─► T3 (Orchestrated)
│   │
│   └─► Do you have AI/ML engineering capability?
│       ├─► YES: What is your flexibility requirement?
│       │   ├─► HIGH ──► LangChain/LlamaIndex + Cloud AI
│       │   └─► MEDIUM ──► Copilot Studio + custom extensions (if 80% fit)
│       │                   otherwise Cloud AI + orchestration framework
│       └─► NO: Can you accept low-code limitations?
│           ├─► YES ──► Copilot Studio + partner solutions
│           └─► NO ──► Build team capability or engage SI
│
└─► T4 (Agentic)
    │
    └─► Custom Development Required
        ├─► Evaluate: LangGraph, AutoGen, CrewAI, Semantic Kernel
        └─► Consider: Hybrid approach with enterprise platform for
            security/compliance wrapper around custom agent core
```

### 3.2 NFR-Driven Decision Overlay

When your use case involves sensitive data or stringent compliance:

```
NFR ASSESSMENT: Does use case involve sensitive data or regulated domain?
│
├─► YES: What type of data sensitivity?
│   │
│   ├─► Customer PII
│   │   └─► REQUIREMENT: PII masking/redaction before LLM
│   │       ├─► Copilot Studio: ◐ Built-in DLP, requires config
│   │       ├─► Cloud AI: ● Use AWS Macie / Azure Purview / Google DLP
│   │       └─► Custom: ○ Implement Presidio or similar
│   │
│   ├─► Healthcare PHI (HIPAA)
│   │   └─► REQUIREMENT: HIPAA BAA + audit trails + access controls
│   │       ├─► Copilot Studio: ● HIPAA-eligible with proper config
│   │       ├─► Cloud AI: ● HIPAA-eligible services available
│   │       └─► Custom: ○ Must achieve compliance independently
│   │
│   ├─► Financial Data (PCI, SOX)
│   │   └─► REQUIREMENT: PCI-DSS compliance + SOX controls
│   │       ├─► Copilot Studio: ● Certified, inherits controls
│   │       ├─► Cloud AI: ● PCI-certified services available
│   │       └─► Custom: ○ Requires certification effort
│   │
│   ├─► Legal / Privileged
│   │   └─► REQUIREMENT: Strict access control + audit + retention
│   │       └─► All platforms require careful config; consider on-prem LLM
│   │
│   └─► Classified / Government
│       └─► REQUIREMENT: FedRAMP, IL4/IL5, or equivalent
│           ├─► Copilot Studio: ● GCC/GCC-High available
│           ├─► Cloud AI: ● GovCloud options (AWS, Azure)
│           └─► Custom: ○ Air-gapped deployment required
│
└─► NO: Standard security practices apply → Follow primary decision tree
```

---

## 4. Total Cost of Ownership (TCO)

### 4.1 Cost Categories

| Cost Category | Description | Varies By |
|---------------|-------------|-----------|
| **Initial Development** | Design, build, configuration, integration | Platform complexity, skill availability |
| **Platform/License Fees** | Subscription, per-user, or usage-based | Platform choice, scale |
| **Infrastructure** | Compute, storage, networking | Deployment model, scale |
| **LLM/API Consumption** | Token costs, API calls | Usage volume, model choice |
| **Operations & Support** | Monitoring, maintenance, incident response | Platform maturity, team size |
| **Compliance & Security** | Certifications, audits, security tooling | Regulatory requirements |
| **Training & Enablement** | Team skill development | Platform learning curve |
| **Integration** | Connecting to enterprise systems | Architecture complexity |
| **Evolution & Enhancement** | Future development, scaling | Platform flexibility |

### 4.2 TCO Comparison Model

| Cost Element | Copilot Studio | Third-Party SaaS | Cloud AI Platform | Custom Development |
|:---|:---|:---|:---|:---|
| **Initial** |
| Design & Architecture | $5K-20K | $5K-15K | $20K-100K | $50K-300K+ |
| Development/Config | $10K-50K | $10K-30K | $50K-200K | $100K-500K+ |
| Integration | $10K-30K | $20K-50K | $30K-100K | $30K-150K |
| Testing & Validation | $5K-15K | $5K-15K | $20K-60K | $30K-100K |
| **Ongoing (Annual)** |
| Platform Licensing | $15K-150K* | $20K-200K* | $0 (pay-per-use) | $0 |
| Infrastructure | Included | Included | $10K-200K | $20K-500K |
| LLM Consumption | Included* | Included* | $10K-500K+ | $10K-500K+ |
| Operations | $10K-30K | $10K-30K | $30K-150K | $50K-300K |
| Maintenance/Updates | Included | Included | $20K-80K | $50K-200K |
| **Hidden Costs** |
| Skill Development | Low | Low | Medium | High |
| Vendor Lock-in Risk | Medium | High | Medium | None |
| Exit/Migration | Medium | High | Low-Medium | N/A |

*Ranges are illustrative; costs vary by tier, user count, and usage volume.*

### 4.3 Cost Trajectory by Scale

```
Annual Cost ($)
    │
400K│                                                    ┌─── Custom Dev
    │                                              ┌─────┘    (High initial,
350K│                                        ┌─────┘          lower at scale)
    │                                  ┌─────┘
300K│                            ┌─────┘
    │                      ┌─────┴──────────────────────────── Cloud AI
250K│                ┌─────┘                                   (Pay-per-use,
    │          ┌─────┘                                         linear)
200K│    ┌─────┘
    │────┼─────────────────────────────────────────────────── Copilot Studio
150K│    │                                                     (Per-user,
    │    │          ┌──────────────────────────────────────── predictable)
100K│    │    ┌─────┘
    │    └────┘ SaaS AI (per-user/org)
 50K│
    │
  0 ├────────┬────────┬────────┬────────┬────────┬──────► Users/Volume
    0       100      500     1000     2500     5000

Key Inflection Points:
 • ~100-500 users: SaaS platforms become more cost-effective than Cloud AI
 • ~2000-5000 users: Custom development ROI starts to materialize
 • ~5000+ users: Custom development often has best unit economics
```

### 4.4 Cost-Benefit by Complexity Tier

| Dimension | T1 Basic | T2 Enhanced | T3 Orchestrated | T4 Agentic |
|-----------|----------|-------------|-----------------|------------|
| **Typical Initial Investment** | $10K-50K | $50K-150K | $150K-500K | $500K-2M+ |
| **Annual Operating Cost** | $20K-75K | $75K-200K | $200K-500K | $500K-1.5M+ |
| **Time to First Value** | Days-Weeks | Weeks-Months | Months | Quarters |
| **Time to Full ROI** | 3-6 months | 6-12 months | 12-18 months | 18-36 months |
| **Typical Annual Benefit** | $50K-200K | $200K-750K | $750K-3M | $3M-20M+ |
| **Expected ROI (Year 1)** | 50-200% | 75-250% | 50-150% | 25-100% |
| **Expected ROI (3-Year)** | 200-500% | 300-600% | 250-500% | 300-800% |
| **Risk-Adjusted Factor** | 0.8-0.9 | 0.7-0.85 | 0.6-0.75 | 0.5-0.65 |

### 4.5 ROI Calculation Framework

```
TOTAL BENEFIT (Annual)
  Efficiency Gains    = (Hours Saved × Hourly Rate) × Users × Frequency
  Quality Improvement = (Error Rate Reduction × Cost per Error) × Volume
  Revenue Enhancement = Incremental Revenue × Attribution %
  Cost Avoidance      = Risk Reduction % × Potential Loss

TOTAL COST (Annual)
  Initial Investment  = Development + Integration + Training (amortized)
  Platform/License    = Subscription + Per-user fees
  Infrastructure      = Compute + Storage + Network
  LLM Consumption     = Tokens × Price per Token × Volume
  Operations          = Support FTEs + Tools + Maintenance

ROI METRICS
  Simple ROI      = (Total Benefit − Total Cost) / Total Cost × 100%
  Payback Period  = Initial Investment / (Annual Benefit − Annual Cost)
  NPV (3-year)    = Σ (Net Benefit_t / (1 + r)^t) − Initial Investment

TYPICAL TARGETS
  Simple ROI:     >100% (Year 1), >300% (3-year)
  Payback Period: <18 months for T1-T2, <24 months for T3-T4
```

---

## 5. Organizational Fit Assessment

### 5.1 Platform Trade-Off Spectrum

```
                    SaaS / Low-Code ◄─────────────────────► Custom Dev

Speed to Value:     Fast ──────────────────────────────── Slow
Flexibility:        Limited ───────────────────────────── Unlimited
Operational Burden: Managed ───────────────────────────── Self-managed
TCO (at scale):     Higher/user ───────────────────────── Lower/user
Skill Requirements: Business/Config ───────────────────── Engineering
Vendor Lock-in:     High ──────────────────────────────── None
NFR Maturity (OOTB):High ──────────────────────────────── Build it
```

### 5.2 Platform Comparison by Dimension

| Dimension | Copilot Studio | Salesforce Einstein | Cloud AI Platforms | OSS Frameworks | Custom Dev |
|-----------|----------------|---------------------|-------------------|----------------|------------|
| Time to First Value | Days | Days | Weeks | Weeks | Months |
| Time to Production | Weeks | Weeks | Weeks-Months | Months | Months-Quarters |
| Initial Investment | Low | Low | Medium | Low-Medium | High |
| Scaling Cost Model | Per user/msg | Per user | Pay-per-use | Infra + usage | Infra + dev |
| Skill Requirements | Low-code | Admin/config | Cloud + AI dev | AI/ML engineering | Full stack AI |
| Customization Ceiling | Medium | Low-Medium | High | Very High | Unlimited |
| Vendor Lock-in Risk | Medium-High | High | Medium | Low | None |
| Exit Complexity | Medium | High | Medium | Low | N/A |
| Ecosystem Strength | M365/Azure | Salesforce | Cloud-native | OSS community | Team-dependent |

### 5.3 Capability Assessment Matrix

| Capability Area | Required for SaaS | Required for Cloud AI | Required for Custom |
|:---|:---|:---|:---|
| Low-code / Config | ● Required | ○ Nice-to-have | − Not needed |
| Cloud Architecture | ○ Nice-to-have | ● Required | ● Required |
| AI/ML Engineering | − Not needed | ◐ Helpful | ● Required |
| Full-stack Dev | ○ Nice-to-have | ◐ Helpful | ● Required |
| DevOps/MLOps | ○ Nice-to-have | ● Required | ● Required |
| Vendor Management | ● Required | ● Required | ◐ Helpful |
| Change Management | ● Required | ● Required | ● Required |
| Executive Sponsorship | ◐ Helpful | ● Required | ● Required |

### 5.4 Ecosystem Alignment Checklists

**Microsoft Ecosystem (Favors Copilot Studio)**
- [ ] Primary productivity suite is Microsoft 365
- [ ] Azure is primary or significant cloud provider
- [ ] Active Directory/Entra ID is identity provider
- [ ] Teams is primary collaboration platform
- [ ] Power Platform already in use
- [ ] Microsoft E3/E5 licensing in place

**Salesforce Ecosystem (Favors Einstein)**
- [ ] Salesforce is CRM system of record
- [ ] Sales/Service Cloud widely adopted
- [ ] Salesforce integrations already extensive
- [ ] Salesforce admin capabilities exist

**Cloud-Native (Favors Cloud AI Platforms)**
- [ ] Multi-cloud or cloud-agnostic strategy
- [ ] Strong cloud engineering team
- [ ] Kubernetes/container expertise
- [ ] CI/CD and DevOps maturity
- [ ] Infrastructure-as-code practices

**Custom Development**
- [ ] AI/ML engineering team (or ability to build one)
- [ ] Willingness to invest long-term
- [ ] Unique differentiation requirements
- [ ] Scale economics justify investment

### 5.5 Organizational Readiness Scoring

| Dimension | Weight | Score (1-5) |
|-----------|--------|-------------|
| **SaaS/Low-Code Readiness** |
| Vendor relationship maturity | 20% | |
| Low-code skills availability | 25% | |
| Procurement speed | 15% | |
| Change management capability | 20% | |
| Ecosystem alignment | 20% | |
| **Total** | 100% | ___/5.0 |

| Dimension | Weight | Score (1-5) |
|-----------|--------|-------------|
| **Cloud AI Platform Readiness** |
| Cloud engineering capability | 25% | |
| DevOps/MLOps maturity | 20% | |
| AI/ML expertise | 20% | |
| Cost management discipline | 15% | |
| Multi-team coordination | 20% | |
| **Total** | 100% | ___/5.0 |

| Dimension | Weight | Score (1-5) |
|-----------|--------|-------------|
| **Custom Development Readiness** |
| AI/ML engineering team | 30% | |
| Full-stack development | 20% | |
| Long-term investment commitment | 20% | |
| Operational ownership capability | 15% | |
| Executive sponsorship | 15% | |
| **Total** | 100% | ___/5.0 |

**Interpretation:**
- 4.0-5.0: Strong fit — proceed with confidence
- 3.0-3.9: Viable — invest in capability gaps
- 2.0-2.9: Significant gaps — consider alternatives or build first
- < 2.0: Poor fit — strongly consider alternative approach

### 5.6 AI Maturity Model

| Level | Name | Characteristics | Typical Platform Fit |
|-------|------|-----------------|---------------------|
| **1: Exploring** | AI-Curious | Experimenting, no production AI | SaaS AI, LLM APIs |
| **2: Experimenting** | AI-Aware | Pilots underway, basic skills | Low-Code AI, Simple RAG |
| **3: Operationalizing** | AI-Enabled | Production AI, growing team | Cloud AI, Orchestration Frameworks |
| **4: Scaling** | AI-Driven | Multiple production systems, formal governance | Custom Dev, Agent Frameworks |
| **5: Optimizing** | AI-Native | AI embedded in culture, CoE | Full Custom, MLOps Platform |

**Maturity-to-Platform Fit:**

| Maturity Level | Recommended Tier | Recommended Platform Type |
|:---|:---|:---|
| Level 1 | T1 only | SaaS AI (Copilot Studio, ChatGPT Enterprise) |
| Level 2 | T1-T2 | SaaS AI + Cloud AI APIs |
| Level 3 | T1-T3 | Cloud AI + Orchestration Frameworks |
| Level 4 | T1-T4 | Custom + Frameworks |
| Level 5 | T1-T4 | Full Custom + MLOps |

---

## 6. Hybrid Architecture Patterns

When no single platform meets all requirements, consider hybrid approaches.

### 6.1 Common Hybrid Patterns

| Pattern | Description | When to Use |
|---------|-------------|-------------|
| **Security Wrapper** | Enterprise platform provides security/compliance around custom AI core | T3-T4 requiring enterprise NFRs |
| **Capability Extension** | Low-code handles common cases, custom handles edge cases | 80/20 scenarios |
| **Domain Bridging** | Connect multiple SaaS AI solutions | Multi-domain enterprise |
| **Data Sovereignty** | Sensitive processing on-premises, non-sensitive in cloud | Regulated data + cloud scale |
| **Phased Migration** | Start with SaaS, progressively move to custom | Rapid start with planned evolution |

### 6.2 Pattern A: Security Wrapper

```
┌─────────────────────────────────────────────────────────┐
│              Enterprise Security Layer                    │
│            (Copilot Studio / Power Platform)              │
│  SSO │ DLP │ Audit Logging │ Content Safety │ Rate Limit │
└────────────────────────┬────────────────────────────────┘
                         │ Secure API Call
                         ▼
┌─────────────────────────────────────────────────────────┐
│              Custom AI Service Layer                      │
│            (Your T3/T4 Implementation)                    │
│  Complex orchestration │ Multi-agent │ Custom tools       │
│  Specialized memory │ Domain-specific reasoning           │
└────────────────────────┬────────────────────────────────┘
                         ▼
┌─────────────────────────────────────────────────────────┐
│                 Foundation Services                       │
│  LLM APIs  │  Vector DB  │  Enterprise Systems  │  APIs  │
└─────────────────────────────────────────────────────────┘
```

### 6.3 Pattern B: Capability Extension

```
┌─────────────────────────────────────────────────────────┐
│                    User Interaction                       │
│               (Teams, Web, Mobile)                        │
└────────────────────────┬────────────────────────────────┘
                         ▼
┌─────────────────────────────────────────────────────────┐
│                  Copilot Studio                           │
│           (Primary — 80% of requests)                    │
│  FAQ │ Knowledge base │ Simple workflows │ Templates     │
│─────────────────────────────────────────────────────────│
│           Routing: Is this complex?                      │
│  ┌──── NO ────► Handle in Copilot                        │
│  └──── YES ───► Route to Custom Service ─────────┐      │
└──────────────────────────────────────────────────┼──────┘
                                                   ▼
                              ┌──────────────────────────┐
                              │    Custom AI Service      │
                              │   (Complex — 20% cases)   │
                              │  Research │ Analysis       │
                              │  Autonomous │ Edge cases   │
                              └──────────────────────────┘
```

---

## 7. Skills & Team Composition

### 7.1 Skills Requirements by Tier

| Skill Area | T1 Basic | T2 Enhanced | T3 Orchestrated | T4 Agentic |
|:---|:---|:---|:---|:---|
| AI/ML Fundamentals | Awareness | Practitioner | Practitioner | Expert |
| Prompt Engineering | Basic | Intermediate | Advanced | Expert |
| Software Engineering | Basic | Intermediate | Advanced | Expert |
| RAG/Vector DB | − | Basic | Intermediate | Advanced |
| Agent Development | − | − | Basic | Expert |
| Cloud Architecture | Foundational | Foundational | Professional | Architect |
| DevOps/MLOps | − | Basic | Intermediate | Advanced |
| Security | Awareness | Practitioner | Practitioner | Specialist |

### 7.2 Team Composition

**SaaS / Low-Code Platforms**

| Role | T1 | T2 | T3 |
|------|----|----|-----|
| Platform Admin/Configurator | 0.5 FTE | 1 FTE | 1-2 FTE |
| Business Analyst | 0.25 FTE | 0.5 FTE | 1 FTE |
| Solution Architect | 0.1 FTE | 0.25 FTE | 0.5 FTE |
| Security/Compliance | 0.1 FTE | 0.25 FTE | 0.5 FTE |
| **Total** | **~1 FTE** | **~2 FTE** | **~4 FTE** |

**Cloud AI / Custom Development**

| Role | T2 | T3 | T4 |
|------|----|----|-----|
| AI/ML Engineer | 1 FTE | 2 FTE | 3-5 FTE |
| Backend Developer | 0.5 FTE | 1-2 FTE | 2-3 FTE |
| DevOps/MLOps Engineer | 0.25 FTE | 0.5-1 FTE | 1-2 FTE |
| Data Engineer | 0.25 FTE | 0.5-1 FTE | 1-2 FTE |
| Solution Architect | 0.25 FTE | 0.5 FTE | 1 FTE |
| Security Engineer | 0.1 FTE | 0.25 FTE | 0.5-1 FTE |
| QA/Test Engineer | 0.25 FTE | 0.5 FTE | 1 FTE |
| Product Manager | 0.25 FTE | 0.5 FTE | 1 FTE |
| **Total** | **~3 FTE** | **~6-8 FTE** | **~12-18 FTE** |

### 7.3 Skills Development Pathways

```
PATH A: Traditional Developer → AI Engineer
  Week 1-2: LLM Basics → Week 3-6: Prompt Eng & APIs → Week 7-12: RAG & Memory → Month 4-6: Agents

PATH B: Platform Admin → AI Configurator
  Week 1-2: AI Concepts → Week 3-4: Platform Basics → Week 5-8: Advanced Config → Month 3-4: Integration

PATH C: Data Engineer → AI Infrastructure Engineer
  Week 1-2: Vector DB Ops → Week 3-6: Embedding & Retrieval → Week 7-10: Chunking → Month 3-6: Advanced RAG

TRAINING INVESTMENT BY TIER
  T1-T2 (SaaS):    2-4 weeks,  $2K-5K per person
  T2-T3 (Cloud AI): 6-12 weeks, $5K-15K per person
  T3-T4 (Custom):   3-6 months, $15K-30K per person
```

---

## 8. Risk Assessment by Platform

### 8.1 Risk Matrix by Platform Choice

| Risk Category | Copilot Studio | Third-Party SaaS | Cloud AI | Custom Dev |
|:---|:---|:---|:---|:---|
| **Implementation** |
| Project Failure | Low | Low | Medium | High |
| Schedule Overrun | Low | Low | Medium | High |
| Budget Overrun | Low | Low | Medium | High |
| **Operational** |
| Service Outage | Low (managed) | Low (managed) | Medium | Medium-High |
| Security Incident | Low (inherits) | Low (inherits) | Medium | High (owned) |
| **Strategic** |
| Vendor Lock-in | Medium | High | Low-Medium | None |
| Feature Parity | Medium | Medium | Low | None |
| Pricing Changes | High | High | Medium | Low |
| Capability Ceiling | Medium-High | High | Low | None |
| Migration Difficulty | Medium | High | Medium | N/A |

### 8.2 AI-Specific Risk Assessment

| AI Risk | Description | Mitigation |
|---------|-------------|------------|
| **Hallucination** | False/misleading output | RAG grounding, citations, human review |
| **Prompt Injection** | Malicious inputs manipulate model | Input validation, output filtering, sandboxing |
| **Data Leakage** | Sensitive info exposed | PII filtering, DLP, training data controls |
| **Bias Amplification** | Model perpetuates biases | Bias testing, diverse training, fairness monitoring |
| **Autonomous Harm** | Agent takes damaging actions | Action limits, approval workflows, reversibility |
| **Over-reliance** | Users trust without verification | Training, uncertainty indicators, HITL |

---

## 9. Integrated Solution Selection Scorecard

### 9.1 Master Evaluation Dimensions

| Dimension | Weight | Description |
|-----------|--------|-------------|
| **Functional Fit** | 20% | Meets use case requirements |
| **NFR Fit** | 15% | Meets non-functional requirements |
| **Cost Efficiency** | 15% | TCO relative to value |
| **Risk Profile** | 15% | Risk level and manageability |
| **Skills Alignment** | 10% | Match with available or buildable skills |
| **Strategic Fit** | 10% | Alignment with organizational strategy |
| **Time-to-Value** | 10% | Speed to production |
| **Scalability** | 5% | Ability to grow with demand |

### 9.2 Comparative Solution Template

| Criteria | Option A: ___ | Option B: ___ | Option C: ___ |
|----------|---------------|---------------|---------------|
| Platform Type | | | |
| Max Tier Supported | | | |
| Functional Score | /5.0 | /5.0 | /5.0 |
| NFR Score | /5.0 | /5.0 | /5.0 |
| Cost Score | /5.0 | /5.0 | /5.0 |
| Risk Score | /5.0 | /5.0 | /5.0 |
| Skills Score | /5.0 | /5.0 | /5.0 |
| Strategic Score | /5.0 | /5.0 | /5.0 |
| Time-to-Value Score | /5.0 | /5.0 | /5.0 |
| Scalability Score | /5.0 | /5.0 | /5.0 |
| **WEIGHTED TOTAL** | **/5.0** | **/5.0** | **/5.0** |

**Interpretation:** 4.5-5.0 Excellent | 4.0-4.4 Good | 3.5-3.9 Acceptable | 3.0-3.4 Marginal | < 3.0 Poor fit

---

## 10. Quick Reference

### 10.1 Platform Selection Summary Matrix

| Factor | Copilot Studio | Salesforce Einstein | ServiceNow AI | Cloud AI (Azure/AWS/GCP) | Custom Dev |
|--------|----------------|---------------------|---------------|-------------------------|------------|
| **Best For** | M365-centric, T1-T3 | SFDC-centric CRM | ITSM-focused | Flexible T2-T4 | Unique T3-T4 |
| **Functional Ceiling** | T3 (limited) | T2 | T2 | T4 | T4 |
| **Time to Value** | Fast | Fast | Fast | Medium | Slow |
| **TCO (small)** | Medium | Medium | Medium | Higher | Highest |
| **TCO (large)** | Higher | Higher | Higher | Medium | Lower |
| **Flexibility** | Medium | Low | Low | High | Unlimited |
| **Lock-in Risk** | Medium | High | High | Medium | None |
| **Sensitive Data** | Good (with config) | Good (within SF) | Good (within SN) | Excellent | Excellent |

### 10.2 Quick Decision Guide

| If You Have... | And Need... | Consider... | Watch Out For... |
|:---|:---|:---|:---|
| M365 ecosystem | T1-T2, fast deployment | Copilot Studio | T3+ complexity ceiling |
| Salesforce | CRM-integrated AI | Einstein | Limited customization |
| AWS cloud | Flexibility, scale | Bedrock + LangChain | Integration complexity |
| Azure cloud | Enterprise security | Azure AI + Semantic Kernel | Learning curve |
| Strong AI team | T3-T4, differentiation | Custom with frameworks | Time and cost |
| Limited skills | Quick wins | SaaS AI platforms | Vendor lock-in |
| Sensitive data | Compliance, control | Enterprise platforms or on-prem | Higher cost |
| High volume | Cost efficiency | Custom with optimization | Development investment |

### 10.3 Use Case → Platform Type

| Use Case Category | T1 Platform | T2 Platform | T3 Platform | T4 Platform |
|:---|:---|:---|:---|:---|
| Content Generation | LLM API | LLM + Templates | Orchestration Framework | Agent Framework |
| Knowledge Work | LLM API | RAG Platform | Orchestration + RAG | Agentic RAG |
| Autonomous Systems | LLM + Tool | Multi-tool Setup | Workflow Platform | Agent Framework |
| Conversational | LLM API | Chatbot Platform | Virtual Agent Platform | Agent Framework |
| Code Development | Code LLM API | IDE Integration | Code Agent | Full SWE Agent |
| Decision Intelligence | LLM API | RAG + Analytics | BI Integration | Analysis Agent |

### 10.4 Component → Platform/Tool Mapping

| Component | Open Source | Commercial |
|-----------|------------|------------|
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

### 10.5 NFR Platform/Tool Mapping

| NFR Category | Open Source | Commercial |
|:---|:---|:---|
| Authentication/IAM | Keycloak, Authentik | Okta, Auth0, Azure AD |
| Secrets Management | HashiCorp Vault, SOPS | AWS Secrets Manager, Azure Key Vault |
| Encryption | OpenSSL, Cryptography libs | Cloud KMS, HSM services |
| DLP/PII Detection | Presidio, spaCy NER | Google DLP, AWS Macie |
| Observability | OpenTelemetry, Langfuse, Prometheus | Datadog, LangSmith, Arize |
| Cost Tracking | Custom dashboards | LangSmith, Helicone, Portkey |
| Guardrails | NeMo Guardrails, Guardrails AI | Lakera, proprietary filters |
| Bias Detection | AI Fairness 360, Fairlearn | Fiddler, Arthur AI |
| Load Testing | Locust, k6 | Gatling Enterprise, LoadRunner |
| CI/CD for ML | MLflow, DVC, Kubeflow | Weights & Biases, SageMaker |
| Compliance/Audit | Open Policy Agent, Falco | Vanta, Drata, Lacework |
| Circuit Breakers | Resilience4j, Hystrix | Cloud-native solutions |

---

## Related Documents

- **[01-overview.md](01-overview.md)** — Start here
- **[03-capability-features.md](03-capability-features.md)** — Layer 2: Features and mapping matrices
- **[02-use-case-archetypes.md](02-use-case-archetypes.md)** — Layer 1: Archetype definitions
- **[04-technical-components.md](04-technical-components.md)** — Layer 3: Component catalog
- **[06-implementation-tiers.md](06-implementation-tiers.md)** — Maturity tiers & stack patterns
- **[05-component-selection-guide.md](05-component-selection-guide.md)** — Evaluation tools

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 4.0 | 2026-02-27 | Extracted from 06-implementation-tiers.md as standalone document. Consolidated platform selection framework (former Sections 7.0-7.13), TCO framework, organizational fit assessment, hybrid patterns, skills/team composition, risk matrix, integrated scorecard, and quick reference guides. Added AI maturity model and skills pathways. |
| 3.0 | 2026-01-18 | Original platform selection content (within mapping doc). |
