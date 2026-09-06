---
name: escalation-design
description: When and how AI should escalate to humans, refuse, or ask for clarification.
---
# Escalation Design
Escalation is what happens when the AI reaches the boundary of what it should handle alone. Designing escalation well means the user gets help instead of a dead end — and the AI knows its limits.
## Escalation Triggers
The AI should escalate when:
- **Confidence is low**: The AI isn't sure its output is correct or helpful
- **Stakes are high**: The decision has significant consequences (financial, medical, legal, safety)
- **Emotional distress**: The user shows signs of crisis, distress, or vulnerability
- **Ambiguity is unresolvable**: The AI can't determine intent even after clarification
- **Scope boundary**: The request is outside what the AI is designed to handle
- **Policy boundary**: The request approaches or crosses a guardrail
- **Conflict**: The user disagrees with the AI and the disagreement can't be resolved
## Escalation Types
- **To human support**: Transfer to a human agent with full context
- **To the user themselves**: "This decision is yours to make" — handing back agency
- **To a specialist**: Routing to domain-specific help (medical, legal, technical)
- **To a supervisor/admin**: Flagging for organisational review
- **Self-escalation**: The AI flags its own output for review before delivering it
## Designing the Escalation Experience
The user's experience of escalation matters:
- **Context transfer**: When escalating to a human, pass the full conversation. Don't make the user repeat themselves.
- **Warm handoff**: "I'm connecting you with someone who can help with this" — not a cold redirect.
- **Expectation setting**: Tell the user what will happen next and how long it might take.
- **Graceful degradation**: If no human is available, offer alternatives — not a dead end.
- **Dignity**: Never make the user feel stupid for needing escalation.
## Escalation Anti-Patterns
- **The infinite loop**: AI keeps trying instead of escalating, frustrating the user
- **Premature escalation**: AI escalates when it could easily handle the request, annoying the user
- **Context loss**: User has to start over after escalation
- **Blame shifting**: AI implies the user caused the problem
- **Hidden escalation**: Escalation happens without the user knowing
## Design Artefacts
- Escalation trigger matrix: Trigger | Threshold | Escalation Type | User Experience
- Escalation flow diagrams per feature
- Context handoff specifications
- Fallback path designs for when escalation isn't available
- Escalation quality metrics
