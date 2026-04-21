---
name: multimodal-orchestration
description: Coordinating text, image, voice, and tool-use modalities in a single interaction.
---
# Multimodal Orchestration
AI interactions increasingly span multiple modalities — text, images, voice, code, tools, and structured data. Designing how these modalities work together is orchestration.
## Modality Selection
Each modality has strengths:
- **Text**: Precise, editable, referenceable. Best for instructions, explanations, and nuanced content.
- **Image**: Spatial, holistic, immediate. Best for layouts, diagrams, and visual concepts.
- **Voice**: Natural, hands-free, emotional. Best for conversational flow and accessibility.
- **Code**: Executable, precise, verifiable. Best for technical specifications and automation.
- **Structured data**: Tables, forms, JSON. Best for comparison, configuration, and data entry.
- **Tool use**: Actions in external systems. Best for execution, not just generation.
The designer decides which modality the AI uses for each part of a response — and which modality the user uses for each input.
## Cross-Modal Transitions
When the interaction switches modalities, design the transition:
- **Text to image**: "Here's what that layout could look like" — the AI generates a visual from a text description
- **Image to text**: The user uploads a screenshot, the AI describes or critiques it
- **Text to tool**: The AI writes a plan, then executes it via tool use
- **Voice to text**: Spoken conversation captured and summarised as structured notes
Transitions should feel seamless. The user shouldn't have to manually switch modes.
## Modality Conflicts
Sometimes modalities compete:
- Text says one thing, the image shows another
- Voice tone contradicts text content
- Structured output doesn't match the conversational context
Design for consistency across modalities. Establish a primary modality for each interaction type and treat others as supporting.
## Design Artefacts
- Modality maps showing which modality is used at each interaction point
- Cross-modal transition specifications
- Input/output modality matrices per feature
- Fallback definitions when a modality is unavailable
