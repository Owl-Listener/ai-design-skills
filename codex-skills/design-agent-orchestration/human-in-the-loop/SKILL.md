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
