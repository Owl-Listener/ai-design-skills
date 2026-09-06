---
name: constraint-specification
description: Defining output format, length, tone, and content boundaries within prompts.
---
# Constraint Specification
Constraints are the rules that shape AI output — what format to use, how long to be, what to include, what to exclude. Well-specified constraints produce predictable, useful outputs. Vague constraints produce inconsistent results.
## Types of Constraints
**Format constraints:**
- Output structure (JSON, markdown, plain text, bullet points, prose)
- Section headings and organisation
- Required fields and optional fields
- Data types and schemas
**Length constraints:**
- Word count ranges (not exact numbers — models are bad at counting)
- Section length proportions ("spend 60% on analysis, 40% on recommendations")
- Minimum and maximum bounds
- Conciseness directives ("be brief" vs. "be thorough")
**Content constraints:**
- Topics to include and exclude
- Required information elements
- Prohibited content
- Source restrictions (only use provided context, don't use external knowledge)
**Tone constraints:**
- Formality level
- Emotional register
- Audience-appropriate language
- Voice and style guidelines
**Quality constraints:**
- Accuracy requirements ("cite sources", "flag uncertainty")
- Completeness requirements ("address all aspects of the question")
- Originality requirements ("don't repeat the question back")
- Actionability requirements ("every recommendation must be implementable")
## Writing Effective Constraints
- **Be specific**: "Keep responses under 200 words" beats "be concise"
- **Prioritise**: When constraints conflict, state which wins. "Accuracy over brevity."
- **Provide examples**: Show what a constrained output looks like
- **Test boundaries**: What happens at the edge of each constraint?
- **Separate hard and soft constraints**: Hard constraints must always be met. Soft constraints are preferences.
## Constraint Interactions
Constraints interact and can conflict:
- "Be thorough" vs. "Keep it under 100 words"
- "Be creative" vs. "Follow this exact format"
- "Be helpful" vs. "Don't give medical advice"
Resolve conflicts explicitly in the prompt. Don't make the model guess which constraint takes priority.
## Design Artefacts
- Constraint specification documents per output type
- Constraint priority hierarchies
- Constraint test cases (inputs designed to stress each constraint)
- Constraint violation examples (what bad looks like)
- Constraint evolution logs (how constraints changed and why)
