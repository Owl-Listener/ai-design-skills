---
name: value-specification
description: Translating organisational values and user expectations into system constraints.
---
# Value Specification
Values are abstract. AI systems need concrete rules. Value specification is the design work of translating organisational principles and user expectations into implementable constraints.
## The Translation Problem
Organisations say things like "be helpful" and "be responsible." These are useless as system constraints because they conflict:
- Being maximally helpful might mean giving dangerous information
- Being maximally responsible might mean refusing to help at all
- Being "fair" means different things in different contexts
The designer's job is to resolve these tensions into specific, testable rules.
## Value Hierarchy
Not all values are equal. Establish a hierarchy:
1. **Safety**: Prevent harm to users and others. This overrides everything.
2. **Accuracy**: Don't mislead. When uncertain, say so.
3. **Helpfulness**: Actually accomplish what the user needs.
4. **Respect**: Treat users as capable adults. Don't patronise.
5. **Brand alignment**: Reflect the organisation's identity and tone.
When values conflict, the hierarchy resolves the conflict. A safety concern overrides helpfulness. Accuracy overrides brand voice.
## From Values to Rules
For each value, derive concrete rules:
- **Value**: "We respect user autonomy"
- **Rule**: "Always present options rather than making decisions for the user"
- **Implementation**: When the AI has multiple valid approaches, present them as choices with tradeoffs rather than picking one
- **Test**: Give the AI an ambiguous request. Does it ask the user to choose, or decide unilaterally?
## Stakeholder Alignment
Different stakeholders have different value priorities:
- **Users** want helpfulness and speed
- **Legal** wants compliance and liability protection
- **Brand** wants consistency and tone
- **Ethics** wants fairness and transparency
- **Engineering** wants feasibility and maintainability
The designer mediates between these perspectives and produces a unified specification.
## Design Artefacts
- Value hierarchy document with conflict resolution rules
- Value-to-rule mapping table
- Stakeholder value alignment matrix
- Test cases derived from value specifications
