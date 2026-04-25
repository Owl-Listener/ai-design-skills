---
name: few-shot-patterns
description: Crafting examples that steer AI behavior effectively.
---
# Few-Shot Patterns
Few-shot prompting provides examples of input-output pairs that demonstrate the desired behavior. The AI learns the pattern from the examples and applies it to new inputs. The quality of examples directly determines the quality of outputs.
## Why Examples Work
Examples communicate what instructions alone cannot:
- **Implicit patterns**: The AI picks up on format, style, and reasoning patterns from examples without being told explicitly
- **Ambiguity resolution**: When instructions could be interpreted multiple ways, examples show which interpretation you want
- **Quality calibration**: Examples set the bar for output quality, length, and depth
- **Edge case handling**: Examples of tricky cases teach the AI how to handle similar situations
## Example Design Principles
**Diversity**: Examples should cover different scenarios, not repeat the same type
- Include easy cases, hard cases, and edge cases
- Vary the input format and content
- Show different valid output formats if applicable
**Clarity**: Each example should demonstrate one clear pattern
- Avoid examples that could be interpreted multiple ways
- Make the mapping from input to output obvious
- Remove irrelevant variation between examples
**Quality**: Examples set the ceiling for output quality
- Every example should be one you'd be happy to ship
- If the example has a flaw, the AI will replicate that flaw
- Invest time in crafting examples — they're worth more than instructions
**Ordering**: The position of examples matters
- Put the most representative example first
- Put edge cases after common cases
- End with an example closest to the expected input type
## How Many Examples
- **Zero-shot**: No examples. Relies entirely on instructions. Good for simple, well-understood tasks.
- **One-shot**: Single example. Enough when the pattern is straightforward.
- **Few-shot (3-5)**: Multiple examples. Best for complex patterns or nuanced quality requirements.
- **Many-shot (5+)**: Diminishing returns but useful for highly variable tasks or when consistency is critical.
Balance example count against context window cost. More examples means less room for other context.
## Anti-Patterns
- **Identical examples**: All examples are basically the same, teaching nothing about variation
- **Perfect-only examples**: No examples of how to handle imperfect inputs or edge cases
- **Contradictory examples**: Examples that demonstrate inconsistent patterns
- **Low-quality examples**: Sloppy examples produce sloppy outputs
- **Outdated examples**: Examples that no longer reflect current requirements
## Design Artefacts
- Example libraries per task type
- Example quality rubrics
- Example selection guidelines
- Example maintenance and update schedules
- Example effectiveness testing results
