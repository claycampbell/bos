# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Project Phoenix** (Internal codename) - A modular, agent-powered enterprise platform that transforms organizations from traditional process-driven companies into adaptive, autonomous systems. The platform orchestrates multiple AI agents, data services, and human-in-the-loop controls to run an entire business as a living, learning system.

**The goal**: Reinvent existing businesses to embrace AI and automation so thoroughly that they become "an AI company that does [industry]" - e.g., a real estate company becomes an AI company that does real estate.

**Product Tagline**: "Run your business like a living system."

**Mental Model**: For a comprehensive understanding of how Project Phoenix works, see [docs/plans/2025-12-08-phoenix-mental-model.md](docs/plans/2025-12-08-phoenix-mental-model.md)

## Three-Phase Lifecycle

Project Phoenix supports the complete transformation journey:

1. **Phase 1: Understanding the Company (Discovery)** - Agent-guided discovery journeys build comprehensive As-Is organizational graph (2-4 weeks)
2. **Phase 2: Reinventing the Company (Transformation Design)** - AI agents propose, humans refine, co-design To-Be operating model (4-8 weeks)
3. **Phase 3: Running the New Company (Autonomous Operations)** - Operations Agents execute workflows, Performance Agents monitor, Learning Agents optimize (ongoing)

Organizations can transform at different speeds - function-by-function rollout or continuous evolution across all phases simultaneously.

## Core Architecture Principles

### Graph Database as Source of Truth
- **Technology**: Neo4j or similar graph database
- **Core Graph**: Organizations, Functions, Processes, Workflows, People, Roles, KPIs, Systems
- **Transformation Nodes**: TransformationInitiatives and MigrationSteps are first-class entities
- **Agent Workspaces**: Isolated sandbox graphs for AI exploration before human approval
- **Pattern**: Agents propose in workspace → humans approve → promotes to core graph

### Agent Harness Architecture
Following Anthropic's harness pattern for production-grade long-running agents:
- **Structured tool access** - Agents never call APIs directly
- **State persistence** - Resume from failure, maintain context across sessions
- **Observability** - All actions logged, token tracking, performance metrics
- **Safety guardrails** - Approval gates, budget limits, anomaly detection, kill switches
- **Human-in-the-loop** - Escalation workflows, approval tracking, feedback loops

### Agent Ecosystem

**Platform Agents (Meta-layer)**:
- **Vision Agent**: Analyzes As-Is, proposes transformation scenarios (Strategic Reimagination)
- **Process Mapper Agent**: Identifies bottlenecks, redesigns workflows (Intelligent Value-Chain)
- **Data Architect Agent**: Designs data fabric and integration architecture (Digital Infrastructure)
- **Execution Agent**: Orchestrates multi-agent workflows (Autonomous Workflow Layer)
- **Performance Agent**: Monitors KPIs, generates insights (Adaptive Performance)
- **Governance Agent**: Ensures compliance, monitors for bias/drift (Safety & Compliance)
- **Learning Agent**: Analyzes outcomes, proposes improvements (Continuous Improvement)
- **The Sentinel**: Critical validator applying mental models (inversion, incentive analysis, bias detection) - non-blocking advisory perspective

**Operations Agents (Business Execution)**:
- Function-specific agents that run day-to-day business processes
- Examples: Sales Ops, Finance Ops, Customer Ops, Product Ops, Marketing Ops, HR Ops
- **Template-based (70-80%)**: Pre-built agents configured per company
- **Graph-generated (20-30%)**: Custom agents for novel reimagined roles
- Created from To-Be graph specifications during Phase 2

## User Interfaces by Phase

### Phase 1 (Discovery)
- Agent-guided conversational discovery journeys (no forms/Excel)
- Facilitator dashboard for consultants
- Real-time graph visualization as conversations build understanding

### Phase 2 (Transformation Design)
- Visual workspace/canvas for graph-based org design
- Agent proposal review (see AI scenarios from workspace graphs)
- Side-by-side As-Is vs To-Be comparison
- Approval workflow to promote workspace → core graph

### Phase 3 (Operations)
- Executive dashboards (strategic KPIs, transformation progress)
- Function dashboards (team metrics, workflow status, agent performance)
- Conversational interface (chat with agents, ask questions)
- Exception management (human-in-the-loop for escalations)
- Performance Intelligence Hub (analytics, predictions, insights)

## Core Platform Components

### Technical Infrastructure
- **Graph Database Layer**: Neo4j - core graph + workspace graphs + transformation history
- **Agent Framework**: LangGraph, AutoGen, or CrewAI for multi-agent orchestration
- **Context Engine**: Shared knowledge base, cross-agent memory, semantic search
- **Data Fabric & Integration**: Connectors to CRM/ERP/HCM, REST/GraphQL APIs, data contracts
- **Automation & Workflow Engine**: Event-driven orchestration, human-in-the-loop escalation
- **Performance Intelligence Hub**: Real-time KPIs, predictive analytics, narrative reporting
- **Governance & Security Shell**: Audit logging, RBAC, compliance monitoring, explainability
- **LLM Integration Layer**: Multi-provider (OpenAI, Anthropic, Gemini, Bedrock), routing, cost optimization

### Technical Stack Requirements
- **Cloud**: Cloud-agnostic (Azure/AWS/GCP)
- **Databases**: Graph (Neo4j), Vector (semantic search), Time-series (KPIs)
- **APIs**: REST + GraphQL with OAuth2
- **LLM Integration**: Modular support for multiple providers
- **Observability**: Prometheus/ELK/Datadog for monitoring
- **Security**: Zero-trust, encryption in transit + at rest, RBAC

## Governance & Safety Requirements

All implementations must ensure:
- Every agent action is logged and explainable
- Compliance with GDPR, HIPAA, SOC-2
- Human override capability at all critical decision points
- Continuous monitoring for model drift and bias
- Approval gates for agent workspace → core graph promotion
- Audit trails for all transformations and decisions

## Platform Goals & Success Metrics

Target outcomes:
- 80% reduction in manual data processing
- 50% faster time-to-decision
- 90% data visibility across systems
- 30% lower operational cost
- Continuous learning cycles deployed in <30 days

## Agent Design Documents

Detailed agent designs are being developed in [docs/agents/](docs/agents/):

**Phase 1 (Understanding)**:
- **Discovery Agent**: [docs/agents/discovery-agent-design.md](docs/agents/discovery-agent-design.md) - Conducts stakeholder interviews, builds As-Is graph, extracts strategic insights that enable transformation

**Phase 2 (Reinventing)**:
- **Vision Agent**: [docs/agents/vision-agent-design.md](docs/agents/vision-agent-design.md) - Analyzes As-Is graph, generates transformation scenarios (efficiency → platform → new business), uses weighted signal scoring to calibrate boldness

**Critical Validation**:
- **The Sentinel**: [docs/agents/sentinel-prompt.md](docs/agents/sentinel-prompt.md) - Applies Charlie Munger mental models (inversion, incentive analysis, bias detection) to challenge assumptions and identify risks

## Development Approach

When building Project Phoenix:
1. Start with the mental model: [docs/plans/2025-12-08-phoenix-mental-model.md](docs/plans/2025-12-08-phoenix-mental-model.md)
2. Review agent designs: [docs/agents/](docs/agents/) for Discovery, Vision, and Sentinel specifications
3. Build from real engagements: [docs/case-studies/company-a/](docs/case-studies/company-a/) - validate against actual transformation work
4. Build harness architecture first (foundational for all agents)
5. Implement graph database schema with transformation nodes
6. Create Phase 1 discovery agents with workspace pattern
7. Develop template library for Operations Agents (from real transformations)
8. Build Phase 2 design interfaces and approval workflows
9. Implement Phase 3 execution and monitoring capabilities
10. Ensure continuous feedback loops from Phase 3 → Phase 1/2

## Key Design Patterns

- **Workspace + Core Graph Pattern**: AI explores in workspace, humans approve promotion to core
- **Transformation as Entity**: Changes are first-class nodes, not just state transitions
- **Flexible Velocity**: Support both incremental and continuous transformation
- **Template + Custom Agents**: Standard templates for common functions, generated agents for novel roles
- **Agent Harness**: All agents run through harnesses with observability, safety, and persistence
- **Human-in-the-Loop**: Critical decisions always escalate to humans, never fully autonomous
