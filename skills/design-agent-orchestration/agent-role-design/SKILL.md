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
