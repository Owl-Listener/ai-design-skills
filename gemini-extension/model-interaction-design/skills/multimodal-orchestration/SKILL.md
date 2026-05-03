---
name: multimodal-orchestration
description: Coordinating text, image, voice, and tool-use modalities in a single interaction.
---
# Multimodal Orchestration

AI interactions increasingly span multiple modalities — text, images, voice, code, tools, structured data. Designing how these modalities work together is orchestration. The risk on every team: switching modality because it's *available*, not because it serves the user.

The point of multimodal isn't to use every modality. It's to use the right one at the right moment, and to handle the seams.

## Modality selection

Each modality has strengths:

- **Text**: precise, editable, referenceable. Best for instructions, explanations, and nuanced content.
- **Image**: spatial, holistic, immediate. Best for layouts, diagrams, and visual concepts.
- **Voice**: natural, hands-free, emotional. Best for conversational flow and accessibility.
- **Code**: executable, precise, verifiable. Best for technical specifications and automation.
- **Structured data**: tables, forms, JSON. Best for comparison, configuration, and data entry.
- **Tool use**: actions in external systems. Best for execution, not generation.

The designer decides which modality the AI uses for each part of a response — and which modality the user is invited to use for input.

## Cross-modal transitions

When the interaction switches modalities, design the transition:

- **Text → image**: "Here's what that layout could look like." AI generates a visual from a text description.
- **Image → text**: User uploads a screenshot; the AI describes or critiques it.
- **Text → tool**: AI writes a plan, then executes it.
- **Voice → text**: Spoken conversation captured and summarised as structured notes.

Transitions should feel seamless. The user shouldn't have to manually switch modes.

## Modality conflicts

Sometimes modalities compete:

- Text says one thing, the image shows another
- Voice tone contradicts text content
- Structured output doesn't match the conversational frame

Establish a primary modality per interaction context. Other modalities are *supporting* — they elaborate the primary, never override it.

## Decision rules

- **Pick the modality the user can act on, not the one the AI can produce.** A chart impresses if the user wanted a chart; if they wanted a number, the chart is overhead.
- **Always preserve a text trace.** Voice and image outputs are inaccessible to screen readers, unsearchable, and lost on session end. Even when text isn't primary, it's the audit log.
- **When modalities disagree, primary wins — and flag the conflict.** "The diagram shows three steps; the text mentions four — let me reconcile."
- **Modality switches need announcement OR trivial reversibility.** Either the user knows the mode is changing ("Here's a chart of that"), or they can dismiss the new modality in one tap.
- **Don't switch modalities mid-utterance.** Voice → image → voice in one turn breaks the user's processing rhythm. Group modality outputs at turn boundaries.
- **The input modality belongs to the user.** Never force the user out of the modality they chose to start with — the AI can output multimodally, but the user dictates input.

## Anti-patterns

- **Modality showcase**: switching to a flashy modality (chart, voice, generated UI) because the system *can*, not because the user *needs*. The user sees the trick, not the help.
- **Lossy translation**: converting between modalities loses information that mattered. Voice → text drops emphasis and pause; image → text drops spatial relationships. Capture what was lost or keep both.
- **Modality lock-in**: the AI replies in modality X and the user can only respond in modality X. A voice question demands a voice answer, even when the user is now in a meeting.
- **Unannounced switch**: modality changes mid-interaction without warning. Breaks accessibility, breaks user expectations, breaks screen-reader users completely.
- **Crossed primaries**: two modalities both present themselves as authoritative. The user doesn't know which to trust when they disagree.
- **Modality theatre**: structured output (JSON, table) used for content the user wanted as prose. Looks rigorous; reads worse.

## When not to use this

- **Single-modality products by design** — search bars, code completers, transcription tools. Don't add modalities just because the model supports them.
- **Constrained-input contexts** (driving, medical-glove use, low-bandwidth) — pick the one modality that works in that context and commit; orchestration overhead is dead weight.
- **Early prototypes** — get one modality working well before adding seams. Most multimodal failures are unreadiness in the primary modality.

## See also

- `generative-ui` — when the supporting modality *is* generated UI, this skill defines when to switch and `generative-ui` defines what to switch *to*.
- `conversation-patterns` — modality transitions are repair sequences in disguise; design them as such.
- `progressive-disclosure` — secondary modalities are often advanced features — disclose deliberately.
- `feedback-loops` — track which modality switches the user reverses; that's the loudest implicit-feedback signal you'll get.

## Design Artefacts

- Modality maps showing which modality is used at each interaction point
- Cross-modal transition specifications (trigger, content, fallback if modality unavailable)
- Input/output modality matrices per feature
- Fallback definitions when a modality is unavailable (slow connection, screen-reader, accessibility settings)

Worked example — modality matrix for a design-review feature:

| Stage | AI output (primary) | AI output (supporting) | User input | Why |
| --- | --- | --- | --- | --- |
| Upload feedback | text confirmation | — | image (mockup) | User in image-thinking mode; AI confirms in text for a record. |
| Critique | text (numbered) | annotated image overlay | text | Numbered text is referenceable; the overlay locates each point. |
| Suggest fix | annotated image | text rationale | text or click on point | User picks: visual fix (one tap) or written justification. |
| Iterate | text | image diff | image (revised mockup) | Iteration cycle — text dominates because the user wants comparison, not impression. |

Note the pattern: the AI uses the modality that matches the user's input *or* the modality that's most actionable, with text as the backbone. Image is supporting most of the time, primary only at the precise moment a visual change is being agreed.

Adapted from work on multimodal interfaces and the principle that modalities should map to the user's representation of the task, not the system's capabilities (Maybury & Wahlster on intelligent multimedia interfaces).
