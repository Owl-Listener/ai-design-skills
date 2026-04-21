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
