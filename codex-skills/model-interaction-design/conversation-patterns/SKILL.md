---
name: conversation-patterns
description: Turn-taking, repair sequences, grounding, and dialogue structure for human-AI interaction.
---
# Conversation Patterns
Conversation between humans and AI follows predictable structural patterns. Designing these deliberately — rather than leaving them to model defaults — is core interaction design work.
## Turn-Taking Structure
Every human-AI conversation has a rhythm. The designer decides:
- **Turn length**: Short exchanges (chatbot-style) vs. long-form (essay generation). Match turn length to task complexity.
- **Turn initiation**: Who speaks first? Does the AI greet, or wait? Does it ask a clarifying question before acting?
- **Turn boundaries**: How does the user signal "I'm done"? How does the AI signal "I need more"?
## Repair Sequences
Conversations break down. Repair is how they recover:
- **Self-repair**: The AI detects its own error and corrects ("Actually, let me revise that...")
- **Other-repair**: The user corrects the AI ("No, I meant the other one")
- **Clarification requests**: The AI asks for disambiguation before proceeding
- **Graceful misunderstanding**: The AI acknowledges confusion without frustrating the user
Design repair sequences explicitly. Don't rely on the model to improvise them.
## Grounding
Grounding is how participants establish shared understanding:
- **Confirmation**: "Just to confirm, you want me to..."
- **Summarisation**: "So far we've covered X, Y, and Z"
- **Reference resolution**: Handling pronouns, anaphora, and ambiguous references
- **Context anchoring**: Reminding the user what the AI knows and doesn't know
## Dialogue Structure Patterns
Common structural patterns for human-AI conversation:
- **Interview**: AI asks questions, user answers, AI synthesises
- **Co-creation**: Turn-by-turn collaborative building
- **Instruction-execution**: User gives command, AI performs, user evaluates
- **Exploration**: Open-ended back-and-forth to discover possibilities
- **Guided workflow**: AI leads the user through a multi-step process
Choose the pattern that matches the task. Don't default to instruction-execution for everything.
## Design Artefacts
- Conversation flow diagrams showing turn sequences
- Repair protocol specifications
- Grounding checkpoints mapped to conversation stages
- Turn-taking rules per interaction context
