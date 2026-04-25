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
