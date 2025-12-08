# Project Phoenix: Platform Mental Model

**Date**: 2025-12-08
**Status**: Design Foundation
**Purpose**: Establish shared understanding of how Project Phoenix transforms organizations into AI-native companies

---

## Executive Summary

Project Phoenix is a full-lifecycle platform that transforms traditional organizations into "AI companies that do [industry]." It supports three phases: **Understanding** (discovery), **Reinventing** (transformation design), and **Running** (autonomous operations). The platform uses a graph database to model organizations, AI agents to analyze and propose improvements, and human consultants to facilitate and approve changes.

---

## Section 1: The Three-Phase Lifecycle

### Phase 1: Understanding the Company (Discovery)
- **Purpose**: Build comprehensive As-Is organizational model
- **Input**: Agent-guided discovery journeys with stakeholders
- **Process**:
  - Discovery Agents conduct adaptive, conversational interviews
  - Consultants facilitate stakeholder sessions
  - Real-time graph building as conversations happen
  - Automated gap analysis identifies missing context
- **Output**: Complete As-Is organizational graph
- **Duration**: 2-4 weeks typically

### Phase 2: Reinventing the Company (Transformation Design)
- **Purpose**: Co-design To-Be operating model with AI + human collaboration
- **Input**: As-Is organizational graph
- **Process**:
  - Vision Agent analyzes As-Is, proposes transformation scenarios in workspace
  - Process Mapper Agent identifies bottlenecks and automation opportunities
  - Data Architect Agent designs technical architecture
  - Consultants facilitate design workshops with leadership
  - Iterative refinement: AI proposes → humans refine → approve
  - Approved designs promote from workspace → core graph
- **Output**: To-Be organizational graph + transformation roadmap with initiatives
- **Duration**: 4-8 weeks typically

### Phase 3: Running the New Company (Autonomous Operations)
- **Purpose**: Execute operations with AI agents + human teams
- **Input**: Approved To-Be graph and transformation initiatives
- **Process**:
  - Deploy Operations Agents (template-based + custom-generated)
  - Execution Agent orchestrates multi-agent workflows
  - Performance Agent monitors KPIs and generates insights
  - Learning Agent analyzes outcomes, proposes optimizations
  - Governance Agent ensures compliance and safety
  - Human-in-the-loop for exceptions and critical decisions
- **Output**: Live autonomous operations + continuous improvement feedback
- **Duration**: Ongoing with continuous evolution

### Flexible Transformation Velocity
- Organizations transform at different speeds based on change capacity
- Support for both:
  - **Function-by-function rollout**: Sales in Phase 3 while Marketing in Phase 1
  - **Continuous transformation loop**: All phases happening simultaneously
- Multiple concurrent transformation streams at different speeds

---

## Section 2: Graph Database Architecture

### Core Organizational Graph (Source of Truth)

**Node Types**:
- Organizations, Functions, Processes, Workflows
- People, Roles, Skills
- KPIs, Metrics, Goals
- Systems, Data Sources, APIs
- TransformationInitiatives (first-class change management)
- MigrationSteps, DecisionPoints

**Edge Types**:
- Reports-to, Depends-on, Feeds-data-to
- Measures, Owns, Participates-in
- Replaced-by, Creates, Enables

**State Tracking**:
- Nodes tagged with state: `as_is`, `deprecated`, `proposed`, `active`
- Enables querying specific organizational states
- Supports comparison and impact analysis

### Transformation as First-Class Entities

Transformation initiatives are explicit nodes in the graph:

```
[As-Is: Manual Approval Process]
  --<REPLACED_BY>-->
[TransformationInitiative: "Automate Approvals"]
  --<CREATES>-->
[To-Be: AI Approval Agent]
```

**Benefits**:
- Visible change management built into data model
- Traceable: see WHY changes happened
- Queryable: "Show all processes affected by Initiative X"
- Progress tracking with status, owners, timelines
- Supports rollback if transformation fails
- Audit trail for compliance

### Agent Workspace Graphs

**Purpose**: Sandbox for AI exploration without polluting core graph

**Pattern**:
- Each agent has isolated workspace graph
- Propose changes, run simulations, explore alternatives
- Human approval promotes workspace proposals → core graph
- Enables AI experimentation + human governance

**Workflow**:
1. Agent reads from core graph
2. Creates proposals in workspace graph
3. Human reviews and refines proposals
4. Approved proposals promoted to core graph
5. Becomes source of truth for execution

---

## Section 3: Agent Ecosystem

### Platform Agents (Meta-layer)

**Vision Agent** (Strategic Reimagination Layer)
- **Reads**: As-Is graph, North Star (vision/mission/strategy)
- **Analyzes**: Market trends, competitive landscape, strategic gaps
- **Proposes**: Alternative operating models, "zero-legacy" designs
- **Outputs**: Strategic transformation scenarios in workspace

**Process Mapper Agent** (Intelligent Value-Chain Layer)
- **Reads**: As-Is processes, workflows, roles, systems
- **Analyzes**: Bottlenecks, redundancies, cycle times, dependencies
- **Proposes**: Streamlined workflows, automation opportunities
- **Outputs**: Process redesign recommendations in workspace

**Data Architect Agent** (Digital Infrastructure Layer)
- **Reads**: Current systems, data sources, integration points
- **Analyzes**: Data quality, integration gaps, governance issues
- **Proposes**: Unified data fabric, API designs, schemas
- **Outputs**: Technical architecture for To-Be state

**Execution Agent** (Autonomous Workflow Layer)
- **Role**: Orchestrator/conductor of multi-agent workflows
- **Reads**: Approved To-Be graph (active transformation initiatives)
- **Manages**: Triggers, sequences, handoffs between agents
- **Ensures**: Workflows execute according to design
- **Handles**: Escalations and exceptions

**Performance Agent** (Adaptive Performance Layer)
- **Reads**: KPIs from core graph + real-time operational data
- **Analyzes**: Performance trends, variance, predictive signals
- **Outputs**: Dashboards, alerts, performance narratives
- **Feeds back**: Insights to Phase 1 (continuous discovery)

**Governance Agent** (Safety & Compliance)
- **Monitors**: All agent actions, compliance requirements
- **Enforces**: GDPR, HIPAA, SOC-2, industry regulations
- **Detects**: Bias, drift, anomalies
- **Manages**: Audit logs, explainability reports

**Learning Agent** (Continuous Improvement)
- **Reads**: Outcomes from Phase 3 operations
- **Analyzes**: What worked, what didn't, drift from predictions
- **Proposes**: Refinements, optimizations, course corrections
- **Closes**: Feedback loop from operations → strategy

**The Sentinel** (Critical Validation & Bias Detection)
- **Role**: Advisory/parallel stream - continuous red team perspective
- **Mode**: Non-blocking but highly visible, always running in background
- **Applies**: Charlie Munger's latticework of mental models to validate decisions
- **Core Functions**:
  - **Inversion**: "How would this transformation fail catastrophically?"
  - **Incentive Analysis**: "What behaviors are we actually rewarding?"
  - **Circle of Competence**: "Are we solving 'too hard' problems?"
  - **Bias Detection**: Identifies cognitive biases in proposals (confirmation bias, social proof, commitment tendency)
  - **Lollapalooza Effects**: Spots where multiple factors compound (positive or negative)
- **Interaction Pattern**:
  - Consultants and leadership query anytime: "Sentinel, what are we missing?"
  - Proactively surfaces insights when detecting dangerous patterns
  - Reviews agent proposals in workspace, flags concerns
  - Does not block promotion but provides critical perspective
- **Output**: Blunt, concise analysis with specific mental models applied
- **Value**: Prevents groupthink, challenges assumptions, identifies perverse incentives before they cause harm

### Operations Agents (Business Execution)

**Purpose**: Actually run day-to-day business processes

**Function-Specific Examples**:
- Sales Operations Agent: qualifies leads, sends follow-ups, updates CRM
- Finance Operations Agent: processes invoices, reconciles accounts, generates reports
- Customer Operations Agent: handles support tickets, manages onboarding
- Product Operations Agent: manages backlog, coordinates releases
- Marketing Operations Agent: runs campaigns, analyzes performance
- HR Operations Agent: manages recruiting, onboarding, performance reviews

**Creation Strategy - Dual Mode**:

1. **Template-Based (70-80% of agents)**
   - Pre-built templates for standard business functions
   - Success Model identifies common jobs-to-be-done
   - Fast deployment with company-specific configuration

2. **Graph-Generated (20-30% of agents)**
   - Novel roles created during Phase 2 reimagination
   - "AI Market Intelligence Synthesizer" - didn't exist before
   - Phoenix generates custom agent from To-Be graph specification
   - Industry-specific or cross-functional synthesizer roles

**Agent Lifecycle**:
1. Template/Generated → Configured from To-Be graph
2. Deployed to Phase 3 (operational)
3. Performance Agent monitors effectiveness
4. Learning Agent proposes refinements
5. Iterative improvement or replacement

---

## Section 4: User Interfaces by Phase

### Phase 1: Understanding (Discovery Interface)

**Primary Users**: Consultants (facilitators) + Client Leadership/Teams

**Interface Components**:
- **Agent-guided discovery journeys**: Conversational, adaptive questioning
  - "Tell me about your sales process" → intelligent follow-ups
  - Adapts based on industry, company size, maturity
  - Discovers context without rigid forms
- **Facilitator dashboard**:
  - Shows discovery progress across functions
  - Identifies gaps and areas needing clarification
  - Surfaces agent insights in real-time
  - Redirects agent questioning as needed
- **Real-time graph visualization**: See organizational model emerging
- **Stakeholder management**: Track who's been interviewed, what's covered

**Key Experience**: Natural conversation that builds comprehensive understanding

### Phase 2: Reinventing (Transformation Design Interface)

**Primary Users**: Consultants (primary), Client Leadership (review/approve)

**Interface Components**:
- **Visual workspace/canvas**: Graph-based org design tool
  - Drag-and-drop nodes and relationships
  - Visual process flow design
  - Impact analysis visualization
- **Agent proposal review**:
  - Browse AI-generated scenarios from workspace graphs
  - Compare multiple alternatives
  - Annotate and comment on proposals
- **Side-by-side comparison**: As-Is vs To-Be views
- **Collaboration mode**: Multi-user design sessions
- **Approval workflow**: Promote workspace proposals → core graph
  - Track approvals and decision rationale
  - Version history of design iterations

**Key Experience**: Collaborative design with AI assistance

### Phase 3: Running (Operations Interface)

**Multiple User Personas**:

**For Executives**:
- Executive dashboard: Strategic KPIs, transformation progress
- Business health metrics
- Agent performance summary
- Strategic initiative status

**For Function Owners**:
- Function-specific dashboards: Team metrics, workflow status
- Agent performance in their domain
- Exception queue (items needing human decision)
- Team + agent collaboration metrics

**For Operations Teams**:
- **Conversational interface**: Chat with agents
  - "What's blocking the sales pipeline?"
  - "Show me today's exceptions"
  - "Why did you make that decision?"
- **Workflow monitoring**: Real-time status of processes
- **Exception management**: Human-in-the-loop escalations
- **Approval queue**: Review agent recommendations

**For Analysts/Data Teams**:
- **Performance Intelligence Hub**:
  - Real-time analytics
  - Predictive insights
  - Custom report builder
  - Data exploration tools

**Key Experience**: Transparent, controllable autonomous operations

---

## Section 5: Platform Technical Components

### Graph Database Layer
- **Technology**: Neo4j or similar graph database
- **Stores**:
  - Core organizational graph (source of truth)
  - Agent workspace graphs (proposals/sandbox)
  - Transformation history and lineage
- **Provides**:
  - Query engine for graph traversal
  - Pattern matching and analysis
  - Real-time graph updates

### Agent Framework & Orchestration
- **Technology**: LangGraph, AutoGen, or CrewAI
- **Capabilities**:
  - Multi-agent collaboration protocols
  - Agent registry and lifecycle management
  - Workspace isolation and promotion workflows
  - Inter-agent communication and handoffs
  - State management across agent sessions

### Context Engine
- **Purpose**: Shared knowledge across agents
- **Contains**:
  - Organizational knowledge base
  - Cross-agent memory and context
  - Historical decisions and rationale
  - Semantic search and retrieval
- **Enables**: Agents to build on each other's work

### Data Fabric & Integration Layer
- **Connectors**: CRM, ERP, HCM, data warehouses, APIs
- **Protocols**: REST, GraphQL, webhooks, streaming
- **Features**:
  - Data contracts and governance
  - Real-time and batch sync
  - Schema mapping and transformation
  - Data quality monitoring

### Automation & Workflow Engine
- **Capabilities**:
  - Event-driven orchestration
  - Human-in-the-loop escalation workflows
  - Workflow state management and persistence
  - Trigger and scheduling system
  - Retry and error handling

### Performance Intelligence Hub
- **Features**:
  - Real-time KPI tracking and aggregation
  - Predictive analytics and forecasting
  - Dashboard generation engine
  - Narrative reporting (AI-generated insights)
  - Anomaly detection and alerting

### Governance & Security Shell
- **Audit & Compliance**:
  - Complete audit logging of all agent actions
  - Compliance monitoring (GDPR, HIPAA, SOC-2)
  - Explainability layer (why did agent do X?)
  - Chain of custody for decisions
- **Access Control**:
  - Role-based access control (RBAC)
  - Function-level and data-level permissions
  - Agent capability restrictions
- **Safety**:
  - Guardrails and approval gates
  - Anomaly detection and circuit breakers
  - Model drift monitoring
  - Kill switches for runaway agents

### LLM Integration Layer
- **Multi-provider support**: OpenAI, Anthropic, Gemini, Bedrock
- **Features**:
  - Provider routing and fallback
  - Token management and cost optimization
  - Prompt management and versioning
  - Model selection per agent/task
  - Rate limiting and quotas

---

## Section 6: Agent Harness Architecture

Following Anthropic's harness pattern for production-grade long-running agents.

### Core Harness Responsibilities

**1. Structured Tool Access**
- Agents don't call APIs directly - harness provides curated interface
- Tool results validated and sanitized
- Authorization checks before tool execution
- Prevents unauthorized system access

**2. State Management & Persistence**
- Agent conversations and decisions persisted to graph
- Resume from failure without losing context
- State checkpointing for long-running tasks
- Enables agent "memory" across sessions

**3. Observability & Monitoring**
- All agent actions logged with full context
- Token usage and cost tracking per agent
- Performance metrics (latency, success rate, error rate)
- Debug traces for troubleshooting
- Real-time monitoring dashboards

**4. Safety & Guardrails**
- Approval gates for critical decisions
- Budget limits (tokens, time, API calls)
- Anomaly detection (agent behaving unusually?)
- Kill switch / circuit breaker
- Rate limiting per agent

**5. Human-in-the-Loop Integration**
- Escalation workflows built into harness
- Agent pauses and waits for human approval
- Feedback mechanism (human corrects agent)
- Approval history tracked in graph
- SLA tracking for human response times

### Phoenix-Specific Harness Features

**Graph-Aware Harness**
- Specialized tools for reading/writing organizational graph
- Workspace isolation enforcement
- Promotion workflow (workspace → core graph with approval)
- Graph query optimization and caching
- Relationship traversal helpers

**Multi-Agent Coordination**
- Inter-agent messaging through harness
- Prevents race conditions on shared resources
- Workflow handoffs (Vision Agent → Process Mapper)
- Collaborative decision-making protocols
- Conflict resolution for competing proposals

**Phase-Specific Harnesses**

**Phase 1 (Discovery) Harness**:
- Conversational tools (interview guidance, follow-up generation)
- Data ingestion and validation
- Graph building and entity resolution
- Stakeholder management
- Gap analysis tools

**Phase 2 (Design) Harness**:
- Workspace management (create, clone, merge)
- Proposal generation and formatting
- Approval workflow integration
- Impact analysis tools
- Comparison and diff tools

**Phase 3 (Operations) Harness**:
- Business system integration (CRM, ERP, etc.)
- Workflow execution and coordination
- Real-time monitoring and alerting
- Exception handling and escalation
- Performance data collection

---

## Section 7: End-to-End Transformation Journey

### Onboarding a New Client

**Step 1: Engagement Kickoff**
- Consultant creates new organization in Phoenix
- North Star workshop: capture vision, mission, strategy
- Identify key stakeholders per function
- Set transformation goals and timeline
- Configure organization-specific settings

**Step 2: Phase 1 - Discovery (2-4 weeks)**
- Discovery Agents launch guided journeys per function
  - CEO/Leadership: strategy, goals, challenges
  - Product: roadmap, customers, capabilities
  - Sales: pipeline, process, tools
  - Marketing: channels, campaigns, metrics
  - Finance: close process, reporting, systems
  - (etc. for all functions)
- Consultants facilitate stakeholder interviews
- Graph populates in real-time with As-Is model
- Automated gap analysis highlights missing context
- Weekly progress reviews with client
- **Deliverable**: Complete As-Is organizational graph

**Step 3: Phase 2 - Reimagination (4-8 weeks)**
- Vision Agent analyzes As-Is graph
  - Identifies strategic misalignments
  - Proposes transformation scenarios in workspace
  - Generates "zero-legacy" alternatives
- Process Mapper Agent deep-dives into workflows
  - Bottleneck analysis
  - Automation opportunity scoring
  - Workflow redesign proposals
- Data Architect Agent assesses technical landscape
  - Data fabric design
  - Integration architecture
  - System consolidation opportunities
- Consultants facilitate design workshops with leadership
  - Review agent proposals
  - Explore trade-offs and alternatives
  - Co-design To-Be operating model
- Iterative refinement cycles: AI proposes → humans refine → approve
- Approved designs promote from workspace → core graph
- Build transformation roadmap with initiatives, dependencies, sequencing
- **Deliverable**: To-Be organizational graph + transformation roadmap

**Step 4: Phase 3 - Implementation & Operations (Ongoing)**

**Wave 1: Template-Based Agents (Weeks 1-4)**
- Deploy standard Operations Agents from template library
- Configure with company-specific parameters from graph
- Connect to business systems (CRM, ERP, etc.)
- Run pilot workflows with human oversight
- Validate and tune agent performance

**Wave 2: Custom-Generated Agents (Weeks 5-8)**
- Generate novel Operations Agents from To-Be graph
- Custom agents for reimagined roles
- Industry-specific capabilities
- Deploy with extensive monitoring

**Steady State Operations**
- Execution Agent orchestrates multi-agent workflows
- Operations Agents handle day-to-day business processes
- Performance Agent monitors KPIs, generates insights
- Learning Agent analyzes outcomes, proposes improvements
- Governance Agent ensures compliance and safety
- Human teams work alongside agents (hybrid operations)
- Exception handling and escalations to humans

**Step 5: Continuous Evolution**
- Phase 3 operations generate data and insights
- Performance Agent identifies optimization opportunities
- Learning Agent proposes workflow refinements
- New transformation initiatives emerge from operational reality
- Lightweight Phase 1/2 cycles for continuous improvement
- Organization adapts and optimizes continuously
- **Living system that never stops improving**

### Key Success Factors

1. **Agent-human collaboration at every phase** - AI proposes, humans decide
2. **Graph as single source of truth** - One model, always synchronized
3. **Workspace pattern enables exploration + governance** - Safe AI experimentation
4. **Harness architecture ensures reliability** - Production-grade agent operations
5. **Flexible transformation velocity** - Adapt to organizational change capacity
6. **Continuous feedback loops** - Operations inform strategy inform operations

---

## Section 8: Success Model Excel Template (Deprecated)

**Historical Context**: The Success Model Excel template was initially conceived as the intake format for capturing organizational As-Is state. It contained:
- 15 sheets for different functions (CEO, Product, Marketing, Sales, etc.)
- ~30 metadata fields per function (team size, KPIs, maturity scores, etc.)
- Categories: Structure, Performance, Intelligence Readiness, Workforce, etc.

**Why Deprecated**:
- Excel is rigid, not adaptive to organizational nuances
- Poor user experience for capturing rich context
- Difficult to maintain and evolve
- Not machine-friendly despite structured format

**Replacement Strategy**:
- Agent-guided discovery journeys (conversational, adaptive)
- Graph database captures richer relationships and context
- Success Model provides vocabulary and standard jobs-to-be-done
- But intake is conversational, not form-based

**Value Retained**:
- Success Model's categorization of business functions
- Standard metadata fields inform agent questioning
- Template library for Operations Agents maps to Success Model functions
- Common vocabulary for cross-company patterns

---

---

## Section 9: Development Approach - Build Phoenix from Real Engagements

### Philosophy: Technology Solves Problems, Not Creates Them

Phoenix must be built from actual transformation work, not from theoretical ideals. We are **not** building technology and then finding problems to apply it to. Instead, we are:

1. **Doing the work manually first** with real clients
2. **Documenting what actually works** (and what doesn't)
3. **Identifying patterns** that can be codified
4. **Building agents to accelerate** proven methodologies
5. **Validating with real outcomes** before generalizing

### Case Study-Driven Development

**Active Reference Implementation: Company A**

Phoenix development is running in parallel with an active 6-month transformation engagement:

**The Problem**:
- Growing company with proven business model (25% annual growth)
- Can't scale to national footprint due to operational constraints
- Previous consultant proposed $1M+ tech modernization (lift-and-shift approach)
- Real opportunity: Transform from service provider to platform/SaaS franchise business

**The Engagement**:
- Parallel strategy + dev teams working in lock-step
- Initial architecture built from As-Is understanding
- Strategy evolves → dev adapts architecture iteratively
- Discovering what needs to be built vs. what can be configured
- Capturing where AI agents could accelerate vs. where human judgment is essential

**What We're Learning**:
- Discovery questions that reveal business model transformation opportunities
- How strategy-to-dev handoff actually works in practice
- What architectural decisions can be made early vs. what must wait
- Where consultants spend time (and what could be automated)
- Patterns that can become templates for future engagements

**Documentation**: See [docs/case-studies/company-a/](../case-studies/company-a/) for real-time capture of:
- Discovery process and insights
- Methodology and decision frameworks
- Architecture evolution
- Phoenix learning objectives and findings

### Parallel Track Approach

**Company A Engagement** (Real work, real client, real outcomes)
↓ Informs
**Phoenix Development** (Codify proven patterns)
↓ Enables
**Future Engagements** (Faster, more consistent, scalable)

### What This Means for Phoenix Build Sequence

1. **Don't build agents before understanding the work**
   - Document what human consultants actually do
   - Identify repeated patterns vs. unique judgment calls
   - Validate economic value of automation

2. **Start with templates from real architectures**
   - Company A's platform architecture becomes a template
   - Their As-Is → To-Be transformation becomes a reference case
   - Patterns that emerge become reusable components

3. **Build harness infrastructure first**
   - Agents need observability, safety, state management
   - These are foundational regardless of agent specifics
   - Can be built while methodology is being documented

4. **Iterate with real feedback**
   - Test agent capabilities on Company A data
   - Validate that agent proposals match consultant insights
   - Measure actual time savings and quality improvements

### Success Criteria for Phoenix v1.0

Phoenix v1.0 is ready when:
- [ ] Successfully used to accelerate a real engagement (like Company A)
- [ ] Consultants report it saves time without compromising quality
- [ ] Discovery agents ask questions that yield strategic insights
- [ ] Transformation proposals from agents are considered valuable by clients
- [ ] Architecture patterns from templates adapt appropriately to new contexts
- [ ] Economic model shows clear ROI for both consultant and client

---

## Conclusion

Project Phoenix transforms organizations through a three-phase lifecycle: Understanding, Reinventing, and Running. The platform uses a graph database to model organizations, AI agents operating through harnesses to analyze and propose improvements, and human consultants to facilitate and govern changes. The combination of AI exploration (workspace graphs) and human governance (core graph promotion) enables bold reimagination with organizational safety.

**Critically**: Phoenix is being built from real transformation work, not from theoretical ideals. Active engagements like Company A inform every design decision, ensuring Phoenix solves actual problems rather than creating technology looking for a problem.

The result: companies evolve into AI-native enterprises that continuously learn, adapt, and optimize - with a proven methodology and platform to guide the transformation.

**Next Steps**:
1. Continue documenting Company A engagement methodology and learnings
2. Technical architecture deep-dive informed by real needs (graph schema, agent framework selection)
3. Phase 1 MVP scope based on proven discovery process
4. Harness implementation patterns for production reliability
5. Template library extraction from Company A architecture
