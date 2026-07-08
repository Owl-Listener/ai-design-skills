---
description: "Audit and optimise an existing agent across all six AXD design layers so no weakness goes unexamined."
agent: "agent"
argument-hint: "[the existing agent or agentic feature you are reviewing]"
---
You are reviewing an existing agent to optimise it. Unlike the single-plugin commands, this is a **cross-cutting audit**: it deliberately examines all six plugins so every design layer is inspected, not only the ones your phrasing happens to match. Requires all six plugins installed (`model-interaction-design`, `prompt-architecture`, `evaluation`, `ai-alignment-reasoning`, `design-agent-orchestration`, `system-behavior-shaping`).
Work the layers in dependency order and, for each, find what is missing, weak, or inconsistent. A layer that is genuinely solid still gets a line in the report saying so. Do not skip a layer — if it does not apply, state why.
Follow this process:
## Step 0: Establish Baseline
- What does the agent do today, and how do you know it is or is not working?
- What prompted this review (a complaint, a metric, a launch gate, general optimisation)?
- What are the stakes of its failures?
## Step 1: Foundation — Interaction
Using the **model-interaction-design** plugin (**conversation-patterns**, **mixed-initiative-flow**, **progressive-disclosure**, **context-window-design**, **feedback-loops**, **multimodal-orchestration**, **generative-ui**, **frustration-detection**):
- Where does the current interaction loop break down or frustrate users?
- Is initiative balanced, or does the agent over- or under-drive?
- Can users interrupt, correct, and recover easily?
## Step 2: Foundation — Prompt Architecture
Using the **prompt-architecture** plugin (**system-prompt-structure**, **constraint-specification**, **chain-of-thought-design**, **context-engineering**, **few-shot-patterns**, **template-design**, **prompt-versioning**):
- Audit the system prompt: unclear roles, missing constraints, weak output contract.
- Are constraints specified tightly enough to prevent the failures you see?
- Is prompt change tracked, or does it drift untested?
## Step 3: Failure Modes — Evaluation
Using the **evaluation** plugin (**failure-taxonomy**, **task-success-metrics**, **output-quality-rubrics**, **heuristic-evaluation-ai**, **comparative-evaluation**, **user-satisfaction-signals**, **longitudinal-measurement**):
- Is there a failure taxonomy, and does it match the failures observed in the wild?
- Are success metrics defined and actually measured?
- Run a heuristic evaluation against the current output.
## Step 4: Failure Modes — Alignment
Using the **ai-alignment-reasoning** plugin (**harm-anticipation**, **guardrail-design**, **value-specification**, **escalation-design**, **consent-and-agency**, **transparency-patterns**, **trust-calibration**, **bias-detection-design**):
- Which anticipated harms lack guardrails? Which guardrails are untested?
- Does the escalation path fire when it should?
- Is the agent transparent enough, and is trust calibrated to its real reliability?
## Step 5: Orchestration
Using the **design-agent-orchestration** plugin (**agent-role-design**, **task-decomposition**, **handoff-protocols**, **state-management**, **human-in-the-loop**, **failure-recovery**, **observability-design**):
- Is the role card still accurate, or has scope crept?
- Audit every handoff for lost context and every failure mode for missing recovery.
- Are human intervention points and observability adequate for the current stakes?
## Step 6: Voice
Using the **system-behavior-shaping** plugin (**persona-architecture**, **tone-calibration**, **error-personality**, **emotional-design**, **domain-voice**, **behavioural-consistency**, **cultural-adaptation**):
- Where does voice drift or contradict the persona?
- Does the error personality hold up under real failures, or does it grate?
## Step 7: Prioritise
- Collect every finding into one list.
- Rank by impact on users and stakes, then by effort to fix.
- Flag any finding in one layer that is actually caused by a weakness in another.
## Output
Deliver an agent optimisation report:
1. Baseline summary and review trigger
2. Per-layer findings (interaction, prompt, evaluation, alignment, orchestration, voice), each marked strong / weak / missing
3. Cross-layer root causes (findings whose real source sits in a different layer)
4. Prioritised remediation backlog (impact × effort)
5. A per-layer coverage checklist confirming every layer was inspected or explicitly deferred with a reason.
