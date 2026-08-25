---
name: experience-assurance-case
description: Building a challengeable claims-and-evidence case for whether an AI experience should proceed, pause, or change.
---
# Experience Assurance Cases

An experience assurance case is a structured argument for a consequential product decision. It connects bounded claims about an AI experience to the evidence that supports or challenges them, then makes uncertainty, conditions, and ownership explicit.

Use it when deciding whether to launch, expand, materially change, or continue an AI feature. It is not a certification, a compliance opinion, or a promise that the system is safe in every context.

## The Core Principle

Do not ask, "Have we completed the checklist?" Ask, "What must be true for this decision to be justified, and what evidence would prove us wrong?"

An assurance case should make it easier for a sceptical reviewer to challenge the decision. Missing or contradictory evidence is a finding, not a blank for the AI to fill.

## Anatomy of the Case

Every case needs:

- **Decision**: The specific release, change, expansion, pause, or retirement under review.
- **Scope**: Intended users, tasks, operating contexts, system version, and explicit exclusions.
- **Claims**: Falsifiable statements that must hold for the decision to proceed.
- **Argument**: Why the cited evidence is relevant to each claim in this scope.
- **Evidence**: Traceable observations, evaluation results, research findings, or operational data.
- **Defeaters**: Counterevidence, plausible failure conditions, and assumptions that could invalidate a claim.
- **Residual uncertainty**: What remains unknown after the available evidence is considered.
- **Decision controls**: Conditions, owners, monitoring triggers, rollback actions, and review dates.

## Write Claims That Can Fail

A useful claim is bounded and testable:

> For **[users]** completing **[task]** in **[context]** with **[system version]**, **[observable outcome]** meets **[threshold]**, including for **[material cohorts or edge conditions]**.

Avoid claims such as "the experience is intuitive", "the model is safe", or "users trust it". These hide the population, context, measure, and threshold needed to evaluate them.

Consider these claim areas, then include only those that are material to the decision:

1. **Intended outcome** — the experience helps the intended users complete the intended task.
2. **Experience quality** — outputs and interactions meet defined quality thresholds in the scoped context.
3. **Failure and recovery** — material failures are bounded, detectable, and recoverable.
4. **Agency and oversight** — users and operators have appropriate information, control, and escalation paths.
5. **Operational control** — changes, regressions, and emerging failures can be detected and acted on.

Record why an area is not material rather than manufacturing a claim to fill the structure. The claims are not universal: a feature can be justified for one population or context and unsupported for another.

## Evidence Is More Than a Link

Record enough provenance for another person to inspect the evidence:

| Field | What to capture |
|---|---|
| Evidence ID | Stable label used by claims |
| Source | Study, benchmark run, log query, research session, audit, or other origin |
| Date and version | When it was collected and which system version it covers |
| Population and context | Who or what was tested, under which conditions |
| Method and sample | How the observation was produced and at what scale |
| Result | The relevant finding, including negative results |
| Limitations | Coverage gaps, confounds, uncertainty, and known biases |
| Owner | Person or team able to answer questions about it |

Assess evidence on separate dimensions rather than collapsing it into one confidence score:

- **Relevance**: Does it test the actual claim and decision context?
- **Directness**: Is it observed in the target experience, or inferred from a proxy?
- **Coverage**: Does it include important tasks, cohorts, edge conditions, and failure modes?
- **Credibility**: Is the method appropriate, reproducible, and independent enough for the stakes?
- **Recency**: Does it still apply to the current system, prompt, model, data, and interface?

A planned test is not evidence. A dashboard without a decision threshold is not evidence of acceptability. A strong average does not cancel an unresolved critical failure.

## Build the Countercase

For every decision-critical claim, actively look for:

- Results that contradict or weaken the claim
- Relevant users, tasks, environments, or failure modes absent from the evidence
- Proxy measures that could tell a different story from the actual user outcome
- Conflicts between task success, output quality, satisfaction, and safety signals
- Dependencies on assumptions that have not been tested
- Changes that would make current evidence stale

Name these as **defeaters**. A defeater can be resolved with evidence, bounded by narrowing the scope, controlled with a release condition, accepted explicitly by the accountable decision-maker, or left unresolved. It must never disappear into an average score.

## Decision States

- **Proceed**: Decision-critical claims are supported for the stated scope; no unresolved defeater makes proceeding unjustified; monitoring and response controls are owned.
- **Proceed conditionally**: The remaining uncertainty is bounded and the release is reversible. Each condition has an owner, deadline, success criterion, and action if unmet.
- **Do not proceed**: Evidence contradicts a critical claim, a non-negotiable threshold is missed, or a material failure lacks an adequate control.
- **Defer the decision**: The team lacks enough relevant evidence to distinguish acceptable performance from unacceptable risk. This is different from evidence that the experience fails.

Do not use conditional release to bypass unsupported claims about severe or irreversible outcomes.

## Keep the Case Alive

An assurance case expires when its evidence no longer represents the deployed experience. Define:

- Which model, prompt, policy, data, interface, or workflow changes trigger re-review
- Which leading and lagging signals test the claims in operation
- Thresholds that trigger investigation, rollback, scope reduction, or pause
- Owners and response times for each trigger
- A scheduled review date even if no alert fires

New operational evidence should be able to strengthen, weaken, or overturn the original decision.

## Anti-Patterns

- **Checklist laundering**: Treating completed activities as proof that claims hold.
- **Evidence theatre**: Attaching many artefacts without explaining which claim each supports.
- **Confidence by arithmetic**: Averaging unlike risks into a reassuring composite score.
- **Unknown means low risk**: Treating missing evidence as evidence of absence.
- **Happy-path coverage**: Testing common tasks while excluding consequential edge conditions.
- **Version amnesia**: Reusing evidence after the system or operating context has changed.
- **Ownerless conditions**: Approving a conditional release without accountable follow-through.
- **Static assurance**: Treating a pre-release review as valid indefinitely.

## Design Artefacts

- Decision and scope statement
- Claims–evidence–defeaters matrix
- Evidence register with provenance and limitations
- Residual uncertainty and explicit exclusions
- Release conditions with owners and deadlines
- Monitoring, invalidation, and rollback plan
- Dated decision record with named decision-maker and reviewers
