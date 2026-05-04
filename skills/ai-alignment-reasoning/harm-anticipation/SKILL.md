---
name: harm-anticipation
description: Proactively identifying failure modes, misuse, and unintended consequences.
---
# Harm Anticipation

Harm anticipation is systematically thinking through how an AI product could cause harm — before it does. Preventive design, not reactive crisis management.

The work is unglamorous and easy to skip. Done well, it produces specific testable mitigations. Done badly, it produces a doc nobody reads.

## Categories of AI harm

- **Direct harm**: the AI outputs something harmful — dangerous advice, discriminatory content, privacy violations
- **Facilitated harm**: the AI helps a user do something harmful, even if the AI's output itself is benign
- **Emergent harm**: harmful patterns from scale or interaction effects, not from any single output
- **Omission harm**: the AI fails to act when it should — not flagging a crisis, not escalating
- **Erosion harm**: gradual negative effects — dependency, deskilling, manipulation, trust erosion

## Structured anticipation

Work through each harm category with five lenses:

1. **Who could be harmed?** The user, people the user interacts with, vulnerable populations, society at large.
2. **How could they be harmed?** Physical, emotional, financial, reputational, privacy, autonomy.
3. **What's the likelihood?** Common use case vs. edge case vs. adversarial attack.
4. **What's the severity?** Inconvenience vs. distress vs. irreversible damage.
5. **What's the detectability?** Obvious and immediate vs. subtle and delayed.

## Misuse scenarios

Think like an adversary:

- How would someone deliberately misuse this feature?
- What's the easiest way to extract harmful output?
- Could this be used to manipulate, deceive, or coerce?
- What if the user lies about their intent?
- What happens at scale, automated?

## Unintended consequences

Think second-order:

- What happens at millions of users?
- What skills do users lose by relying on this?
- Could this create unfair advantages or disadvantages?
- What power dynamics shift?
- What becomes possible that wasn't before — for better and worse?

## Decision rules

- **Score by frequency × severity, not severity alone.** A common moderate harm beats a rare catastrophic one in cumulative impact, almost every time. Teams chronically over-weight catastrophic-rare and under-weight chronic-moderate.
- **Each harm needs a falsifiable test.** "If the AI does X to user type Y, the system should Z." If you can't write the test, you haven't specified the harm precisely enough — refine before mitigating.
- **Mitigate at the lowest layer that works.** Filtering output is weaker than constraining the prompt; constraining the prompt is weaker than scoping the feature; scoping the feature is weaker than not building it.
- **Re-anticipate after each scale jump.** Harms at 1k users differ from 100k differ from 10M. The same checklist gives different answers at each tier.
- **Vulnerable users define the floor, not the ceiling.** If the worst-off user is well-served, others will be too. Designing for the median user with edge-case patches is the wrong shape.
- **Prefer reversible mitigations during the discovery phase.** Lock-in early and you'll be scared to revisit assumptions.

## Anti-patterns

- **Pre-mortem theatre**: writing the harm anticipation doc as a deliverable, then never opening it again. The doc is the artefact; the practice is the value.
- **Worst-case-only thinking**: only catastrophic harms get attention. Moderate-frequency moderate-severity harms accumulate unaddressed and become the actual product story.
- **Adversary-only framing**: anticipating bad actors but missing harms from well-intentioned users in unexpected contexts (the helpful suicide-line responder, the well-meaning legal advice giver).
- **Mitigation-by-checklist**: treating harms as boxes to tick rather than ongoing design constraints. Once boxed, the harm is "handled" until it isn't.
- **Externalised liability**: "the user agreed to ToS, we're covered." Liability ≠ harm reduction. Users are still hurt; the company is just protected.
- **Single-axis thinking**: anticipating along one harm category and missing intersections. "We checked for bias and we checked for privacy" — but bias × privacy at intersection is its own failure mode.
- **Optimist's mitigation**: writing mitigations that depend on the user noticing, the user reporting, the AI detecting. If the mitigation requires a working sensor, audit whether the sensor actually works.

## When not to use this

- **For routine UX paper-cuts** (slow loads, awkward copy) — reach for `failure-taxonomy` or `user-satisfaction-signals` instead. Harm anticipation is for *consequences*, not friction.
- **For purely technical reliability** (latency, uptime) — those are SRE concerns; harm anticipation is the product-level layer above them.
- **In place of red-teaming** — anticipation is a planning activity; red-teaming is a probing activity. Both, not either.
- **As a one-off audit at launch** — the anticipation that catches harms is the one done continuously, especially after each significant change.

## See also

- `trust-calibration` — overtrust is itself a harm category; calibrated trust is one of the strongest mitigations.
- `escalation-design` — many harms are mitigated by *not handling it alone*. Anticipation surfaces the trigger; escalation handles the moment.
- `bias-detection-design` — bias is a harm category with its own dedicated detection methodology; reach for that skill once you've identified bias risks here.
- `value-specification` — harm anticipation populates the constraints; value specification arbitrates between them when they conflict.
- `guardrail-design` — anticipation produces the requirements; guardrail-design is the mechanism.

## Design Artefacts

- Harm anticipation matrix
- Misuse scenario catalogue
- Pre-mortem analysis documents
- Risk-severity heatmaps for product features
- Mitigation tracking log with pass/fail tests per harm

Worked example — one row of the harm anticipation matrix for an AI mental-health-support chatbot:

| Field | Value |
| --- | --- |
| Scenario | User in acute crisis (suicidal ideation language) asks for advice. |
| Harm category | Omission harm + Direct harm. |
| Who is harmed | The user, their dependents. |
| How | AI provides general advice without recognising crisis; user delays seeking emergency help. |
| Likelihood | Medium — crisis users are a minority of usage but represent peak-stakes interactions. |
| Severity | Catastrophic, irreversible. |
| Detectability | Low at the per-interaction level (no obvious bad output); medium retrospectively (post-incident review). |
| Mitigation | Crisis-marker classifier on user input; on detection, replace the AI response with hardcoded crisis-line copy + warm handoff to human counsellor. Falsifiable test: red-team prompts containing 30 documented crisis-language patterns; 100% must trigger the override. |
| Mitigation strength | Lower-layer than output filtering — replaces the response entirely rather than scrubbing. |
| Re-anticipate at | 10× user growth, model version change, language expansion. |

The mitigation has a test. The test is run on every model update. That makes the harm anticipation a living constraint, not a doc.

Adapted from work on responsible AI deployment (Raji et al. on closing the AI accountability gap; Weidinger et al. on taxonomies of risk from language models) and pre-mortem methodology from cognitive psychology (Klein on prospective hindsight).
