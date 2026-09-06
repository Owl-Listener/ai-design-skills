---
name: comparative-evaluation
description: A/B testing, side-by-side comparison, and preference ranking for AI outputs.
---
# Comparative Evaluation
Absolute quality scores are useful but limited. Comparative evaluation — putting outputs side by side and asking which is better — often reveals quality differences that rubrics miss.
## Comparison Methods
- **A/B testing**: Show different users different versions and compare outcomes
- **Side-by-side evaluation**: Show evaluators two outputs for the same input and ask which is better
- **Preference ranking**: Show evaluators multiple outputs and rank them from best to worst
- **Paired comparison**: Compare every pair of options to build a complete ranking
- **Elo rating**: Use tournament-style comparisons to develop continuous quality scores
## Designing A/B Tests for AI
A/B testing AI is different from A/B testing UI:
- **Variance is high**: The same prompt can produce different outputs, so you need more samples
- **Context matters**: The same change might help for one task and hurt for another
- **Metrics lag**: AI quality changes may take time to show up in user behavior
- **Interaction effects**: A change to one part of the conversation affects all subsequent parts
Design A/B tests with:
- Sufficient sample sizes to account for output variance
- Segmentation by task type and user experience level
- Multiple metrics (don't optimise for one at the expense of others)
- Guardrails to catch severe quality regressions quickly
## Side-by-Side Evaluation Design
For human evaluation of AI outputs:
- **Blind evaluation**: Evaluators shouldn't know which version is which
- **Consistent inputs**: Compare outputs generated from the same input
- **Structured criteria**: Give evaluators specific dimensions to compare on, not just "which is better"
- **Multiple evaluators**: Use at least 3 evaluators per comparison for reliability
- **Diverse inputs**: Test across a representative sample of real user inputs
## When to Use Comparative vs. Absolute Evaluation
- **Comparative**: Best for choosing between alternatives, detecting subtle quality differences, and model selection
- **Absolute**: Best for measuring against a standard, tracking progress over time, and certification
## Design Artefacts
- A/B test design templates
- Side-by-side evaluation protocols
- Evaluator instructions and rubrics
- Sample size calculators for AI experiments
- Comparison result analysis frameworks
