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
