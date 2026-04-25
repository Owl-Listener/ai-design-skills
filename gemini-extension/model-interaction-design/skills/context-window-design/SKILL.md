---
name: context-window-design
description: Designing around token limits, memory, and conversation persistence.
---
# Context Window Design
Every AI model has a finite context window. Designing within this constraint — and designing the user experience around it — is a core skill for AI product design.
## The Context Window as a Design Material
The context window is not just a technical limitation. It's a design material:
- **What goes in**: System prompts, conversation history, retrieved documents, tool results, user preferences
- **What gets dropped**: Older messages, less relevant context, verbose instructions
- **What the user sees**: The conversation as presented may differ from what the model actually processes
Designers must understand context window allocation to design reliable experiences.
## Memory and Persistence
Users expect AI to remember. Design for different memory horizons:
- **Within-conversation memory**: What was said earlier in this chat. Usually handled by the context window itself.
- **Cross-conversation memory**: Preferences, past decisions, ongoing projects. Requires explicit memory systems.
- **Shared memory**: Context shared across multiple users or agents. Requires careful privacy design.
## Strategies for Limited Context
- **Summarisation**: Compress earlier conversation into summaries to free up tokens
- **Retrieval-augmented generation**: Pull in relevant context on demand rather than keeping everything loaded
- **Priority ordering**: Put the most important context closest to the prompt (recency bias in attention)
- **User-controlled context**: Let users pin, remove, or prioritise what the AI remembers
- **Graceful degradation**: When context is lost, acknowledge it rather than hallucinating continuity
## Design Artefacts
- Context budget allocations (how many tokens for system prompt, history, retrieval, etc.)
- Memory architecture diagrams showing what persists and what's ephemeral
- Context overflow UX flows (what happens when the window fills up)
- User-facing memory controls specification
