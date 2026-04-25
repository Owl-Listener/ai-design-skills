---
name: guardrail-design
description: Defining behavioral boundaries — what the AI should and shouldn't do.
---
# Guardrail Design
Guardrails are the behavioral boundaries that define what an AI product will and won't do. They're not just safety constraints — they're design decisions that shape the entire user experience.
## Types of Guardrails
- **Content guardrails**: What topics the AI will and won't discuss. What it generates and refuses to generate.
- **Action guardrails**: What the AI can do in the world — send emails, make purchases, delete data — and what requires human approval.
- **Tone guardrails**: How the AI communicates — what language it uses, how formal or casual, when it's direct vs. diplomatic.
- **Scope guardrails**: What the AI considers in and out of scope for its role. A coding assistant shouldn't give medical advice.
- **Confidence guardrails**: When the AI should express uncertainty, hedge, or refuse rather than guessing.
## Designing Guardrails as Product Decisions
Every guardrail is a product decision with tradeoffs:
- **Too strict**: The product feels limited, frustrating, and paternalistic. Users route around the guardrails.
- **Too loose**: The product causes harm, loses trust, and creates liability.
- **Inconsistent**: Users can't predict what the AI will and won't do, eroding trust.
The goal is guardrails that feel like good judgment, not arbitrary restrictions.
## Guardrail Specification
For each guardrail, define:
- **What it prevents**: The specific behavior or output being constrained
- **Why it exists**: The harm it prevents or the value it protects
- **How it manifests**: What the user sees when the guardrail activates (refusal message, alternative suggestion, escalation)
- **Edge cases**: Grey areas where the guardrail might be too strict or too loose
- **Override conditions**: Whether and how the guardrail can be relaxed (admin settings, user confirmation, context-dependent)
## Guardrail Communication
How the AI communicates a guardrail matters as much as the guardrail itself:
- **Transparent refusal**: "I can't help with that because..." — honest about the boundary
- **Redirective refusal**: "I can't do X, but I can help you with Y" — offering alternatives
- **Silent guardrail**: The AI steers away from the boundary without mentioning it
- **Escalation**: "This needs a human to review" — handing off rather than refusing
## Design Artefacts
- Guardrail specification table: Category | Rule | Rationale | User Experience | Edge Cases
- Refusal message templates per guardrail type
- Guardrail severity tiers (hard block vs. soft warning vs. nudge)
- Testing scenarios for each guardrail
