---
name: harm-anticipation
description: Proactively identifying failure modes, misuse, and unintended consequences.
---
# Harm Anticipation
Harm anticipation is the practice of systematically thinking through how an AI product could cause harm — before it does. It's preventive design, not reactive crisis management.
## Categories of AI Harm
- **Direct harm**: The AI outputs something harmful — dangerous advice, discriminatory content, privacy violations
- **Facilitated harm**: The AI helps a user do something harmful — even if the AI's output itself is benign
- **Emergent harm**: Harmful patterns that emerge from scale or interaction effects, not from any single output
- **Omission harm**: The AI fails to act when it should — not flagging a crisis, not escalating when needed
- **Erosion harm**: Gradual negative effects — dependency, deskilling, manipulation, trust erosion
## Structured Harm Anticipation
Work through each harm category systematically:
1. **Who could be harmed?** The user, people the user interacts with, vulnerable populations, society at large
2. **How could they be harmed?** Physical, emotional, financial, reputational, privacy, autonomy
3. **What's the likelihood?** Common use case vs. edge case vs. adversarial attack
4. **What's the severity?** Inconvenience vs. distress vs. irreversible damage
5. **What's the detectability?** Obvious and immediate vs. subtle and delayed
## Misuse Scenarios
Think like an adversary:
- How would someone deliberately misuse this feature?
- What's the easiest way to extract harmful output?
- Could this be used to manipulate, deceive, or coerce someone?
- What if the user lies about their intent?
- What happens if someone automates interactions at scale?
## Unintended Consequences
Think about second-order effects:
- What happens when millions of people use this?
- What skills might users lose by relying on this?
- Could this create unfair advantages or disadvantages?
- What power dynamics does this shift?
- What becomes possible that wasn't before — for better and worse?
## Design Artefacts
- Harm anticipation matrix: Scenario | Harm Type | Likelihood | Severity | Mitigation
- Misuse scenario catalogue
- Pre-mortem analysis documents
- Risk-severity heatmaps for product features
