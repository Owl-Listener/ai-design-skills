---
name: output-quality-rubrics
description: Defining what "good" looks like for AI outputs — accuracy, relevance, helpfulness.
---
# Output Quality Rubrics
Without a rubric, quality evaluation is subjective and inconsistent. A rubric defines what "good" means in concrete, measurable terms — so different evaluators reach the same conclusions.
## Core Quality Dimensions
- **Accuracy**: Is the information correct? Are claims verifiable? Are there hallucinations?
- **Relevance**: Does the output address what the user actually asked? Is everything included necessary?
- **Completeness**: Does the output cover everything needed? Are there gaps?
- **Helpfulness**: Can the user actually use this output to accomplish their goal?
- **Clarity**: Is the output easy to understand? Is it well-structured?
- **Tone appropriateness**: Does the output match the expected tone for the context?
- **Safety**: Is the output free from harmful, biased, or inappropriate content?
## Building a Rubric
For each dimension, define a scale:
**Example — Accuracy (1-5):**
- 5: All claims are verifiable and correct. No hallucinations.
- 4: Minor inaccuracies that don't affect usefulness. No hallucinations.
- 3: Some inaccuracies that could mislead if not caught. No dangerous hallucinations.
- 2: Significant inaccuracies. User would need to verify most claims.
- 1: Major hallucinations or factually wrong information presented confidently.
## Weighting Dimensions
Not all dimensions matter equally for every use case:
- A medical AI weights accuracy and safety highest
- A creative writing AI weights helpfulness and tone highest
- A coding AI weights accuracy and completeness highest
- A customer service AI weights tone and helpfulness highest
Define weights when creating the rubric. Make the priorities explicit.
## Rubric Calibration
A rubric is only useful if evaluators use it consistently:
- **Anchor examples**: Provide sample outputs at each score level
- **Calibration sessions**: Have multiple evaluators score the same outputs and discuss disagreements
- **Inter-rater reliability**: Measure agreement between evaluators and refine the rubric until agreement is high
- **Edge case guidance**: Document how to score ambiguous cases
## Design Artefacts
- Scoring rubric with dimension definitions and scales
- Anchor examples at each score level
- Dimension weighting specifications per use case
- Calibration session protocols
- Scoring templates and checklists
