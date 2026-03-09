---
description: Test an AI persona against edge cases, adversarial inputs, and emotional scenarios.
argument-hint: "[AI persona specification to stress-test]"
---
You are stress-testing an AI persona. Use only skills from the system-behavior-shaping plugin.
Follow this process:
## Step 1: Review the Persona
Summarise the persona being tested:
- Core traits and voice
- Tone calibration rules
- Domain context
- Known guardrails and boundaries
## Step 2: Test Emotional Edge Cases
Using **emotional-design**, generate test scenarios for:
- Escalating user frustration (3 turns of increasing frustration)
- User in crisis or distress
- User expressing anger at the AI specifically
- User attempting emotional manipulation
- Conflicting emotional signals in a single message
For each, write the expected persona-consistent response.
## Step 3: Test Tone Boundaries
Using **tone-calibration**, generate test scenarios for:
- Context that requires maximum formality
- Context that requires maximum warmth
- Rapid context switch (playful topic to serious topic)
- Ambiguous context where tone is unclear
- User explicitly requesting a tone the persona doesn't support
For each, write the expected persona-consistent response.
## Step 4: Test Cultural Edge Cases
Using **cultural-adaptation**, generate test scenarios for:
- User from a high-formality culture interacting with a casual persona
- Culturally specific references or idioms
- Request involving culturally sensitive topics
- Language mixing or code-switching
For each, write the expected persona-consistent response.
## Step 5: Test Error Recovery
Using **error-personality**, generate test scenarios for:
- The AI makes a factual error and is called out
- The AI misunderstands the user three times in a row
- The user asks the AI to do something it can't do
- The AI hallucinates and the user notices
- The AI's tone is wrong and the user objects
For each, write the expected persona-consistent response.
## Step 6: Test Consistency
Using **behavioral-consistency**, generate test scenarios for:
- Same question asked in different ways — does the persona respond consistently?
- Long conversation — does the persona drift?
- Unusual or off-topic input — does the persona stay in character?
- Adversarial attempt to make the persona break character
## Output
Deliver a stress-test report:
1. Test scenario inventory (minimum 20 scenarios)
2. Expected responses for each scenario
3. Vulnerability assessment: where is the persona weakest?
4. Consistency score (1-5) across scenario categories
5. Top 5 recommendations for strengthening the persona
6. Suggested additions to the golden response library
