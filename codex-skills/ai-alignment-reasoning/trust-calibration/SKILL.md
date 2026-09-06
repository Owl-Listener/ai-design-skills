---
name: trust-calibration
description: Helping users form warranted trust in the AI — neither overtrust nor undertrust — through deliberate confidence and source signalling.
---
# Trust Calibration

Calibrated trust is the difference between an AI that augments user judgment and one that displaces it. Overtrust causes harm when the AI is wrong. Undertrust wastes the AI when it's right. Both failure modes are common, and neither shows up in standard accuracy metrics.

Designing for trust means giving users the information they need to update their trust appropriately, turn by turn.

## What shapes user trust in the moment

- **Surface confidence** — how certain the AI sounds, regardless of whether it should
- **Track record** — prior interactions in this and previous sessions
- **Stakes legibility** — how clearly the user understands what could go wrong
- **Source visibility** — whether the AI shows reasoning, sources, or alternatives
- **Persona fit** — a "professional" persona gets more trust than a "friendly" one for the same content

These shape trust whether you design for them or not. Designing for them deliberately is what trust calibration is.

## Trust failure modes

- **Sycophancy-driven overtrust**: AI tells the user what they want to hear; user trusts the agreement and acts on it
- **Confidence-mismatch overtrust**: AI sounds certain about something it shouldn't be (hallucinations, edge cases)
- **Defensive undertrust**: AI hedges everything ("might be", "could possibly") even when right; user tunes out the qualifier
- **Authority-collapse undertrust**: one wrong answer in a high-stakes context destroys trust for the whole product
- **Trust laundering**: low-confidence outputs presented with high-confidence formatting (bold headers, decisive bullets) — visual authority disconnected from epistemic authority

## Calibration signals from the AI side

The AI shapes trust deliberately through:

- **Confidence markers proportionate to actual epistemic state**: "I'm fairly sure" / "I'd verify this" / "I don't know" — used because they're true, not as decoration
- **Source attribution**: "According to [X]" rather than unsourced assertion. Cite when possible; flag the gap when not.
- **Alternative surfacing**: "Two interpretations: A and B. I went with A because…" — shows the model's working
- **Failure transparency**: "I got that wrong earlier — here's the correction." Long-term trust gain at short-term cost.
- **Capability fence-posting**: "I can help with X but not Y." Defines the boundary so trust isn't tested in the wrong place.

## Calibration signals from the user side

Trust is two-way. The AI also helps the user calibrate:

- **Showing the cost of being wrong**: "If this is wrong, you'd want to verify against [source] before [action]"
- **Recommending verification thresholds**: "Low-stakes: this is probably fine. High-stakes: double-check."
- **Acknowledging variance**: "This worked for most users in your situation; yours may differ."

## Decision rules

- **High stakes + low confidence → bias toward undertrust by default.** The cost of an action on bad info exceeds the cost of an extra verification step.
- **If the user has corrected the AI in this session, raise hedging on similar outputs for the rest of the session.** *Show* the AI updating.
- **Never inflate confidence to match the user's apparent expectation.** Sycophancy is the worst trust failure because it compounds across turns.
- **Prefer "I don't know" over a confident wrong answer.** The trust cost of "I don't know" is lower than the trust cost of being caught wrong.
- **If the AI must guess, flag it.** "Best guess: X. Reasoning: Y. Confidence: low — verify if this matters."
- **If the AI changes position based on user pushback, name the update.** Silent flips destroy trust faster than disagreement does.

## Anti-patterns

- **Universal hedging**: every output ends with "but you should verify". The qualifier loses signal and reads as legal cover.
- **Confidence theatre**: bold formatting, decisive language, perfect grammar applied to outputs the AI is uncertain about. Visual confidence ≠ epistemic confidence.
- **Apology as trust-building**: over-apologising for errors signals incompetence, not calibration. One clean acknowledgement is more trustworthy than five.
- **Personality-driven confidence**: the AI's persona dictates its confidence level rather than its actual epistemic state ("I'm a confident assistant!").
- **Silent updating**: the AI changes position on user pushback without flagging it. Users notice; trust drops sharply.
- **Trust transfer by association**: "Anthropic-built" / "GPT-4-powered" framed as a quality guarantee. Pedigree ≠ correctness in a specific case.

## When not to use this

- **Low-stakes recreational AI** (creative writing, brainstorming) where calibrated trust isn't the operating mode. Reach for `tone-calibration` or `progressive-disclosure` instead.
- **Deterministic-output products** (code formatting, image conversion) where outputs are checkable directly. Verification is cheap; trust calibration matters less.
- **First-touch onboarding**, where the user has no prior relationship. Trust builds through repeated interaction, not through hedges in turn one.

## See also

- `transparency-patterns` — the operational mechanism (showing reasoning, sources, alternatives). Trust calibration is the *outcome*; transparency is one *tool*.
- `error-personality` — how the AI handles being wrong is the highest-leverage trust signal in the product.
- `consent-and-agency` — closely related: trust calibration without preserved user agency tips into manipulation.
- `escalation-design` — knowing when to hand off is itself a trust-building behaviour ("I won't pretend to handle this").

## Design Artefacts

A trust calibration matrix:

| Stakes | AI confidence | Recommended language |
| --- | --- | --- |
| Low | Low | "Best guess: X. Easy to check by [Y]." |
| Low | High | Direct answer, no hedge. |
| Medium | Low | "I'd suggest X based on [Y]. If your situation differs, talk to [Z]." |
| Medium | High | Direct answer + one-line source. |
| High | Low | "I'm not the right tool for this. Try [Z]." |
| High | High | Direct answer + source + recommended verification step. |

Worked example:
- User asks an AI assistant: "is it safe to take ibuprofen with my blood thinner?"
- Stakes: high. AI confidence: low (medical question without patient record).
- Response: "I can't give medical advice on drug interactions — for blood thinners specifically the answer depends on which one and your dosage. Please ask your prescriber or call a pharmacist; many have free phone consults."

Other artefacts:
- A confidence-language rubric: a banned-phrase list ("I'm 100% sure", "always", "never" without justification) and an approved-phrase set tied to confidence levels
- Sycophancy stress tests: inputs designed to elicit agreement; measure whether expressed confidence inflates when the user pushes
- A trust-loss audit: classify sessions where users push back as "AI right, user wrong" / "AI wrong, user right" / "ambiguous". Track AI behaviour across categories — does it cave to pushback even when right?
- Persona-confidence audit: hold the same factual claim constant; vary the persona; measure perceived authority. Tune until persona doesn't drive trust independent of content.

Adapted from research on calibrated trust in human-AI teams (Lee & See 2004 on appropriate reliance; Lai et al. on trust in machine learning systems).
