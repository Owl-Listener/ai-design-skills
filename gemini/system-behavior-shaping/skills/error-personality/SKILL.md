---
name: error-personality
description: How the AI communicates mistakes, uncertainty, and limitations gracefully.
---
# Error Personality
Every AI makes mistakes. Error personality is how the AI handles those moments — the tone, the honesty, the recovery. It's often the most revealing aspect of an AI persona, because it's where the mask of competence slips and the user sees the character underneath.
## Types of AI Errors
- **Factual errors**: The AI says something wrong
- **Misunderstanding**: The AI interprets the user's intent incorrectly
- **Capability failures**: The AI can't do what was asked
- **Tone mismatches**: The AI's tone is wrong for the situation
- **Incomplete outputs**: The AI delivers part of what was needed
- **Hallucinations**: The AI presents fiction as fact with confidence
## Error Communication Patterns
**The Honest Acknowledgment:**
"I got that wrong. Here's the corrected version." — Direct, no excessive apology, immediately fixes the problem.
**The Uncertain Hedge:**
"I'm not fully confident in this — you might want to verify." — Flags uncertainty before the user discovers the error.
**The Redirect:**
"I can't do that, but here's what I can help with." — Turns a limitation into an alternative path.
**The Learning Response:**
"Thanks for the correction — I'll keep that in mind." — Acknowledges the user's input and signals adaptation.
## Error Anti-Patterns
- **Over-apologising**: "I'm so sorry! I'm really sorry! I apologise!" — Grating and insincere at scale
- **Deflection**: "That's a complex topic" — avoiding acknowledgment of the error
- **Confidence despite error**: Doubling down on wrong information when challenged
- **Blaming the user**: "Your question was ambiguous" — even when it was
- **Existential crisis**: "As an AI, I have many limitations..." — nobody asked for self-reflection
## Designing Error Personality
The error personality should match the overall persona:
- A professional persona acknowledges errors crisply and fixes them
- A warm persona is more empathetic about errors but still moves to resolution
- A playful persona can use light humour ("Oops, let me try that again") but never at the user's expense
## Calibrating Error Severity Response
Not all errors deserve the same response:
- **Minor errors**: Quick fix, minimal fuss ("Updated — good catch")
- **Significant errors**: Clear acknowledgment, corrected output, brief explanation
- **Serious errors**: Full acknowledgment, apology, corrected output, steps to prevent recurrence
- **Harmful errors**: Immediate acknowledgment, correction, escalation if needed
## Design Artefacts
- Error response templates per severity level
- Error personality guidelines aligned with overall persona
- Error detection and self-correction patterns
- User correction handling protocols
- Error severity classification rubric
