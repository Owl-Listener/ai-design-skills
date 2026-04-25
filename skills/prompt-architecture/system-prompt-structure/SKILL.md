---
name: system-prompt-structure
description: Anatomy of effective system prompts — role, context, constraints, format.
---
# System Prompt Structure
A system prompt is the most important piece of design in an AI product. It defines who the AI is, what it knows, how it behaves, and what it produces. It's the equivalent of a brand guide, interaction spec, and behavioral contract rolled into one document.
## Anatomy of a System Prompt
A well-structured system prompt has distinct sections, each serving a specific purpose:
**1. Identity and Role**
Who is the AI? What's its purpose? This anchors everything that follows.
- "You are a senior UX researcher helping design teams..."
- Keep it specific. "You are a helpful assistant" is too vague to produce consistent behavior.
**2. Context and Knowledge**
What does the AI know? What's its domain? What information is it working with?
- Domain boundaries: what it's an expert in and what's outside its scope
- Background information relevant to the task
- User context: who it's talking to and what they need
**3. Behavioral Rules**
How should the AI behave? What are the do's and don'ts?
- Tone and voice specifications
- Response format preferences
- Guardrails and prohibited behaviors
- Interaction style (ask clarifying questions, be concise, think step by step)
**4. Output Specifications**
What should the AI produce? In what format?
- Expected output structure
- Length guidelines
- Format requirements (markdown, JSON, plain text)
- Quality criteria
**5. Examples (optional but powerful)**
Concrete demonstrations of expected behavior.
- Input-output pairs showing ideal responses
- Edge cases showing how to handle tricky situations
## Structure Principles
- **Order matters**: Models pay more attention to content at the beginning and end of the prompt. Put the most important instructions first.
- **Specificity beats length**: A short, specific prompt outperforms a long, vague one.
- **Positive instructions beat negative**: "Do X" is clearer than "Don't do Y" — though both have their place.
- **Separation of concerns**: Keep identity, rules, and output specs in distinct sections.
- **Testability**: Every instruction in the prompt should be testable. If you can't tell whether the AI followed it, rewrite it.
## Common Structural Mistakes
- **Kitchen sink prompts**: Cramming every possible instruction in. The model can't prioritise.
- **Contradictory instructions**: Rules that conflict with each other, forcing the model to guess which to follow.
- **Implicit expectations**: Assuming the model knows what you want without saying it.
- **Scattered instructions**: The same topic addressed in multiple places, creating inconsistency.
- **Static prompts**: Never updating the prompt based on what actually works.
## Design Artefacts
- System prompt document with labelled sections
- Prompt requirement specifications (what the prompt must achieve)
- Prompt review checklists
- Version history with change rationale
