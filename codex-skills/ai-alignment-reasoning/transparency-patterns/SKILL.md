---
name: transparency-patterns
description: Showing users what the AI knows, doesn't know, and how confident it is.
---
# Transparency Patterns
Transparency in AI products means making the system's knowledge, limitations, and confidence visible to users. It's how you build warranted trust — trust based on understanding, not blind faith.
## What to Make Transparent
- **Source**: Where did the AI get this information? Training data, retrieved documents, user input, inference?
- **Confidence**: How certain is the AI? Is this a well-supported answer or a best guess?
- **Limitations**: What doesn't the AI know? What can't it do? Where does its knowledge end?
- **Process**: How did the AI arrive at this output? What steps did it take?
- **Identity**: This is an AI, not a human. Never obscure this.
## Transparency Patterns
- **Confidence indicators**: Visual or textual signals of certainty ("I'm fairly confident" vs. "I'm not sure about this")
- **Source attribution**: Citing where information came from
- **Reasoning traces**: Showing the AI's step-by-step thinking
- **Limitation disclosure**: Proactively stating what the AI can't do or doesn't know
- **Model cards**: High-level descriptions of what the AI is, how it works, and what it's good and bad at
- **Uncertainty highlighting**: Visually distinguishing confident outputs from uncertain ones
## Calibrating Transparency
Too much transparency overwhelms. Too little erodes trust. Calibrate by:
- **User expertise**: Experts want more detail. Novices want simple signals.
- **Task stakes**: High-stakes decisions need full transparency. Low-stakes interactions need less.
- **Output confidence**: Show more transparency when the AI is uncertain, less when it's confident.
- **User request**: Let users drill into details on demand rather than showing everything upfront.
## Transparency Anti-Patterns
- **Performative transparency**: Showing a reasoning trace that doesn't actually explain the decision
- **Buried disclaimers**: Putting limitations in fine print nobody reads
- **False confidence**: The AI sounds certain when it's guessing
- **Opaque refusal**: "I can't help with that" with no explanation
- **Transparency theatre**: Making the system look transparent without actually being informative
## Design Artefacts
- Transparency level specifications per feature
- Confidence communication guidelines
- Source attribution patterns
- Limitation disclosure templates
