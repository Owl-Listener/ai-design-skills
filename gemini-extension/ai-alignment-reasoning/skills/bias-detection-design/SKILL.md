---
name: bias-detection-design
description: Designing review workflows to surface and mitigate bias in AI outputs.
---
# Bias Detection Design
AI systems inherit biases from training data, amplify them through pattern-matching, and embed them in outputs that appear authoritative. Bias detection design creates the workflows, processes, and interfaces that help teams find and fix bias before users encounter it.
## Types of Bias in AI Products
- **Representation bias**: Some groups are overrepresented or underrepresented in outputs (images, examples, personas)
- **Performance bias**: The AI works better for some users than others (languages, accents, cultural contexts)
- **Framing bias**: The AI presents information in ways that favour certain perspectives
- **Allocation bias**: AI-driven decisions distribute resources or opportunities unevenly
- **Association bias**: The AI links concepts in stereotypical ways
## Designing Bias Detection Workflows
Bias detection is a team practice, not a one-time audit:
- **Regular review cycles**: Schedule periodic reviews of AI outputs for bias patterns
- **Diverse review panels**: Include reviewers from different backgrounds, cultures, and perspectives
- **Structured evaluation**: Use rubrics and checklists, not intuition
- **Real-world sampling**: Test with real user inputs, not just curated test cases
- **Longitudinal monitoring**: Bias can emerge over time as usage patterns change
## Detection Methods
- **Comparative testing**: Give the AI the same task with different demographic variables. Compare outputs.
- **Edge case exploration**: Test inputs from underrepresented groups or unusual contexts.
- **Output auditing**: Review a sample of real outputs for patterns of bias.
- **User feedback analysis**: Look for bias-related complaints or differential satisfaction.
- **Benchmark evaluation**: Test against established fairness benchmarks for the domain.
## From Detection to Mitigation
Finding bias is step one. Addressing it requires:
- **Root cause analysis**: Is the bias in training data, prompt design, model architecture, or product design?
- **Mitigation options**: Retraining, prompt adjustment, output filtering, user controls, or design changes
- **Tradeoff analysis**: Fixing one bias might introduce another. Document the tradeoffs.
- **Verification**: After mitigation, verify the fix worked without creating new problems.
## Design Artefacts
- Bias audit checklists per feature
- Review panel composition guidelines
- Comparative testing protocols
- Bias incident documentation templates
- Mitigation tracking logs
