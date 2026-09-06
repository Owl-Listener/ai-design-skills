---
name: generative-ui
description: Designing interfaces where AI generates UI components dynamically.
---
# Generative UI
Generative UI is when the AI creates interface elements on the fly — forms, cards, charts, layouts — rather than responding with plain text. The interface itself becomes a model output.
## What Generative UI Changes
Traditional UI is designed ahead of time. Generative UI is created in the moment:
- **Static UI**: Designer creates all possible screens. Developer builds them. User navigates between them.
- **Generative UI**: The AI creates interface elements in response to user needs. No screen was pre-designed.
This shifts the designer's role from designing screens to designing the rules, constraints, and patterns the AI uses to generate screens.
## Design Constraints for Generated UI
The AI needs guardrails for what it generates:
- **Component library**: A defined set of components the AI can compose (cards, tables, forms, charts, buttons)
- **Layout rules**: Grid systems, spacing, hierarchy rules the AI must follow
- **Style boundaries**: Colour, typography, and visual style the AI must stay within
- **Interaction patterns**: How generated elements behave (clickable, editable, dismissible)
- **Accessibility requirements**: Generated UI must meet accessibility standards automatically
## When to Use Generative UI
Generative UI is powerful when:
- The output is structured data that benefits from visual presentation (tables, charts, comparisons)
- The user's request implies an interface (e.g., "show me a dashboard of...")
- Interactive elements would be more useful than text (e.g., forms, selectors, toggles)
- The content is highly variable and can't be pre-designed for every case
## When Not to Use It
- When plain text is clearer and simpler
- When the generated UI could be confusing or inconsistent
- When accessibility cannot be guaranteed
- When the user expects a predictable, stable interface
## Design Artefacts
- Generative UI component libraries (what the AI can use)
- Generation rules and constraints specification
- Quality criteria for generated interfaces
- Fallback designs for when generation fails
