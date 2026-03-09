#!/bin/bash
set -e
PLUGIN="design-agent-orchestration"
echo "🔨 Building $PLUGIN..."
# Create directory structure
mkdir -p "$PLUGIN/.claude-plugin"
mkdir -p "$PLUGIN/skills"
mkdir -p "$PLUGIN/commands"
# plugin.json
cat > "$PLUGIN/.claude-plugin/plugin.json" << 'EOF'
{
  "name": "design-agent-orchestration",
  "description": "Design multi-agent systems, handoffs between AI agents, and human-in-the-loop workflows.",
  "skills": "../skills",
  "commands": "../commands"
}
EOF
# README
cat > "$PLUGIN/README.md" << 'EOF'
# Design Agent Orchestration
Design multi-agent systems, handoffs between AI agents, and human-in-the-loop workflows.
## Skills
| Skill | Description |
|-------|-------------|
| agent-role-design | Defining what each agent does, knows, and owns in a multi-agent system. |
| handoff-protocols | Designing smooth transitions between agents and between AI and humans. |
| task-decomposition | Breaking complex user goals into subtasks that agents can handle. |
| state-management | Managing shared context, memory, and state across multiple agents. |
| human-in-the-loop | Designing intervention points where humans review, approve, or redirect agent work. |
| failure-recovery | What happens when an agent fails: retry, fallback, escalate, or graceful degradation. |
| observability-design | Making multi-agent workflows visible and debuggable for designers and developers. |
## Commands
| Command | Description |
|---------|-------------|
| `/design-agent-orchestration:design-workflow` | Design a complete multi-agent workflow with roles, handoffs, and fallbacks. |
| `/design-agent-orchestration:map-agents` | Map out agent responsibilities, boundaries, and communication patterns. |
| `/design-agent-orchestration:design-oversight` | Create a human oversight plan for an agentic system. |
EOF
# === SKILLS ===
cat > "$PLUGIN/skills/agent-role-design.md" << 'EOF'
---
name: agent-role-design
description: Defining what each agent does, knows, and owns in a multi-agent system.
---
# Agent Role Design
In a multi-agent system, each agent needs a clearly defined role — what it does, what it knows, what it's responsible for, and where its authority ends. Without clear roles, agents duplicate work, conflict with each other, or leave gaps.
## Defining an Agent Role
For each agent in the system, specify:
- **Purpose**: What is this agent for? One sentence describing its reason to exist.
- **Capabilities**: What can this agent do? List specific actions and outputs.
- **Knowledge scope**: What does this agent know about? What domains, data, and context does it have access to?
- **Authority**: What decisions can this agent make autonomously? What requires approval?
- **Boundaries**: What is explicitly outside this agent's scope? Where does it stop and hand off?
- **Success criteria**: How do you know this agent is doing its job well?
## Role Design Principles
- **Single responsibility**: Each agent should have one clear purpose. If you need a paragraph to explain what it does, it's doing too much.
- **Clear boundaries**: The line between one agent's scope and another's should be unambiguous. No overlapping authority without explicit conflict resolution.
- **Minimal coupling**: Agents should be able to do their work with minimal dependencies on other agents. Share results, not process.
- **Appropriate autonomy**: The level of autonomous decision-making should match the stakes and the agent's reliability in that domain.
## Role Patterns
- **Specialist**: Deep expertise in one domain. Handles all tasks of a specific type.
- **Router**: Doesn't do work itself but directs tasks to the right specialist.
- **Orchestrator**: Manages the overall workflow, coordinates between specialists.
- **Validator**: Reviews other agents' outputs for quality, safety, or compliance.
- **Fallback**: Handles cases that other agents can't or won't.
## Role Conflicts
When agents' roles overlap or conflict:
- **Priority rules**: When two agents could handle a task, which one gets it?
- **Escalation paths**: When agents disagree, who decides?
- **Shared resources**: When agents need the same data or tools, how is access managed?
- **Feedback loops**: How do agents inform each other about what they've done?
## Design Artefacts
- Agent role cards (one per agent with all specifications)
- Role boundary map showing where each agent's authority starts and stops
- Interaction matrix showing which agents communicate with which
- Authority hierarchy diagram
- Role conflict resolution rules
EOF
cat > "$PLUGIN/skills/handoff-protocols.md" << 'EOF'
---
name: handoff-protocols
description: Designing smooth transitions between agents and between AI and humans.
---
# Handoff Protocols
A handoff is the moment one agent passes work to another — or to a human. It's where multi-agent systems most commonly fail. A dropped handoff means lost context, repeated work, or abandoned tasks.
## Anatomy of a Handoff
Every handoff has:
- **Trigger**: What causes the handoff? (task completion, scope boundary, failure, user request)
- **Source**: Who is handing off?
- **Destination**: Who is receiving?
- **Payload**: What information transfers? (context, partial results, user state, instructions)
- **Acknowledgment**: How does the source know the destination received the handoff?
- **User experience**: What does the user see during the handoff?
## Handoff Types
- **Sequential**: Agent A finishes, passes results to Agent B who continues. Like a relay race.
- **Parallel fan-out**: One agent distributes subtasks to multiple agents simultaneously.
- **Parallel fan-in**: Multiple agents' results converge back to one agent for synthesis.
- **Escalation**: An agent can't handle the task and passes up to a more capable agent or human.
- **Fallback**: The primary agent fails and a backup takes over.
- **Human handoff**: AI passes work to a human for review, decision, or completion.
## Context Transfer
The most common handoff failure is context loss. Design what transfers:
- **Full context**: Everything the source agent knew. Safe but potentially overwhelming.
- **Summarised context**: Key information distilled. Efficient but risks losing important nuance.
- **Structured context**: Predefined fields that must be populated. Consistent but rigid.
- **Incremental context**: Only what's new since the last handoff. Efficient for ongoing collaborations.
## Designing for the User
The user's experience of handoffs matters:
- **Invisible handoff**: The user doesn't know agents changed. The experience feels seamless.
- **Transparent handoff**: The user is told a new agent is taking over and why.
- **Participatory handoff**: The user confirms the handoff or provides additional context.
- **User-initiated handoff**: The user explicitly requests a different agent or a human.
## Handoff Anti-Patterns
- **The black hole**: Work is handed off but never picked up
- **The echo chamber**: Agents hand work back and forth without progress
- **The context cliff**: Critical information is lost in the handoff
- **The jarring transition**: The user's experience changes dramatically at the handoff point
- **The silent redirect**: The user doesn't know they've been handed off and gets confused by changes
## Design Artefacts
- Handoff protocol specifications (trigger, source, destination, payload, acknowledgment)
- Context transfer templates
- Handoff sequence diagrams
- User experience specifications for each handoff type
- Handoff failure mode analysis
EOF
cat > "$PLUGIN/skills/task-decomposition.md" << 'EOF'
---
name: task-decomposition
description: Breaking complex user goals into subtasks that agents can handle.
---
# Task Decomposition
Users come with goals, not subtasks. Task decomposition is how a multi-agent system breaks a complex user goal into pieces that individual agents can handle — and then reassembles the results into something coherent.
## Decomposition Strategies
- **Sequential decomposition**: Break the goal into ordered steps. Step 1 must complete before Step 2 starts.
- **Parallel decomposition**: Break the goal into independent parts that can be worked on simultaneously.
- **Hierarchical decomposition**: Break the goal into sub-goals, then break each sub-goal into tasks.
- **Conditional decomposition**: The next step depends on the result of the current step. Different results lead to different paths.
- **Iterative decomposition**: Start with a rough version, then refine through multiple passes.
## Designing Decomposition Rules
For each type of user goal the system handles:
- **What's the entry point?** How does the system receive the goal?
- **What are the subtasks?** List all possible subtasks for this goal type.
- **What are the dependencies?** Which subtasks depend on others' outputs?
- **What's the critical path?** Which sequence of subtasks determines the minimum completion time?
- **What can be parallelised?** Which subtasks can run simultaneously?
- **What's the reassembly logic?** How do subtask results combine into the final output?
## Granularity
How finely to decompose matters:
- **Too coarse**: Single agents get tasks that are too complex, leading to lower quality
- **Too fine**: Overhead from handoffs exceeds the benefit of specialisation
- **Just right**: Each subtask matches one agent's sweet spot in terms of scope and complexity
## Handling Ambiguity
User goals are often ambiguous. The system needs to:
- **Clarify before decomposing**: Ask the user to specify when the goal is unclear
- **Decompose tentatively**: Start with a plan and adjust as information emerges
- **Recompose when needed**: If decomposition was wrong, restructure without starting over
## Design Artefacts
- Task decomposition trees for each goal type
- Dependency maps showing subtask relationships
- Parallelisation specifications
- Reassembly logic definitions
- Ambiguity handling protocols
EOF
cat > "$PLUGIN/skills/state-management.md" << 'EOF'
---
name: state-management
description: Managing shared context, memory, and state across multiple agents.
---
# State Management
In a multi-agent system, state is the shared truth about what's happened, what's in progress, and what's been decided. Without state management, agents work with stale or conflicting information.
## Types of State
- **Task state**: Where is the overall task in its lifecycle? Which subtasks are complete, in progress, or pending?
- **Context state**: What does each agent know? What has been shared? What's been summarised or dropped?
- **User state**: What are the user's preferences, history, and current emotional state?
- **Decision state**: What decisions have been made? What options were considered and rejected?
- **Error state**: What has failed? What's been retried? What's been escalated?
## State Architecture Patterns
- **Centralised state**: One shared state store that all agents read from and write to. Simple but can be a bottleneck.
- **Distributed state**: Each agent maintains its own state and syncs with others. Flexible but risks inconsistency.
- **Event-sourced state**: State is built from a log of events. Every change is recorded. Auditable but complex.
- **Blackboard pattern**: Shared workspace where agents post results and read others' contributions. Good for collaborative problem-solving.
## Designing State for Users
Users have expectations about what the system remembers:
- **Within-session state**: Everything said in this conversation should be remembered and consistent
- **Cross-session state**: Preferences, decisions, and context from past sessions should carry forward
- **Cross-agent state**: If one agent learned something, other agents should know it too
- **User-controlled state**: Users should be able to see, edit, and clear the system's memory
## State Conflicts
When multiple agents modify state simultaneously:
- **Last-write-wins**: Simple but can lose information
- **Merge strategies**: Combine concurrent changes intelligently
- **Conflict detection**: Flag conflicts for human resolution
- **Versioning**: Keep history so conflicts can be resolved retrospectively
## Design Artefacts
- State architecture diagrams
- State schema definitions (what's stored, where, by whom)
- State lifecycle specifications (creation, update, archival, deletion)
- Conflict resolution rules
- User-facing state visibility and control designs
EOF
cat > "$PLUGIN/skills/human-in-the-loop.md" << 'EOF'
---
name: human-in-the-loop
description: Designing intervention points where humans review, approve, or redirect agent work.
---
# Human-in-the-Loop
Human-in-the-loop design defines when, where, and how humans intervene in automated workflows. Too little human involvement and the system makes dangerous mistakes. Too much and you've just built an expensive notification system.
## Intervention Types
- **Approval gates**: The system pauses and waits for human approval before proceeding
- **Review checkpoints**: The system presents results for human review but can continue if no objection
- **Correction opportunities**: The system shows its work and the human can edit before it's finalised
- **Override controls**: The human can stop, redirect, or undo the system's actions at any time
- **Monitoring dashboards**: The human passively observes the system and intervenes only when needed
## When to Require Human Intervention
- **High stakes**: Actions that are expensive, irreversible, or affect many people
- **Low confidence**: The system is uncertain about the right action
- **Novel situations**: The input or context is outside the system's training distribution
- **Ethical judgments**: Decisions that require moral reasoning or value trade-offs
- **Legal requirements**: Regulatory or compliance requirements mandate human review
- **User request**: The user explicitly asks for human involvement
## Designing Intervention Points
For each intervention point:
- **Trigger**: What causes the intervention? (confidence threshold, stakes level, user request, policy requirement)
- **Presentation**: What does the human see? (summary, full context, recommendations, options)
- **Time constraint**: How quickly must the human respond? What happens if they don't?
- **Decision options**: What can the human do? (approve, reject, edit, escalate, defer)
- **Feedback integration**: How does the human's decision feed back into the system?
## Avoiding Human Bottlenecks
Human intervention is expensive and slow. Design to minimise unnecessary intervention:
- **Graduated autonomy**: Start with more human oversight, reduce as the system proves reliable
- **Batch review**: Group similar decisions for efficient human processing
- **Smart routing**: Send interventions to the right human based on expertise and availability
- **Default actions**: If the human doesn't respond within a time window, take a safe default action
- **Learning from interventions**: Use human decisions to improve the system so it needs less intervention over time
## Design Artefacts
- Intervention point map (where in the workflow, what triggers each)
- Intervention interface designs (what the human sees and can do)
- Time constraint specifications
- Graduated autonomy plans
- Intervention analytics specifications (tracking how often, why, and what humans decide)
EOF
cat > "$PLUGIN/skills/failure-recovery.md" << 'EOF'
---
name: failure-recovery
description: What happens when an agent fails — retry, fallback, escalate, or graceful degradation.
---
# Failure Recovery
Agents fail. Networks time out, models hallucinate, tools error, and edge cases surprise. Failure recovery design determines whether a failure becomes a dead end or a graceful detour.
## Failure Types in Multi-Agent Systems
- **Agent failure**: A single agent crashes, times out, or produces invalid output
- **Handoff failure**: Context is lost or corrupted during transfer between agents
- **Coordination failure**: Agents conflict, deadlock, or produce inconsistent results
- **Resource failure**: External tools, APIs, or data sources are unavailable
- **Cascading failure**: One agent's failure causes downstream agents to fail
## Recovery Strategies
- **Retry**: Try the same operation again. Works for transient errors (network timeouts, rate limits). Set a retry limit to avoid infinite loops.
- **Fallback**: Switch to an alternative approach. A different agent, a simpler method, or a cached result.
- **Escalation**: Pass the problem to a more capable agent or to a human. Used when the failure is beyond the current agent's ability to resolve.
- **Graceful degradation**: Deliver a partial result rather than nothing. Tell the user what worked and what didn't.
- **Compensation**: Undo the effects of a partially completed workflow before retrying or escalating.
## Designing Recovery Paths
For each point in the workflow where failure is possible:
- **What could fail?** List the failure modes
- **What's the first recovery strategy?** Usually retry for transient errors
- **What's the fallback?** If retry fails, what's the alternative?
- **When do you escalate?** After how many retries or what type of failure?
- **What does the user see?** Transparent about the failure or silently recovered?
- **What's the worst case?** If all recovery fails, what's the graceful degradation?
## User Experience of Failures
- **Invisible recovery**: The system retries or falls back without the user noticing. Best for minor, quickly resolved failures.
- **Transparent recovery**: The system tells the user something went wrong and how it's handling it. "This is taking longer than usual — trying an alternative approach."
- **Participatory recovery**: The system asks the user to help. "I couldn't access your calendar. Can you check the connection?"
- **Honest failure**: The system tells the user it can't complete the task and explains why. Offers alternatives.
## Design Artefacts
- Failure mode inventory per agent and per handoff
- Recovery strategy specifications (retry limits, fallback paths, escalation triggers)
- Cascading failure analysis
- User experience specifications for each failure scenario
- Recovery testing protocols
EOF
cat > "$PLUGIN/skills/observability-design.md" << 'EOF'
---
name: observability-design
description: Making multi-agent workflows visible and debuggable for designers and developers.
---
# Observability Design
You can't improve what you can't see. Observability design makes the internal workings of multi-agent systems visible — so designers can understand user experience problems, developers can debug failures, and teams can improve the system over time.
## What to Make Observable
- **Workflow execution**: Which agents were involved, in what order, with what results
- **Decision points**: What decisions were made, what alternatives were considered, why one was chosen
- **Handoff details**: What context transferred between agents, was anything lost
- **Timing**: How long each agent took, where bottlenecks occur
- **Failures**: What failed, how it was recovered, what the user experienced
- **Quality signals**: Output quality scores, user satisfaction signals, task success markers
## Observability for Different Audiences
**For designers:**
- User journey view: What did the user experience across the whole workflow?
- Pain point identification: Where did users struggle, abandon, or express frustration?
- Quality patterns: Which outputs are high and low quality, and why?
**For developers:**
- Execution traces: Step-by-step log of agent actions
- Error logs: What failed and where
- Performance metrics: Latency, throughput, resource usage
**For product managers:**
- Usage patterns: Which workflows are used most, which are abandoned
- Success metrics: Task completion rates, user satisfaction trends
- Cost analysis: Resource consumption per workflow
**For users (optional):**
- Progress indicators: Where is the system in the workflow?
- Agent transparency: Which agent is handling their request?
- Audit trails: What the system did on their behalf
## Designing Observability Interfaces
- **Dashboards**: Real-time and historical views of system health and performance
- **Trace viewers**: Detailed step-by-step views of individual workflow executions
- **Alert systems**: Notifications when metrics exceed thresholds
- **Search and filter**: Ability to find specific executions by criteria
- **Comparison tools**: Compare performance across time periods, versions, or cohorts
## Observability Without Overload
Too much data is as bad as too little:
- **Layered detail**: Start with high-level summary, drill down on demand
- **Smart defaults**: Show the most important information first
- **Anomaly highlighting**: Surface unusual patterns automatically
- **Contextual views**: Different views for different questions
## Design Artefacts
- Observability architecture diagrams
- Dashboard specifications per audience
- Trace schema definitions
- Alert threshold configurations
- Observability tool requirements
EOF
# === COMMANDS ===
cat > "$PLUGIN/commands/design-workflow.md" << 'EOF'
---
description: Design a complete multi-agent workflow with roles, handoffs, and fallbacks.
argument-hint: "[user goal or task that requires multiple agents]"
---
You are designing a multi-agent workflow. Use only skills from the design-agent-orchestration plugin.
Follow this process:
## Step 1: Understand the User Goal
- What is the user trying to accomplish?
- What's the expected input and output?
- What's the complexity and stakes level?
## Step 2: Decompose the Task
Using **task-decomposition**:
- Break the user goal into subtasks
- Map dependencies between subtasks
- Identify what can be parallelised
- Define the reassembly logic
## Step 3: Design Agent Roles
Using **agent-role-design**:
- Define the agents needed (one per major subtask or responsibility)
- Create a role card for each agent: purpose, capabilities, knowledge scope, authority, boundaries
- Identify role patterns: specialist, router, orchestrator, validator
## Step 4: Design Handoffs
Using **handoff-protocols**:
- Define every handoff between agents
- Specify trigger, payload, and acknowledgment for each
- Define user experience at each handoff point
- Design context transfer templates
## Step 5: Design State Management
Using **state-management**:
- Define the state architecture (centralised, distributed, event-sourced)
- Specify what state is shared between agents
- Define state lifecycle and conflict resolution rules
## Step 6: Design Human Intervention Points
Using **human-in-the-loop**:
- Identify where human intervention is needed
- Design intervention interfaces and decision options
- Specify time constraints and default actions
## Step 7: Design Failure Recovery
Using **failure-recovery**:
- For each agent and each handoff, define failure modes
- Specify recovery strategies: retry, fallback, escalation, graceful degradation
- Design the user experience for each failure scenario
## Step 8: Design Observability
Using **observability-design**:
- Define what needs to be observable
- Specify dashboards for designers, developers, and product managers
- Design alert thresholds
## Output
Deliver a complete multi-agent workflow design:
1. Workflow overview diagram
2. Task decomposition with dependencies
3. Agent role cards
4. Handoff protocol specifications
5. State management architecture
6. Human intervention point map
7. Failure recovery specifications
8. Observability plan
EOF
cat > "$PLUGIN/commands/map-agents.md" << 'EOF'
---
description: Map out agent responsibilities, boundaries, and communication patterns.
argument-hint: "[multi-agent system or agentic product to map]"
---
You are mapping the agent architecture of a multi-agent system. Use only skills from the design-agent-orchestration plugin.
Follow this process:
## Step 1: Inventory the Agents
List every agent in the system (or planned for the system):
- What is each agent called?
- What is its stated purpose?
- What tools and data does it have access to?
## Step 2: Define Roles Formally
Using **agent-role-design**:
- For each agent, create a complete role card
- Identify role patterns (specialist, router, orchestrator, validator, fallback)
- Check for gaps: are there tasks no agent covers?
- Check for overlaps: do multiple agents claim the same territory?
## Step 3: Map Communication Patterns
Using **handoff-protocols**:
- Draw the communication graph: which agents talk to which?
- For each connection, define the handoff protocol
- Identify one-way vs. bidirectional communication
- Find bottlenecks: agents that everything flows through
## Step 4: Map Authority and Autonomy
Using **agent-role-design** and **human-in-the-loop**:
- For each agent, map autonomy level: full, supervised, advisory, passive
- Identify which agents can make decisions independently
- Map where human approval is required
- Check that authority matches stakes
## Step 5: Analyse Dependencies
Using **state-management** and **task-decomposition**:
- Map data dependencies between agents
- Identify critical paths where one agent blocks others
- Find circular dependencies
- Assess the impact of each agent failing on the rest of the system
## Step 6: Identify Risks
Using **failure-recovery**:
- For each agent, what happens if it fails?
- For each communication link, what happens if it breaks?
- Identify single points of failure
- Assess cascading failure risk
## Output
Deliver a complete agent map:
1. Agent inventory with role cards
2. Communication graph with handoff protocols
3. Authority and autonomy matrix
4. Dependency analysis with critical paths
5. Risk assessment with single points of failure
6. Recommendations for architecture improvements
EOF
cat > "$PLUGIN/commands/design-oversight.md" << 'EOF'
---
description: Create a human oversight plan for an agentic system.
argument-hint: "[agentic system or AI workflow to design oversight for]"
---
You are designing human oversight for an agentic system. Use only skills from the design-agent-orchestration plugin.
Follow this process:
## Step 1: Assess the System
- What does this agentic system do?
- What actions can it take autonomously?
- What are the highest-stakes actions?
- Who are the users and who are affected by the system's actions?
## Step 2: Map Intervention Points
Using **human-in-the-loop**:
- Identify every point in the workflow where human intervention could occur
- For each point, assess: what are the stakes? What's the cost of intervention? What's the cost of NOT intervening?
- Prioritise: which intervention points are mandatory vs. optional?
- Design the intervention interface for each mandatory point
## Step 3: Design Approval Gates
Using **human-in-the-loop**:
- For high-stakes actions, design approval gates
- Specify what information the human needs to make the decision
- Define time constraints and timeout behaviors
- Design batch approval for high-volume, lower-stakes actions
## Step 4: Design Monitoring
Using **observability-design**:
- Define what the oversight team needs to see in real time
- Design monitoring dashboards for system health, quality, and safety
- Define alert thresholds for anomalies
- Specify escalation protocols for detected issues
## Step 5: Design Override Capabilities
Using **human-in-the-loop** and **failure-recovery**:
- Define how humans can stop the system immediately
- Design rollback capabilities for recent actions
- Specify how to redirect the system mid-workflow
- Define emergency procedures for critical failures
## Step 6: Plan for Graduated Autonomy
Using **human-in-the-loop**:
- Define the starting level of human oversight
- Specify criteria for reducing oversight (performance metrics, time period, incident rate)
- Define triggers for increasing oversight (failures, complaints, changed conditions)
- Create an autonomy roadmap showing planned oversight evolution
## Output
Deliver a complete human oversight plan:
1. System assessment and risk profile
2. Intervention point map with priority ratings
3. Approval gate specifications
4. Monitoring dashboard specifications
5. Override and emergency procedures
6. Graduated autonomy roadmap
7. Oversight team roles and responsibilities
8. Oversight quality metrics (how to evaluate the oversight itself)
EOF
echo "✅ $PLUGIN complete — 7 skills, 3 commands"
