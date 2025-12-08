# Vision Agent Design

**Status**: Design Complete - Ready for Implementation
**Phase**: Phase 2 (Reinventing)
**Last Updated**: 2025-12-08

---

## Executive Summary

The Vision Agent is Phoenix's **reimagination engine**, transforming As-Is understanding into bold To-Be transformation scenarios. Unlike traditional strategy consultants who default to efficiency plays, the Vision Agent is specifically designed to identify business model transformation opportunities by using weighted signal scoring to calibrate boldness.

**Key Innovation**: Prevents the "lift-and-shift" trap by analyzing transformation readiness signals (existing external customers, unique IP, scalability constraints, leadership appetite) and proposing platform or new business model scenarios when evidence supports them—not just automating existing processes with newer technology.

---

## Section 1: Core Purpose & Capabilities

### Primary Outputs

The Vision Agent delivers:

1. **Multiple transformation scenarios** (typically 2-4 options ranging from conservative to bold)
2. **To-Be graphs in workspace** (one workspace per scenario for isolated exploration)
3. **Economic projections** (confidence-banded estimates with narrative framing)
4. **Transformation roadmaps** (phased approach with decision gates)

### Weighted Signal Scoring

The agent uses **transformation readiness scoring** to calibrate which scenarios to propose:

**Signal Weights** (initial values, tunable over time):
- **Existing external customers**: 5 points (strongest market validation)
- **Unique IP/methodology**: 3 points (defensible differentiation)
- **Scalability constraint blocking growth**: 2 points (urgency for transformation)
- **Leadership appetite for bold change**: 1 point (organizational readiness)

**Threshold**: 7+ points triggers platform transformation or new business model scenario proposals

**Example from Company A (Blueprint/Datapage)**:
- Existing external customers (2 lenders using Connect 1.x): **5 points**
- Unique IP (zero-default lending methodology): **3 points**
- Scalability constraint (can't expand to new cities): **2 points**
- Leadership appetite (active transformation engagement): **1 point**
- **Total: 11/7** → Strongly recommend platform transformation scenario

### Transparency & Tunability

The scoring system is **not a black box**:
- Consultants see signal breakdown and reasoning
- Thresholds can be adjusted per client risk appetite
- Consultant override available ("Score is 5, but propose anyway" or "Score is 9, but not for this client")
- Learning Agent refines weights based on outcomes

### Success Criteria

Vision Agent succeeds when consultants report it:
1. **Generates at least one scenario they hadn't considered**
2. **Economic projections are credible enough to present to client leadership**
3. **Identifies business model opportunities, not just efficiency plays**

---

## Section 2: Hybrid Scenario Generation

The Vision Agent creates transformation scenarios using a **hybrid approach**: proven templates provide structure, while LLM reasoning adds creative adaptation to the specific company context.

### Template Library

Grows from real engagements, starting with these proven patterns:

**1. Operational Efficiency**
- Automate bottlenecks identified in Discovery
- Eliminate manual handoffs between systems
- Integrate siloed data sources
- **Risk**: Low | **ROI Timeline**: 6-18 months | **Confidence**: Typically high

**2. Platform Transformation** (Blueprint→Datapage pattern)
- Operating company → Platform company
- Internal tool → Commercializable SaaS
- Single-tenant → Multi-tenant architecture
- **Risk**: Medium-high | **ROI Timeline**: 2-5 years | **Confidence**: Medium with validation

**3. Vertical Integration**
- Bring outsourced capabilities in-house
- Or inverse: Productize internal capabilities for external sale
- **Risk**: Medium | **ROI Timeline**: 1-3 years | **Confidence**: Medium

**4. Market Expansion**
- New geographies with existing model
- New customer segments with adapted offering
- Adjacent product lines leveraging core competency
- **Risk**: Medium | **ROI Timeline**: 1-3 years | **Confidence**: Varies by market validation

**5. New Business Model**
- Productize unique internal IP
- Create adjacent revenue streams
- Entirely new market creation
- **Risk**: High | **ROI Timeline**: 3-7 years | **Confidence**: Low until validated

### Generation Process

**Step 1: Template Matching**
- Agent analyzes As-Is graph + Discovery insights
- Identifies which templates apply based on signal scoring
- Selects 2-4 templates spanning risk/reward spectrum

**Step 2: Creative Customization**
- LLM adds company-specific innovations beyond template:
  - "Blueprint has unique zero-default methodology → platform opportunity for other lenders"
  - "Multi-party consultant coordination → generalizable SaaS module for any industry with vendor management"
  - "Document intelligence for arborist reports → applicable to legal contracts, medical records, financial statements"

**Step 3: Parallel Exploration**
- Multiple agent instances work simultaneously in separate workspaces
- **Agent A**: Efficiency scenario (conservative, near-term ROI, high confidence)
- **Agent B**: Platform scenario (bold, requires market validation, medium confidence)
- **Agent C**: New business scenario (experimental, long-term option, low-medium confidence)
- Completion time: **~minutes** for all scenarios vs. hours if sequential

**Step 4: Real-time Sentinel Review**
- As each workspace builds, The Sentinel watches for:
  - **Inversion**: "How does this fail catastrophically?"
  - **Incentive misalignment**: "Are we rewarding the wrong behaviors?"
  - **Over-engineering**: "Are we solving 'too hard' problems?"
  - **Circle of competence**: "Is this within their capabilities?"
- Flags concerns directly in workspace before consultant reviews
- **Does not block** scenario creation, provides critical perspective

### Output

2-4 scenarios with varying risk/reward profiles, each in isolated workspace ready for consultant review and comparison.

---

## Section 3: Economic Modeling with Confidence Bands

Each transformation scenario includes **confidence-banded financial projections** wrapped in a **narrative timeline**. This approach balances analytical rigor with honest uncertainty about transformation outcomes.

### Confidence Band Structure

**High Confidence (Narrow Bands)**
- Based on: Quantified bottlenecks, proven ROI patterns, historical data
- Example: "$200K-$300K annual savings from eliminating manual data re-entry (15-30 min × 200 loans/year × $50/hour blended rate)"
- Evidence: Direct Discovery insights, time-motion studies

**Medium Confidence (Moderate Bands)**
- Based on: Strong signals requiring market validation, analogous case studies
- Example: "$2M-$5M platform revenue (2 existing customers validate demand, but scaling to 10-20 customers unproven)"
- Evidence: Existing customers, market research, competitive analysis

**Low Confidence (Wide Bands)**
- Based on: Speculative opportunities, untested markets, novel business models
- Example: "$5M-$20M new business model (adjacent market, no current customers, high uncertainty about product-market fit)"
- Evidence: Strategic hypotheses, analogies to other industries, limited validation

### Narrative Timeline Framework

Economic projections are presented as a **story over time**, making uncertainty transparent and decisions actionable.

**Company A (Blueprint) Example**:

**Year 1: Foundation & Quick Wins**
- Cost savings: $200K-$300K (high confidence - automated bottlenecks)
- Investment: $400K-$600K (platform MVP development)
- Net: Break-even to modest loss, building foundation
- **Key milestones**: Connect 2.0 Design & Entitlement module pilot, API integrations complete

**Year 2-3: Platform Validation**
- Platform revenue: $2M-$5M (medium confidence - 5-10 lender customers)
- Operating company efficiency: 30% revenue growth with 10% headcount increase
- Investment: Ongoing development and GTM costs
- Net: Profitability begins, business model validates
- **Key milestones**: Multi-tenant architecture proven, first external customer onboarded, sales/support processes established

**Year 3-5: Scale & New Business**
- Platform revenue: $8M-$20M (medium-high confidence - proven at scale)
- Methodology licensing: $1M-$5M (low-medium confidence - new revenue stream from consulting/training)
- Net: Significant returns, transformation fully realized
- **Key milestones**: 20+ platform customers, partner ecosystem, international expansion

### Key Features

- **Evidence-linked**: Each estimate ties back to specific Discovery insights (annotated in graph)
- **Progressively refined**: Bands narrow as validation occurs (MVP pilots, customer acquisition, real revenue data)
- **Risk-adjusted**: Consultants and clients evaluate scenarios by risk appetite (conservative client picks narrow bands, bold client pursues wide upside)
- **Actionable**: Clear what needs to happen to move from low → medium → high confidence (e.g., "Sign 3 pilot customers to validate $2M-$5M revenue assumption")

---

## Section 4: Workspace Graph Architecture

Each transformation scenario is built in an **isolated workspace graph**, enabling parallel exploration without polluting the core As-Is graph. This architecture supports bold experimentation with clear governance boundaries.

### Workspace Structure

**Workspace 1: "Efficiency Scenario"**
- Copies As-Is graph as starting point (full entity/relationship graph)
- Modifies processes: eliminates bottlenecks, automates handoffs
- Adds new systems: integration layer, automation tools, workflow engines
- Removes manual steps: data re-entry, document summarization by hand
- Tags all changes: `scenario="efficiency"`, `confidence="high"`, `source="template:operational_efficiency"`

**Workspace 2: "Platform Scenario"**
- Copies As-Is graph as starting point
- Transforms business model: adds "Platform Company" entity, "SaaS Revenue" stream
- Creates new roles: Platform Ops, Customer Success, Partner Management, Developer Relations
- Redesigns processes: multi-tenant architecture, SaaS delivery, partner onboarding
- Tags: `scenario="platform"`, `confidence="medium"`, `source="template:platform_transformation+llm_customization"`

**Workspace 3: "New Business Scenario"**
- Copies As-Is graph as starting point
- Introduces entirely new revenue streams not in current model
- Creates novel roles and processes not in template library (LLM-generated)
- Tags: `scenario="new_business"`, `confidence="low-medium"`, `source="llm_reasoning"`

### Parallel Agent Execution

**Concurrency Model**:
- Each workspace has dedicated agent instance (no shared state during generation)
- Agents work simultaneously (no blocking dependencies between scenarios)
- Sentinel reviews all workspaces in real-time (observes, doesn't block)
- Completion time: **~5-10 minutes** for all scenarios vs. 30-60 minutes if sequential

**Resource Management**:
- Workspace graphs are copy-on-write from As-Is (efficient storage)
- Agent instances scale horizontally (cloud-native architecture)
- Results streamed to consultant interface as they complete

### Consultant Review Interface

**Side-by-Side Comparison**:
- Visual graph diff: "What changed from As-Is?"
- Color-coded by scenario and confidence level
- Filterable by entity type, change type, confidence threshold

**Scenario Details**:
- Economic projections with confidence bands
- Narrative timeline (Year 1-5 story)
- Sentinel critiques visible per workspace
- Risk/opportunity analysis
- Implementation roadmap

**Navigation**:
- One-click drill-down into specific entities/relationships
- "Why did agent propose this change?" reasoning links
- Comparison matrix (side-by-side metric comparison)

### Promotion Flow

**Selection Process**:
1. Consultant reviews all scenarios with client leadership
2. Selects preferred scenario (or hybrid combining elements from multiple)
3. May request refinements ("Combine efficiency + platform but delay new business")
4. Agent can merge workspaces or iterate based on feedback

**Promotion to Core**:
- Selected workspace (or merged result) promoted to **"To-Be Graph"** in core database
- Becomes source of truth for Phase 3 (implementation)
- Original workspace preserved as audit trail
- Other workspaces archived (not deleted - valuable learning data for template refinement)

**Governance**:
- Promotion requires consultant approval (human-in-the-loop)
- Audit log tracks who approved, when, and rationale
- To-Be graph versioned (can roll back if needed)

---

## Section 5: Handoff to Other Platform Agents

The Vision Agent doesn't work in isolation—once scenarios are created and one is selected, other Platform Agents refine and implement the transformation.

### To Process Mapper Agent

**Input**: Selected To-Be scenario from workspace (now promoted to core graph)

**Task**: Design detailed workflows that realize the transformation

**Focus**:
- Eliminate bottlenecks identified in Discovery (e.g., 15-30 min loan creation → <5 min)
- Redesign processes for scale (e.g., support 10x volume without 10x headcount)
- Map automation opportunities (what can be AI/workflow vs. what needs human judgment)

**Example from Company A**:
- BPO → Connect data flow automated via API (eliminates manual re-keying)
- Feasibility packet generation automated with templates + document intelligence
- Entitlement coordinator workflow redesigned with SLA tracking and automated follow-ups

### To Data Architect Agent

**Input**: To-Be graph showing new systems, integrations, data flows

**Task**: Design unified data fabric that supports transformation

**Focus**:
- Integration architecture (API design, event streaming, batch processes)
- Data governance (who owns what data, privacy/security requirements)
- Schema design (entities from graph → database tables)
- Migration strategy (As-Is systems → To-Be systems without downtime)

**Example from Company A**:
- Unified platform replacing BPO (Firebase) + Connect 1.0 (Filemaker) + SharePoint silos
- Multi-tenant data model (Blueprint as "tenant zero", future lender tenants isolated)
- Document storage architecture (Azure Blob + metadata in platform database)

### To Execution Agent

**Input**: Transformation roadmap with phased milestones

**Task**: Orchestrate multi-agent workflows for implementation

**Focus**:
- Coordinate dev team (strategy + technology in lock-step)
- Manage dependencies (e.g., API must be built before UI can integrate)
- Track progress (burn-down charts, milestone completion)
- Adapt plan based on reality (MVP learnings feed back into roadmap)

**Example from Company A**:
- Parallel tracks: Blueprint Transformation (operating model) + Connect 2.0 Platform (technology) + Datapage GTM (commercialization)
- Decision gates at Days 30, 90, 180 (validate assumptions, adjust scope)
- MVP pilot with Design & Entitlement team (Days 1-90), then expand to full platform (Days 91-180)

### Continuous Sentinel Input

The Sentinel reviews downstream agent work, applying mental models to prevent flawed execution:

**Reviews Process Mapper's workflows**:
- "Does this actually solve the bottleneck or just automate a bad process?" (First principles)
- "What new failure modes does this create?" (Inversion)

**Reviews Data Architect's design**:
- "Are we creating new silos while claiming to eliminate them?" (Consistency check)
- "What happens when data schema changes?" (Second-order effects)

**Reviews Execution plan**:
- "What assumptions must hold true for this timeline?" (Assumption validation)
- "Are we anchoring on the first estimate?" (Cognitive bias detection)

**Output**: Blunt, concise critiques with specific mental models cited, helping agents and consultants avoid predictable mistakes.

### Feedback Loop to Learning Agent

**Track Outcomes**:
- Which scenarios get selected most often? (Efficiency vs. platform vs. new business)
- Actual economics vs. projected confidence bands
- Which templates work vs. which need refinement

**Refine Models**:
- Adjust signal scoring weights (e.g., "existing customers" may be worth 6 points, not 5)
- Update template library with new patterns from real engagements
- Tune LLM prompts based on what generates valuable vs. noise scenarios

**Close Loop**:
- Successful transformations become case studies
- Failed transformations inform what signals to avoid
- Phoenix gets smarter with every engagement

---

## Section 6: MVP Scope & Company A Validation

The Vision Agent MVP focuses on core scenario generation capabilities, validated against the active Blueprint/Datapage transformation.

### MVP Feature Set (Weeks 1-8)

**Must Have**:
- Weighted signal scoring system with transformation readiness thresholds
- Template library with 3-5 proven patterns (efficiency, platform, market expansion, vertical integration, new business)
- Hybrid scenario generation (template matching + LLM customization)
- Parallel workspace creation (2-4 scenarios simultaneously)
- Confidence-banded economic projections (high/medium/low bands with evidence links)
- Narrative timeline framework (Year 1-5 storytelling with milestones)
- Real-time Sentinel review integration (inversion, incentive analysis, bias detection)
- Consultant comparison interface (side-by-side workspace views with diff visualization)

**Should Have (Weeks 9-12)**:
- Template learning from completed engagements (extract patterns, add to library)
- Advanced economic modeling (sensitivity analysis, risk scenarios, Monte Carlo if applicable)
- Scenario merging (hybrid of multiple workspaces based on consultant direction)
- Historical analogy matching ("Company X did similar transformation, here's how it applies")

**Won't Have (v1.0)**:
- Automated market research/validation (require human market expertise)
- Financial modeling integration (Excel/Tableau export for CFO review)
- Multi-company pattern analysis (need more data first)
- Predictive ML for transformation success (insufficient training data)

### Company A Validation Approach

**Parallel Testing Strategy**:

1. **Run Vision Agent on Blueprint's As-Is graph** (output from Discovery Agent)
2. **Compare agent-generated scenarios** to actual transformation chosen by consultants/client
3. **Measure alignment**:
   - Did agent propose platform opportunity? (Yes/No)
   - At what signal score? (Expected: 11/7, well above threshold)
   - How similar is proposed platform scenario to actual Blueprint→Datapage transformation?

**Success Metrics**:

- **Signal detection accuracy**: Agent correctly scores Blueprint at 11/7 (identifies all 4 signals)
- **Scenario quality**: Proposed platform scenario includes key elements:
  - Operating company → Platform company business model shift
  - Connect 2.0 as commercializable SaaS product
  - Multi-tenant architecture for multiple lender customers
  - Blueprint as "Client Zero" reference implementation
- **Economic accuracy**: Confidence bands capture actual uncertainty (not falsely precise)
  - Year 1 cost savings estimate within 20% of actuals (high confidence validated)
  - Year 2-3 platform revenue estimate has appropriately wide bands (medium confidence)
- **Sentinel value**: Critique surfaces risks that consultants/leadership actually considered
  - "How does platform fail?" → Client discussed customer acquisition challenges
  - "What incentives?" → Team alignment on platform vs. operating company priorities
- **Consultant satisfaction**: Consultants report agent scenarios are valuable, not noise

**Graduation Criteria**:

Vision Agent is ready for production when:
1. **Generates at least one scenario consultants hadn't fully considered** (creative value)
2. **Economic projections are credible enough to present to client leadership** (professional quality)
3. **Signal scoring aligns with consultant intuition** (trustworthy calibration)
4. **Sentinel critiques add value without creating busywork** (signal, not noise)

### Feedback Loop for Improvement

**Weekly retrospectives** during Company A engagement:
- What scenarios did agent generate vs. what consultants developed manually?
- Where did agent add value? Where did it miss the mark?
- Are signal weights calibrated correctly, or do they need tuning?
- Are templates generalizable, or too Blueprint-specific?

**Post-engagement review**:
- Extract Blueprint→Datapage transformation as reference template
- Document what signals predicted success (refine scoring weights)
- Capture Sentinel critiques that proved prescient
- Update MVP roadmap based on lessons learned

---

## Summary: Vision Agent Design

The Vision Agent is Phoenix's **reimagination engine**, transforming As-Is understanding into bold To-Be transformation scenarios. It prevents the "lift-and-shift" trap by using intelligent calibration to propose the right level of transformation based on evidence.

### Key Design Principles

1. **Calibrated boldness** - Weighted signal scoring (existing customers=5, unique IP=3, scalability constraint=2, leadership appetite=1) determines which scenarios to propose, preventing both under-ambition and over-reach

2. **Hybrid generation** - Proven transformation templates provide structure (efficiency, platform, new business), LLM reasoning adds company-specific creativity and innovation

3. **Parallel exploration** - Multiple agents work simultaneously in isolated workspaces, generating 2-4 scenarios in minutes vs. hours, enabling comprehensive option analysis

4. **Honest economics** - Confidence-banded projections (narrow for proven ROI, wide for speculative opportunities) wrapped in narrative timelines make uncertainty transparent and actionable

5. **Real-time validation** - Sentinel reviews scenarios during generation, catching flaws early through mental model application (inversion, incentive analysis, bias detection)

6. **Seamless handoffs** - Selected scenario feeds Process Mapper (workflow design), Data Architect (integration architecture), Execution Agent (orchestration), creating coherent transformation path

### Company A Validation

Blueprint/Datapage transformation provides perfect test case:
- **Signal score**: 11/7 (well above threshold for platform transformation)
- **Scenario alignment**: Agent should propose operating company → platform company shift
- **Economic realism**: Confidence bands should capture actual uncertainty in market validation
- **Sentinel value**: Critiques should surface real risks leadership considered

### Graduation Threshold

Vision Agent succeeds when consultants report:
- **"It generated a scenario we hadn't fully considered"** (creative value)
- **"The economics are credible enough to present to the CEO/CFO"** (professional quality)
- **"The Sentinel caught assumptions we needed to validate"** (critical thinking value)

This agent bridges Phase 1 (Understanding via Discovery) to Phase 2 (Reinventing via transformation scenarios), enabling bold business model transformation while maintaining governance through workspace isolation, confidence tracking, and human approval.

---

## Next Steps for Implementation

1. **Build workspace graph infrastructure** (copy-on-write, parallel agent execution)
2. **Implement signal scoring system** (weights, thresholds, transparency layer)
3. **Create initial template library** (5 patterns from Company A and general consulting knowledge)
4. **Develop hybrid generation logic** (template matching + LLM customization prompts)
5. **Integrate Sentinel in real-time** (mental model application during workspace creation)
6. **Build consultant review interface** (side-by-side comparison, diff visualization, economic projections)
7. **Validate with Company A data** (run agent, compare to actual transformation, tune weights)
8. **Iterate based on feedback** (weekly retrospectives, post-engagement review)

---

## References

- [Discovery Agent Design](./discovery-agent-design.md) - Provides As-Is graph and insights that Vision Agent consumes
- [Company A Learnings](../case-studies/company-a/company-a-learnings.md) - Real-world transformation validating design decisions
- [Phoenix Mental Model](../plans/2025-12-08-phoenix-mental-model.md) - Overall platform architecture and three-phase lifecycle
- [The Sentinel Agent](./sentinel-prompt.md) - Mental models framework for critical validation
