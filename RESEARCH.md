# Research to Practice

`REFERENCES.md` lists the papers and resources that informed this collection. This document goes one level deeper: it makes the *translation* explicit.

For researchers studying the gap between HCI scholarship and practitioner tools, this mapping shows exactly what happens when an academic concept becomes a skill a designer can load into a coding agent. Some concepts transfer almost intact — a taxonomy becomes a decision guide, a pattern language becomes a spec format. Others require significant reframing: engineering-oriented research gets recast as design problems, multi-author frameworks get distilled into opinionated single-practitioner tools.

For practitioners, this lets you trace any skill back to its source — useful when you want to read more deeply, or when you need to justify a design decision by citing the underlying research.

---

## The Translation Framework

Academic HCI and AI safety research typically frames problems as:
- **Descriptive taxonomies** — categorising observed behaviour across systems
- **Empirical findings** — measuring what affects user outcomes in controlled studies
- **Theoretical frameworks** — abstract models of interaction, alignment, or system behaviour

Practitioner skills need to be:
- **Prescriptive** — telling the designer what to do, not just what exists
- **Artefact-grounded** — producing named, concrete outputs a team can review and ship
- **Decision-oriented** — resolving tradeoffs rather than cataloguing them

The translations here involve one or more of these moves:

| Move | Description |
|---|---|
| **Operationalisation** | Converting a descriptive category into a design decision ("AI-driven mode" → "when should the AI take initiative?") |
| **Artefact creation** | Converting abstract concepts into named outputs ("persona components" → persona specification document, voice guide, anti-persona definition) |
| **Vocabulary adoption** | Bringing academic terms into practitioner use (*mixed-initiative*, *harm anticipation*, *escalation design*) |
| **Problem reframing** | Restating an engineering question as a design question ("how do LLMs handle tone?" → "how does a designer specify and test tone?") |
| **Selective synthesis** | Where multiple papers contribute to one skill, combining their contributions into a single coherent framework |

---

## Paper-by-Paper Mappings

### Human-AI Interaction Design

#### Gao et al. (2024) — *A Taxonomy for Human-LLM Interaction Modes*

**Core contribution.** Defines four interaction modes (conversation, collaboration, delegation, exploration) and four phases (orientation, elaboration, confirmation, closure) based on empirical analysis of human-LLM usage patterns. A descriptive taxonomy: it categorises what already happens across diverse deployments.

**Translation moves.** The four modes are collapsed into an *initiative spectrum* — a design continuum from user-driven to AI-driven — because practitioners need to make a concrete decision about who leads at any moment, not classify an existing system. The four phases are reframed as handoff trigger design: when does control shift, and what makes that shift smooth or jarring? The academic framing is descriptive ("users exhibit delegation behaviour when..."); the skill framing is prescriptive ("design explicit handoff moments or implicit affordances").

**Translation type.** Operationalisation + artefact creation.

**Vocabulary adopted.** *Mixed-initiative*, *delegation*, *initiative spectrum*

**Skills informed.**
- [`mixed-initiative-flow`](./skills/model-interaction-design/mixed-initiative-flow/SKILL.md) — The initiative spectrum and handoff anatomy derive directly from the taxonomy's modes. The "negotiated handoff" and "forced handoff" types operationalise transitions between modes.
- [`conversation-patterns`](./skills/model-interaction-design/conversation-patterns/SKILL.md) — The four interaction phases map to conversation structure archetypes.
- [`progressive-disclosure`](./skills/model-interaction-design/progressive-disclosure/SKILL.md) — The exploration mode informs the design of staged capability revelation.

---

### AI Alignment and Safety

#### Biswas & Talukdar (2026) — *Designing Alignment Guardrails for AI-Facing Products*

**Core contribution.** A multi-stakeholder framework for translating organisational values into implementable AI constraints. Key finding: values stated at the organisational level ("be helpful," "be responsible") are systematically under-specified for system implementation and produce conflicting rules when operationalised naively.

**Translation moves.** The multi-stakeholder framework becomes a design workflow (stakeholder alignment matrix, value hierarchy with explicit conflict resolution rules). The finding about value under-specification becomes the central design problem in `value-specification`: how to derive concrete, testable rules from abstract principles. The "implementable constraints" framing carries over almost intact into `guardrail-design`'s specification table format (rule | rationale | user experience | edge cases | override conditions).

**Translation type.** Artefact creation + vocabulary adoption.

**Vocabulary adopted.** *Guardrail*, *value specification*, *escalation*, *multi-stakeholder*

**Skills informed.**
- [`guardrail-design`](./skills/ai-alignment-reasoning/guardrail-design/SKILL.md) — Guardrail category taxonomy (content, action, tone, scope, confidence) and the specification table implement the paper's constraint framework.
- [`value-specification`](./skills/ai-alignment-reasoning/value-specification/SKILL.md) — The value hierarchy and conflict resolution rules directly operationalise the multi-stakeholder framework.
- [`escalation-design`](./skills/ai-alignment-reasoning/escalation-design/SKILL.md) — The paper's concept of unresolvable constraint conflicts becomes the trigger condition for escalation path design.
- [`harm-anticipation`](./skills/ai-alignment-reasoning/harm-anticipation/SKILL.md) — The multi-stakeholder framing informs harm scope: harms are considered across users, operators, and third parties, not just direct users.

---

#### Chua et al. (2024) — *User-Centred AI Safety*

**Core contribution.** Empirical study of how non-expert users understand and exercise control over AI systems. Identifies transparency and control as the two primary mechanisms for appropriate trust calibration. Finds that transparency interventions are only effective when matched to the user's expertise level and the stakes of the decision.

**Translation moves.** The finding about expertise-matched transparency becomes a calibration framework — not a single transparency pattern, but a tiered set keyed to user expertise and task stakes. The "control mechanisms" concept becomes a taxonomy of consent and agency design patterns with concrete interaction implementations. The paper's focus on non-expert users keeps the skills oriented toward practitioners designing for general populations.

**Translation type.** Operationalisation + selective synthesis.

**Vocabulary adopted.** *Transparency patterns*, *consent*, *trust calibration*, *confidence indicators*

**Skills informed.**
- [`transparency-patterns`](./skills/ai-alignment-reasoning/transparency-patterns/SKILL.md) — The tiered calibration framework (user expertise × task stakes) is the core design decision structure. The pattern taxonomy implements the paper's control mechanisms as named design options.
- [`consent-and-agency`](./skills/ai-alignment-reasoning/consent-and-agency/SKILL.md) — "User control" is operationalised as an interaction design problem: what affordances let non-expert users meaningfully exercise consent?
- [`trust-calibration`](./skills/ai-alignment-reasoning/trust-calibration/SKILL.md) — The trust calibration finding (neither too much nor too little) becomes the design target, with both over-trust and under-trust treated as failure modes.
- [`bias-detection-design`](./skills/ai-alignment-reasoning/bias-detection-design/SKILL.md) — Indirectly: the paper's attention to fairness for non-expert populations shapes the bias audit scope.

---

#### Zheng et al. (2025) — *Alignment at Scale*

**Core contribution.** Governance patterns for deploying aligned AI in consumer products at scale — covering policy mechanisms, monitoring, and enforcement across large user populations where per-user review is infeasible.

**Translation moves.** Governance mechanisms become system-level design decisions that practitioners can own alongside engineers: what to log, what to monitor, how to structure escalation tiers. The "at scale" framing shifts the design posture from individual interaction to systemic pattern — which is the lens `harm-anticipation` uses.

**Skills informed.**
- [`harm-anticipation`](./skills/ai-alignment-reasoning/harm-anticipation/SKILL.md) — Population-scale harm framing: anticipating harms that only emerge when a system is used at scale and by diverse populations.

---

### System Behavior and Persona Design

#### Schreiber, White & Schmidt (2024) — *A Pattern Language for Persona-Based Interactions with LLMs*

**Core contribution.** Applies Alexander's pattern language methodology to AI persona design: each pattern has a context, problem, and solution, and patterns interrelate. Documents reusable patterns for defining AI character, voice, and behavioural rules in LLM system prompts.

**Translation moves.** The formal pattern language structure (context–problem–solution) is retained in spirit but flattened for speed: skills use component lists rather than formal patterns because practitioners need fast references, not architectural blueprints. The paper's emphasis on *pattern interrelation* — that character, voice, and boundary patterns must be mutually consistent — becomes the anti-persona concept: explicitly defining what the persona is NOT as a consistency enforcement mechanism.

**Translation type.** Artefact creation + vocabulary adoption.

**Vocabulary adopted.** *Persona architecture*, *behavioral consistency*, *voice guide*, *knowledge stance*, *relationship model*, *anti-persona*

**Skills informed.**
- [`persona-architecture`](./skills/system-behavior-shaping/persona-architecture/SKILL.md) — The five-component framework (character traits, voice, knowledge stance, relationship model, boundaries) operationalises the paper's pattern set into a single specification document format.
- [`behavioral-consistency`](./skills/system-behavior-shaping/behavioral-consistency/SKILL.md) — The pattern interrelation requirement becomes the design problem of maintaining coherent persona across varied contexts and edge cases.

---

#### Sorokin (2025) — *Behavioral Prompting*

**Core contribution.** Systematic study of how prompt design elements affect AI tone, register, and emotional response. Documents techniques — vocabulary seeding, stance framing, affect labelling — and their measurable effects on output characteristics across diverse task types.

**Translation moves.** Laboratory techniques become production design artefacts: a tone calibration matrix (contextual tone targets by scenario type), a voice guide format, and emotional register specifications. The academic focus is on what *works experimentally*; the practitioner translation is on how to *specify and test* it consistently across a team.

**Translation type.** Artefact creation + problem reframing.

**Skills informed.**
- [`tone-calibration`](./skills/system-behavior-shaping/tone-calibration/SKILL.md) — The calibration matrix and contextual tone targets implement Sorokin's techniques as maintainable design documents rather than prompt experiments.
- [`emotional-design`](./skills/system-behavior-shaping/emotional-design/SKILL.md) — Affect labelling and emotional register concepts translate into design artefacts for AI products that need to respond appropriately to user emotional state.
- [`domain-voice`](./skills/system-behavior-shaping/domain-voice/SKILL.md) — Indirectly: vocabulary seeding techniques inform how domain-specific voice is specified and tested.

---

### Prompt Engineering and Architecture

#### Doyle (2024) — *LLMs as Method Actors*

**Core contribution.** Frames prompt design as performance direction — assigning role, backstory, stakes, and examples rather than issuing instructions. Argues that expert-behaviour elicitation is more effective when the prompt positions the model as *embodying* a role than when it states rules abstractly.

**Translation moves.** The "method actor" framing shapes how system prompts are structured: traits before rules, examples before directives. This becomes the structural convention in `system-prompt-structure`. The few-shot examples pattern inherits the paper's insight that examples *enact* the role better than descriptions of it — showing the AI what the persona does rather than telling it what the persona is.

**Translation type.** Vocabulary adoption + artefact creation.

**Skills informed.**
- [`system-prompt-structure`](./skills/prompt-architecture/system-prompt-structure/SKILL.md) — Persona-first, example-rich structure and the role-before-rules ordering convention implement the method actor framing.
- [`few-shot-patterns`](./skills/prompt-architecture/few-shot-patterns/SKILL.md) — The role-enactment insight informs example selection criteria: examples should demonstrate the persona in action, not just the output format.

---

#### Naser (2025) — *Chain-of-Thought and Beyond*

**Core contribution.** Systematic taxonomy of reasoning chain variants — linear, self-consistency, tree-of-thought, iterative critique — with empirical comparisons of when each variant produces more accurate or nuanced outputs.

**Translation moves.** The taxonomy becomes a selection guide: given a task type (complex reasoning, creative exploration, balanced analysis), which chain variant is appropriate? The academic emphasis on accuracy improvements translates into practitioner concerns: latency cost, verification difficulty, and suitability for production vs. exploratory contexts. A new "debate chain" variant is added that doesn't appear in the taxonomy but serves the balanced analysis use case practitioners need.

**Translation type.** Operationalisation + selective synthesis.

**Skills informed.**
- [`chain-of-thought-design`](./skills/prompt-architecture/chain-of-thought-design/SKILL.md) — The chain variant taxonomy (linear, branching, iterative, debate) maps from the paper, with production-oriented selection criteria and "when CoT hurts" guidance added for practitioners.

---

#### Guruge (2025) — *Prompt Architecture for Production Systems*

**Core contribution.** Engineering-oriented treatment of prompts as first-class system components: versioned, templated, tested, and deployed with the same rigour as code. Documents patterns for template systems, chain composition, and versioning strategies for production AI systems.

**Translation moves.** This is the least-reframed of the academic sources — the engineering patterns translate relatively directly because the skills are used by practitioners who also manage the technical implementation. The primary translation is from *engineer's concern* (system correctness, deployment safety) to *designer's concern* (artefact ownership, team collaboration, and handoff to engineering).

**Translation type.** Problem reframing.

**Skills informed.**
- [`template-design`](./skills/prompt-architecture/template-design/SKILL.md) — Template pattern formats and reuse patterns.
- [`constraint-specification`](./skills/prompt-architecture/constraint-specification/SKILL.md) — Constraint types and specification conventions adapted for designer-owned documents.
- [`prompt-versioning`](./skills/prompt-architecture/prompt-versioning/SKILL.md) — Version management and migration patterns.
- [`context-engineering`](./skills/prompt-architecture/context-engineering/SKILL.md) — Context budget and information architecture concepts.

---

### Multi-Agent Orchestration

#### Renney et al. (2026) — *Designing Human-Agent Handoffs*

**Core contribution.** Framework for handoff protocol design in collaborative AI systems. Identifies a five-element handoff anatomy (trigger, source, destination, payload, acknowledgment) and documents patterns for context transfer across agent boundaries.

**Translation moves.** The framework transfers almost directly: the five-element anatomy becomes the handoff protocol specification format. The academic emphasis on failure modes (context loss, abandoned handoffs) becomes the anti-pattern catalog with practitioner-facing names. The term "handoff" itself — which the paper coins for this domain — is adopted wholesale.

**Translation type.** Artefact creation + vocabulary adoption.

**Vocabulary adopted.** *Handoff*, *handoff anatomy*, *context payload*, *sequential/parallel/escalation handoff types*

**Skills informed.**
- [`handoff-protocols`](./skills/design-agent-orchestration/handoff-protocols/SKILL.md) — The five-element anatomy, handoff types, and context transfer strategies map directly from the paper's framework into a specification format.
- [`failure-recovery`](./skills/design-agent-orchestration/failure-recovery/SKILL.md) — Handoff failure modes (context cliff, black hole, echo chamber) become a diagnostic catalog for practitioners.

---

#### Zhou et al. (2026) — *Agent Role Specialisation in Multi-LLM Systems*

**Core contribution.** Empirical study of role design patterns in multi-LLM deployments. Identifies coordination failure modes that emerge specifically from role overlap, under-specification, and authority ambiguity between agents.

**Translation moves.** The role design patterns become a specification framework (role function, authority scope, inter-agent interface). The coordination failure modes become an anti-pattern catalog — failure modes that are useful to practitioners designing agent systems but weren't previously assembled in designer-accessible form.

**Translation type.** Artefact creation + selective synthesis.

**Skills informed.**
- [`agent-role-design`](./skills/design-agent-orchestration/agent-role-design/SKILL.md) — Role specification components (function, authority, interface) implement the paper's design patterns as a practitioner spec format.
- [`state-management`](./skills/design-agent-orchestration/state-management/SKILL.md) — The paper's coordination failure analysis informs shared-state design: what must agents share, and what must remain isolated.

---

#### Dibia (2025) — *Multi-Agent Design Patterns* (book)

**Core contribution.** Comprehensive practitioner-adjacent reference for agent orchestration: task decomposition strategies, human oversight models, observability patterns, and failure modes. More prescriptive than the empirical papers in this collection.

**Translation moves.** Being already practitioner-adjacent, this source transfers with less reframing. The primary translation is selecting which patterns belong to the *design layer* vs. the *engineering layer* — the skills here are scoped to decisions a designer can own, not implementation choices that require engineering context.

**Skills informed.**
- [`task-decomposition`](./skills/design-agent-orchestration/task-decomposition/SKILL.md) — Decomposition strategies and anti-patterns adapted for design-phase decision-making.
- [`human-in-the-loop`](./skills/design-agent-orchestration/human-in-the-loop/SKILL.md) — Intervention type taxonomy and graduated autonomy design.
- [`observability-design`](./skills/design-agent-orchestration/observability-design/SKILL.md) — Monitoring and observability patterns as design decisions rather than engineering implementations.

---

### Evaluation

#### Wang J. et al. (2024) — *LLM Evaluation Frameworks: A Systematic Review*

**Core contribution.** Survey of quality metrics and benchmarking approaches across LLM evaluation research. Identifies dimensions most consistently evaluated (accuracy, relevance, coherence, safety) and documents methodological divergences across benchmarking approaches.

**Translation moves.** The dimension taxonomy becomes a rubric-building framework — not just a list of dimensions, but a method for building rubrics with weighted dimensions and anchor examples. The methodological divergences across the literature become calibration guidance: different evaluators score inconsistently because rubrics are under-specified, and the fix is anchor examples and calibration sessions before each evaluation round.

**Translation type.** Artefact creation + operationalisation.

**Skills informed.**
- [`output-quality-rubrics`](./skills/evaluation/output-quality-rubrics/SKILL.md) — Dimension taxonomy (accuracy, relevance, completeness, helpfulness, clarity, tone appropriateness, safety) and rubric-building methodology with calibration protocols.
- [`comparative-evaluation`](./skills/evaluation/comparative-evaluation/SKILL.md) — Evaluation methodology and benchmark design patterns adapted for product teams rather than research teams.

---

#### Wang Y. et al. (2024) — *Task Success vs. Output Quality*

**Core contribution.** Empirical finding that task success and output quality diverge significantly in human-AI collaborative work. High output quality does not predict high task success, and teams measuring only output quality miss the most important performance signal for user-facing AI products.

**Translation moves.** The divergence finding becomes a design principle with direct artefact implications: every evaluation framework needs both metric types, and they need separate instrumentation. When they tell different stories, the divergence itself is diagnostic. The paper's finding that user satisfaction correlates more strongly with task success than output quality reshapes what `user-satisfaction-signals` tracks.

**Translation type.** Problem reframing + operationalisation.

**Skills informed.**
- [`task-success-metrics`](./skills/evaluation/task-success-metrics/SKILL.md) — Task completion rate, abandonment rate, and intervention rate metrics operationalise the paper's task success concept with direct measurement methods.
- [`user-satisfaction-signals`](./skills/evaluation/user-satisfaction-signals/SKILL.md) — The paper's satisfaction–task-success correlation shapes which signals to instrument and how to interpret them.

---

#### Mertsiotaki et al. (2025) — *Longitudinal Evaluation of AI Products*

**Core contribution.** Methods for detecting model drift, quality degradation, and emergent failures in AI products over time. Argues that cross-sectional evaluation misses temporal failure patterns that only become visible with longitudinal measurement — particularly failures that emerge from usage pattern shifts or model updates rather than from initial deployment conditions.

**Translation moves.** Drift detection methods become monitoring design artefacts (dashboard specifications, alert threshold design). The "emergent failure" concept — failures absent at launch that emerge from usage patterns or model updates — becomes the design motivation for the logging and trending infrastructure that `failure-taxonomy` calls for.

**Translation type.** Artefact creation + vocabulary adoption.

**Vocabulary adopted.** *Drift*, *degradation*, *emergent failure*, *longitudinal measurement*

**Skills informed.**
- [`longitudinal-measurement`](./skills/evaluation/longitudinal-measurement/SKILL.md) — Drift detection methods and measurement cadence patterns become practitioner artefacts (monitoring dashboards, quality trend specifications).
- [`failure-taxonomy`](./skills/evaluation/failure-taxonomy/SKILL.md) — The temporal dimension of failures informs how the taxonomy is used for trend analysis — not just incident classification, but surfacing patterns that indicate systemic degradation.

---

## Skills Without Direct Paper Attribution

Several skills draw primarily from practitioner synthesis, classical HCI literature, or Google PAIR / NNGroup practitioner research rather than the academic papers documented above. These are not less rigorous — they represent the practitioner knowledge layer, the implementation-tested conventions that don't yet have systematic academic treatment.

| Skill | Plugin | Primary basis |
|---|---|---|
| `heuristic-evaluation-ai` | evaluation | Nielsen's 10 heuristics (1994) adapted for AI; practitioner synthesis |
| `context-window-design` | model-interaction-design | Engineering documentation and practitioner patterns |
| `generative-ui` | model-interaction-design | NNGroup practitioner research (March 2026) |
| `multimodal-orchestration` | model-interaction-design | Practitioner synthesis |
| `frustration-detection` | model-interaction-design | Practitioner synthesis |
| `domain-voice` | system-behavior-shaping | Sorokin (2025) indirectly; practitioner synthesis |
| `cultural-adaptation` | system-behavior-shaping | Practitioner synthesis |
| `error-personality` | system-behavior-shaping | PAIR Guidebook (errors + graceful failures chapter) |
| `feedback-loops` | model-interaction-design | PAIR Guidebook (feedback + controls chapter) |

This is a useful signal for researchers: these are the skills where practitioner knowledge has outpaced academic formalisation. They represent areas where empirical study of practitioner conventions would be genuinely novel.

---

## Cross-Reference Index

Skills to papers, for tracing any skill back to its research foundation.

| Skill | Plugin | Paper(s) |
|---|---|---|
| `mixed-initiative-flow` | model-interaction-design | Gao et al. (2024) |
| `conversation-patterns` | model-interaction-design | Gao et al. (2024) |
| `progressive-disclosure` | model-interaction-design | Gao et al. (2024) — indirect |
| `feedback-loops` | model-interaction-design | PAIR Guidebook |
| `frustration-detection` | model-interaction-design | Practitioner synthesis |
| `context-window-design` | model-interaction-design | Engineering patterns |
| `generative-ui` | model-interaction-design | NNGroup (2026) |
| `multimodal-orchestration` | model-interaction-design | Practitioner synthesis |
| `guardrail-design` | ai-alignment-reasoning | Biswas & Talukdar (2026) |
| `value-specification` | ai-alignment-reasoning | Biswas & Talukdar (2026) |
| `escalation-design` | ai-alignment-reasoning | Biswas & Talukdar (2026) |
| `harm-anticipation` | ai-alignment-reasoning | Biswas & Talukdar (2026); Zheng et al. (2025) |
| `transparency-patterns` | ai-alignment-reasoning | Chua et al. (2024) |
| `consent-and-agency` | ai-alignment-reasoning | Chua et al. (2024) |
| `trust-calibration` | ai-alignment-reasoning | Chua et al. (2024) |
| `bias-detection-design` | ai-alignment-reasoning | Chua et al. (2024) — indirect |
| `persona-architecture` | system-behavior-shaping | Schreiber et al. (2024) |
| `behavioral-consistency` | system-behavior-shaping | Schreiber et al. (2024) |
| `tone-calibration` | system-behavior-shaping | Sorokin (2025) |
| `emotional-design` | system-behavior-shaping | Sorokin (2025) |
| `domain-voice` | system-behavior-shaping | Sorokin (2025) — indirect |
| `cultural-adaptation` | system-behavior-shaping | Practitioner synthesis |
| `error-personality` | system-behavior-shaping | PAIR Guidebook |
| `output-quality-rubrics` | evaluation | Wang J. et al. (2024) |
| `comparative-evaluation` | evaluation | Wang J. et al. (2024) |
| `task-success-metrics` | evaluation | Wang Y. et al. (2024) |
| `user-satisfaction-signals` | evaluation | Wang Y. et al. (2024) |
| `longitudinal-measurement` | evaluation | Mertsiotaki et al. (2025) |
| `failure-taxonomy` | evaluation | Mertsiotaki et al. (2025); Wang J. et al. (2024) |
| `heuristic-evaluation-ai` | evaluation | Nielsen (1994) adapted; practitioner synthesis |
| `handoff-protocols` | design-agent-orchestration | Renney et al. (2026) |
| `failure-recovery` | design-agent-orchestration | Renney et al. (2026) |
| `agent-role-design` | design-agent-orchestration | Zhou et al. (2026) |
| `state-management` | design-agent-orchestration | Zhou et al. (2026) |
| `task-decomposition` | design-agent-orchestration | Dibia (2025) |
| `human-in-the-loop` | design-agent-orchestration | Dibia (2025) |
| `observability-design` | design-agent-orchestration | Dibia (2025) |
| `system-prompt-structure` | prompt-architecture | Doyle (2024) |
| `few-shot-patterns` | prompt-architecture | Doyle (2024) |
| `chain-of-thought-design` | prompt-architecture | Naser (2025) |
| `template-design` | prompt-architecture | Guruge (2025) |
| `constraint-specification` | prompt-architecture | Guruge (2025) |
| `prompt-versioning` | prompt-architecture | Guruge (2025) |
| `context-engineering` | prompt-architecture | Guruge (2025) — indirect |
