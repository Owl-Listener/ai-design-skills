---
name: behavioral-consistency
description: Ensuring the AI behaves predictably across sessions, edge cases, and modalities.
---
# Behavioral Consistency
Users build mental models of how the AI behaves. Consistency is what makes those models reliable. Inconsistency — even if each individual response is good — erodes trust.
## Dimensions of Consistency
- **Across sessions**: The AI should behave the same way whether it's the user's first conversation or their hundredth
- **Across topics**: Switching subjects shouldn't change the AI's personality or approach
- **Across modalities**: The AI should feel the same in chat, voice, and email
- **Across users**: Different users get the same quality and character (unless personalisation is designed)
- **Across time**: The AI shouldn't randomly change behavior after updates without user awareness
## Sources of Inconsistency
- **Temperature and sampling**: Randomness in generation creates natural variation
- **Context sensitivity**: Different conversation histories lead to different behaviors
- **Prompt drift**: System prompts evolve over time without consistency checks
- **Edge cases**: Unusual inputs trigger unpredictable responses
- **Model updates**: New model versions may shift behavior subtly
## Designing for Consistency
- **Behavioral specifications**: Document expected behavior for common and edge-case scenarios
- **Golden responses**: Maintain a library of reference responses that define the standard
- **Regression testing**: When anything changes, test against the golden response library
- **Consistency metrics**: Track behavioral variance across sessions and users
- **User expectations**: Set and maintain expectations about what the AI does and how
## Consistency vs. Adaptation
Consistency doesn't mean rigidity. The AI should adapt to:
- User preferences (if designed for personalisation)
- Contextual needs (tone shifts as discussed in tone-calibration)
- Learning from feedback (if memory systems exist)
The key is that adaptation should be predictable and explainable, not random.
## Design Artefacts
- Behavioral specification documents
- Golden response libraries
- Regression test suites
- Consistency monitoring dashboards
- Adaptation rules (what changes and what stays constant)
