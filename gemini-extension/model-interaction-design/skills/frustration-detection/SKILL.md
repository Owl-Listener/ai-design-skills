---
name: frustration-detection
description: Reading user emotional state from text signals — caps, punctuation density, repetition, latency — and adapting before the user disengages.
---
# Frustration Detection

Most AI products treat every user message as having the same emotional weight. They don't. "Cancel my subscription." and "PLEASE just cancel my subscription!!!" deserve different responses. Frustration detection is the perception skill that picks up the signal so the rest of the system can adapt.

This is the unnamed skill that sits behind tone calibration, escalation design, and graceful repair. Without it, those skills can't fire at the right moment.

## Signals

**Linguistic**
- Capitalisation shifts: ALL CAPS, sudden "PLEASE", "URGENT"
- Punctuation density: `?!?!`, `....`, multiple `!!`
- Hedge-stripping: terse, demand-form ("just fix it", "stop")
- Repetition: same concept restated across turns
- Profanity (mild or strong)

**Structural**
- Decreasing turn latency (rapid-fire replies)
- Increasing turn latency past a threshold (walk-away)
- Re-asking the same question after a response
- Explicit human-handoff request ("speak to a person")
- Sudden topic switches

**Lexical / affect**
- Negative affect words ("useless", "annoying", "broken")
- Time-pressure words ("now", "immediately", "deadline")
- Doubt words ("really?", "are you sure", "is that right")
- Disengagement words ("never mind", "forget it", "whatever", "fine")

Detection should be cumulative across signals and turns, not single-feature.

## Decision rules

- **One signal is noise; two is a pattern.** Don't act on a single CAPS message; act when CAPS plus repetition appear.
- **If frustration is rising AND the AI has already attempted a fix once, escalate.** Don't reach for a third rephrase.
- **Urgency without frustration ≠ frustration.** Speed up; don't change tone.
- **Long latency after a long AI response is a walk-away, not deep reading.** Save state, offer re-engagement, don't continue.
- **Adapt silently. Don't name the emotion.** "I sense you're frustrated" is patronising. Lower confidence, slow pace, raise warmth — but in the prose, not the meta-commentary.

## Anti-patterns

- **Emotion mirroring as performance**: "I'm so sorry to hear that!" reads as scripted at scale.
- **Asking the user to confirm their state**: "Are you frustrated?" The user came to get help, not be analysed.
- **One-shot detection**: a single signal triggers a full empathy cascade. Detection must be cumulative.
- **Detection without action**: reading the signal and continuing the same playbook makes the detection performative.
- **Over-empathy**: two paragraphs of validation where one sentence and a fix would do. A frustrated user has no bandwidth for warmth.

## When not to use this

- **Transactional UIs** (search box, code completion) — there's no conversational drift to read. Reach for `feedback-loops` instead.
- **First-turn cold starts** — detection is comparative; you need a baseline. Treat first-turn signals as descriptive, not diagnostic.
- **Products with explicit feedback controls** (thumbs down, "this isn't helping") — the user has the controls; don't bolt on inference.

## See also

- `tone-calibration` — what to do once you've detected the signal: lower confidence, slow pace, raise warmth.
- `escalation-design` — frustration is one of the documented escalation triggers; this skill is how you detect that trigger.
- `feedback-loops` — the cousin that handles ambient signals about *output quality*; this one handles ambient signals about *user state*.
- `harm-anticipation` — when frustration shades into distress (crisis markers, vulnerability), route through harm anticipation for elevated handling.

## Design Artefacts

A frustration scorecard, scored cumulatively per session:

| Signal | Weight |
| --- | --- |
| ALL CAPS message | +2 |
| Profanity | +3 |
| Repeated question (3rd+ time) | +2 |
| `!!` or `??` punctuation | +1 |
| Explicit handoff request | +5 |
| Disengagement word ("forget it") | +3 |
| Long latency (>3 min after AI response) | +2 |

Threshold for escalation: 5. Threshold for tone shift: 2.

Worked example:
- Turn 1: "hey can you help me cancel my order" → 0
- Turn 2: "the cancel button isn't working" → 0 (problem statement, not frustration)
- Turn 3: "i've tried 3 times PLEASE" → +4 (CAPS, repetition, "please") → score 4 → tone shift
- Turn 4: "this is USELESS" → +2 (CAPS) +3 (negative affect) → score 9 → escalate

Other artefacts:
- Per-product baseline: average frustration score across the last 1000 sessions; alert on 2σ deviation
- Latency thresholds calibrated per product (chat support: 30 s engaged / 2 min disengaged)
- Test scenarios: happy path, slow rise, sudden spike, silent walk-away, recovery (score drops mid-session after fix)

Adapted from work on affective computing in conversational systems (Picard; Bickmore on emotional dialogue agents).
