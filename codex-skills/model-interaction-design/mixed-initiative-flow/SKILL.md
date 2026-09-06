---
name: mixed-initiative-flow
description: When the AI leads vs. when the user leads, and how to hand off control.
---
# Mixed-Initiative Flow
Mixed-initiative interaction is when both the human and the AI can take the lead. The designer decides who drives at each moment — and how control transfers between them.
## Initiative Spectrum
Interactions sit on a spectrum:
- **User-driven**: The user gives instructions, the AI executes. The user controls pace, direction, and scope.
- **AI-driven**: The AI leads — asking questions, making suggestions, guiding the user through a process.
- **Shared**: Both parties contribute. The AI proposes, the user edits. The user starts, the AI finishes.
Most AI products default to user-driven. The interesting design space is in shared and AI-driven modes.
## Designing Initiative Handoffs
The moment control shifts from one party to the other is where most interactions fail. Design these transitions:
- **Explicit handoff**: "I've drafted three options. Which direction do you want to go?" — the AI clearly passes control.
- **Implicit handoff**: The AI stops generating and waits, signalling the user's turn through UI affordance.
- **Negotiated handoff**: "I could take this further or stop here for your input. What do you prefer?"
- **Forced handoff**: The AI encounters a decision it can't make and must hand back to the human.
## When the AI Should Lead
The AI should take initiative when:
- The user is uncertain or exploring and needs guidance
- The task has a known best-practice sequence the AI can walk through
- The user has explicitly asked for help or coaching
- Proactive suggestions would save time without being intrusive
## When the User Should Lead
The user should retain control when:
- The task involves subjective judgment or creative direction
- Stakes are high and errors are costly
- The user has strong domain expertise
- Privacy or consent decisions are involved
## Anti-Patterns
- **Initiative whiplash**: Control bouncing back and forth too rapidly
- **Passive AI**: Never taking initiative even when it would help
- **Overbearing AI**: Taking over when the user wants control
- **Unclear ownership**: Neither party knows whose turn it is
## Design Artefacts
- Initiative maps showing who leads at each stage
- Handoff trigger definitions (what causes a transfer of control)
- Autonomy level specifications per feature area
