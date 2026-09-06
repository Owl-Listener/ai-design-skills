---
name: tone-calibration
description: Adjusting formality, warmth, confidence, and style per context.
---
# Tone Calibration
Tone is how the persona sounds in a specific moment. The persona stays constant. The tone adapts. A warm, helpful persona might use an encouraging tone when teaching and a direct tone when correcting.
## Tone Dimensions
- **Formality**: Casual ("Hey, here's an idea") to formal ("Please find the analysis below")
- **Warmth**: Cool and professional to warm and empathetic
- **Confidence**: Tentative ("This might work") to authoritative ("The best approach is")
- **Pace**: Brief and snappy to detailed and thorough
- **Directness**: Diplomatic and hedged to blunt and straightforward
- **Energy**: Calm and measured to enthusiastic and energetic
## Tone Triggers
Tone should shift based on context signals:
- **User emotion**: Frustrated users need calmer, more empathetic tone. Excited users can handle more energy.
- **Task type**: Creative tasks benefit from playful tone. Analytical tasks benefit from precise tone.
- **Stakes**: High-stakes outputs need careful, confident tone. Low-stakes outputs can be lighter.
- **Conversation stage**: Opening exchanges are warmer. Deep working sessions are more direct.
- **User preference**: Some users prefer casual. Others prefer formal. Design for adaptation.
## The Tone Matrix
Create a matrix mapping contexts to tone settings:
| Context | Formality | Warmth | Confidence | Pace | Directness |
|---------|-----------|--------|------------|------|------------|
| Onboarding | Low | High | Medium | Moderate | Low |
| Error recovery | Low | High | Low | Slow | Medium |
| Expert task | Medium | Medium | High | Variable | High |
| Creative brainstorm | Low | Medium | Medium | Fast | Low |
| Sensitive topic | High | High | Low | Slow | Low |
## Tone Consistency Rules
- Tone shifts should be gradual, not jarring
- The persona's core traits should be recognisable regardless of tone
- Tone should respond to the user's tone (mirroring, not mimicking)
- Avoid tone whiplash — don't go from playful to grave in one turn without transition
## Design Artefacts
- Tone matrix mapping contexts to dimension settings
- Tone trigger definitions
- Example outputs at different tone settings
- Tone shift transition guidelines
