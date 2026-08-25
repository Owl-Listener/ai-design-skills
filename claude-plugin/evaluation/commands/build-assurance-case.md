---
description: Build an evidence-backed case for whether an AI experience should proceed, proceed conditionally, stop, or await evidence.
argument-hint: "[AI experience and the release or change decision under review]"
---
You are building an experience assurance case for a consequential product decision. Use only skills from the evaluation plugin.

The purpose is decision support, not confidence generation. Do not invent evidence, results, thresholds, owners, or citations. Mark missing material as **not evidenced** and show how it affects the decision.

Before beginning, obtain the minimum information needed to define:

- The exact release, expansion, change, pause, or retirement decision
- Intended users, tasks, operating context, system version, and exclusions
- Decision owner and review participants
- Available evaluation results, research, operational data, risk work, and design specifications
- Any non-negotiable thresholds or constraints already agreed by the team

If these are missing, ask focused questions before constructing the case.

## Step 1: Bound the Decision

Using **experience-assurance-case**:

- Write one sentence stating the decision under review
- Record the in-scope users, tasks, contexts, system components, and version
- Record explicit exclusions and assumptions
- Describe reversibility: staged or full release, rollback capability, and consequences of being wrong
- Separate facts supplied by the user from your inferences and unresolved assumptions

## Step 2: Define Decision-Critical Claims

Write a small set of falsifiable claims that must hold for the decision to proceed. Consider each of these areas:

1. Intended user and task outcome
2. Output and interaction quality
3. Material failure detection and recovery
4. User agency and human oversight
5. Operational monitoring and response

Include an area only when it is material to the scoped decision; otherwise record briefly why it is not applicable. Do not manufacture a claim to fill the structure. For each included claim, specify the population, task, context, observable measure, and threshold. If the team has not agreed a threshold, mark it **threshold not agreed** rather than choosing one.

## Step 3: Build the Evidence Register

Inventory the evidence supplied. Give every item an ID and capture:

- Source, date, and system version
- Population, context, method, and sample
- Result, including negative and null findings
- Limitations, exclusions, and known conflicts
- Owner or provenance contact

Distinguish direct evidence from proxies and plans. A planned study, unrun benchmark, proposed dashboard, or uncited assertion is **not evidence**.

Assess relevance, directness, coverage, credibility, and recency separately. Do not turn them into a single evidence score.

## Step 4: Test the Claims Against the Evidence

Use the evaluation skills to interrogate, not merely summarise, the evidence:

- Using **task-success-metrics**, check whether users accomplish the actual task and whether results cover material cohorts and contexts.
- Using **output-quality-rubrics**, test quality claims against explicit dimensions, anchors, and thresholds.
- Using **failure-taxonomy**, examine frequency and severity separately; do not average critical failures into aggregate quality.
- Using **heuristic-evaluation-ai**, identify interaction conditions that can invalidate output-only results.
- Using **user-satisfaction-signals**, distinguish satisfaction from task success and note disagreement between signals.
- Using **comparative-evaluation**, verify claims of improvement against an appropriate baseline.
- Using **longitudinal-measurement**, check whether the evidence is stable enough to support the decision and what could make it stale.

For each claim, conclude **supported**, **partially supported**, **contradicted**, or **not evidenced**, followed by a concise rationale.

## Step 5: Construct the Countercase

For every decision-critical claim, identify:

- Counterevidence or conflicting signals
- Missing users, tasks, environments, or failure modes
- Untested assumptions and weak proxies
- Plausible conditions under which the claim would fail
- System or context changes that would invalidate the evidence

Record each as a defeater. State whether it is resolved, bounded by scope, controlled by a release condition, explicitly accepted, or unresolved.

## Step 6: Make the Decision

Choose exactly one state and explain why:

- **Proceed**: Critical claims are supported in scope, no unresolved defeater makes proceeding unjustified, and operational controls are owned.
- **Proceed conditionally**: Remaining uncertainty is bounded, release is reversible, and every condition has an owner, deadline, success criterion, and failure action.
- **Do not proceed**: A critical claim is contradicted, a non-negotiable threshold is missed, or a material failure lacks an adequate control.
- **Defer the decision**: Evidence is too weak or incomplete to justify proceeding or rejecting the experience.

Do not recommend conditional release where severe or irreversible outcomes depend on an unsupported claim.

## Step 7: Define Operational Invalidation

Using **longitudinal-measurement** and **failure-taxonomy**:

- Define the signals that will test each critical claim after release
- Set thresholds and review cadence only where the user provides or approves them
- Name the owner and response action for each trigger
- Specify which model, prompt, data, interface, policy, or workflow changes force re-review
- Set an expiry or review date for the case

## Output

Deliver an **Experience Assurance Case** with:

1. **Decision header** — state, decision owner, date, scope, version, and reversibility
2. **Decision rationale** — the shortest defensible explanation of the outcome
3. **Claims–evidence–defeaters matrix** — claim, threshold, evidence IDs, status, counterevidence, and unresolved uncertainty
4. **Evidence register** — provenance, method, result, limitations, and recency for every evidence item
5. **Conditions and actions** — owner, deadline, success criterion, and consequence if unmet
6. **Operational invalidation plan** — signals, triggers, actions, change events, and review date
7. **Explicit exclusions** — what this case does not establish

End with up to three genuine, decision-relevant evidence gaps. Do not add generic recommendations or fabricate a worked example.
