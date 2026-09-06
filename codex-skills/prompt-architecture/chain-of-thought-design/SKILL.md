---
name: chain-of-thought-design
description: Designing reasoning chains that produce better outputs.
---
# Chain-of-Thought Design
Chain-of-thought prompting asks the AI to show its reasoning step by step before arriving at an answer. When designed well, this produces more accurate, more nuanced, and more trustworthy outputs. When designed poorly, it produces verbose justification of bad answers.
## When Chain-of-Thought Helps
- **Complex reasoning**: Multi-step problems where the answer depends on intermediate conclusions
- **Ambiguous inputs**: When the AI needs to consider multiple interpretations
- **High-stakes outputs**: When you need to verify the reasoning, not just the answer
- **Creative exploration**: When generating ideas benefits from building on each step
- **Analytical tasks**: Comparisons, evaluations, and trade-off analyses
## When Chain-of-Thought Hurts
- **Simple lookups**: "What's the capital of France?" doesn't need step-by-step reasoning
- **Speed-critical responses**: Reasoning adds latency and token cost
- **Pattern-matching tasks**: Some tasks are better served by direct response
- **When reasoning is wrong**: The AI can reason convincingly toward an incorrect conclusion
## Designing Reasoning Chains
A reasoning chain has structure. Design it deliberately:
**1. Problem decomposition**
"First, break this problem into its component parts."
**2. Evidence gathering**
"For each part, identify what you know and what you're uncertain about."
**3. Analysis**
"Analyse each component, noting assumptions and limitations."
**4. Synthesis**
"Combine your analysis into an overall assessment."
**5. Conclusion**
"State your conclusion and your confidence level."
## Chain Variants
- **Linear chain**: Step 1 → Step 2 → Step 3 → Answer. Simple and predictable.
- **Branching chain**: Consider multiple paths, evaluate each, then choose. Better for decisions.
- **Iterative chain**: Draft an answer, critique it, revise it. Better for quality refinement.
- **Debate chain**: Argue for and against a position, then synthesise. Better for balanced analysis.
## Controlling Chain Quality
- **Specify the steps**: Don't just say "think step by step." Define what the steps are.
- **Limit reasoning depth**: Set a maximum number of steps or reasoning length to prevent runaway chains.
- **Separate thinking from output**: Let the AI reason internally, then produce a clean final output.
- **Validate intermediate steps**: Check that each step is sound, not just the final answer.
## Design Artefacts
- Chain-of-thought templates per task type
- Reasoning step specifications
- Chain variant selection guidelines
- Quality checkpoints for intermediate steps
- Examples of well-structured and poorly-structured chains
