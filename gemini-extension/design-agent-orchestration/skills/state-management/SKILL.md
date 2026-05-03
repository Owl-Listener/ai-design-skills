---
name: state-management
description: Managing shared context, memory, and state across multiple agents.
---
# State Management

In a multi-agent system, state is the shared truth about what's happened, what's in progress, and what's been decided. Without state management, agents work with stale or conflicting information — and the user pays the cost in repeated questions, contradictory answers, and lost progress.

State management is the *plumbing* skill of multi-agent design. Get it wrong and every other skill in this plugin gets harder.

## Types of state

- **Task state**: where the overall task is in its lifecycle. Which subtasks are complete, in progress, or pending.
- **Context state**: what each agent knows. What has been shared, summarised, or dropped.
- **User state**: preferences, history, and current emotional state.
- **Decision state**: decisions made, options considered, options rejected (and why).
- **Error state**: what has failed, been retried, been escalated.

## State architecture patterns

- **Centralised state**: one shared store all agents read from and write to. Simple, debuggable. Bottleneck risk at scale.
- **Distributed state**: each agent maintains its own state and syncs with others. Flexible. Consistency risk.
- **Event-sourced state**: state is built from a log of events. Every change is recorded. Auditable. Complex.
- **Blackboard pattern**: shared workspace where agents post results and read others' contributions. Good for collaborative problem-solving.

## Designing state for users

Users have expectations about what the system remembers:

- **Within-session state**: everything said in this conversation should persist consistently
- **Cross-session state**: preferences, decisions, and context from past sessions should carry forward
- **Cross-agent state**: if one agent learned something, other agents should know
- **User-controlled state**: users should be able to see, edit, and clear what the system remembers

## Decision rules

- **Default to centralised state.** Reach for distributed only when measured cross-agent latency is genuinely the bottleneck. Most teams choose distributed prematurely and pay in consistency bugs forever.
- **If a piece of state lives in a single agent's working memory, treat it as lost.** Memory across model invocations is unreliable; promote anything that needs to persist to the shared store.
- **Cross-session state requires explicit consent per category.** "Remember preferences" ≠ "remember what we discussed". Granularity is the design constraint, not a nice-to-have.
- **For state conflicts, prefer detection over silent merging.** A surfaced conflict the user resolves is recoverable; a silently merged inconsistency is invisible damage.
- **State a user can't see, they can't trust.** Any state used to personalise behaviour must be visible somewhere the user can find within ~30 s of UI navigation.

## Anti-patterns

- **The stale-context bug**: an agent acts on state that's been superseded by another agent. Hard to detect because the agent looks correct in isolation. Mitigated by versioning every read.
- **The one-source-of-truth fight**: two agents both claim authority over the same state slice. Resolution rules are vague. Last write wins, intermittently.
- **Implicit state**: state lives in an agent's prompt context rather than the shared store. Lost on restart, untransferable, undebuggable.
- **State sprawl**: schema grows unbounded as features accrete. After six months nobody knows what's used, what's dead, or what's load-bearing.
- **Sync deferral**: writes are batched for efficiency, then dropped on failure. The user sees "saved" but the state never made it.
- **Invisible personalisation**: state shapes behaviour the user can't see or override — drift toward manipulation.

## When not to use this

- **Single-agent products** — the model's context window *is* the state. Reach for `context-window-design` instead.
- **Stateless transactional features** (one-shot completions, image generation calls) — explicit state architecture adds overhead without benefit.
- **Prototype phase** — premature state architecture freezes choices that should still be loose. Use the simplest possible store, document decisions in `decision-state` only.

## See also

- `handoff-protocols` — context transfer between agents *uses* the state architecture; design them together.
- `observability-design` — state mutations are the most useful traces. Design what's logged at the same time as what's stored.
- `consent-and-agency` — cross-session and cross-agent state is consent-laden by default.
- `task-decomposition` — task-state schema is determined by the decomposition shape; co-design.

## Design Artefacts

- State architecture diagrams (centralised / distributed / event-sourced / blackboard)
- State schema definitions (what's stored, where, by whom, with what TTL)
- State lifecycle specifications (creation, update, archival, deletion)
- Conflict resolution rules per state slice
- User-facing state visibility and control designs

Worked example — task state for a multi-agent customer support flow:

```
{
  "task_id": "tk_8b2",
  "owner_agent": "router",                  // who currently holds the task
  "status": "in_progress | escalated | done",
  "subtasks": [
    {"id": "verify_account", "status": "done", "result_ref": "ctx_a91"},
    {"id": "check_refund_eligibility", "status": "in_progress", "owner": "billing_agent"}
  ],
  "user_state_ref": "us_482",               // pointer, not embedded copy
  "decisions": [
    {"at": "...", "by": "router", "choice": "billing_agent", "rejected": ["faq_agent"], "why": "intent: refund"}
  ],
  "errors": [],
  "version": 7                              // increments on every write; readers check before acting
}
```

The version field is the simplest defence against the stale-context bug. The `decisions` log with `rejected` makes the routing legible to humans during incident review.

Adapted from work on shared mental models in multi-agent systems and distributed-systems consistency literature (Lamport on logical clocks; the actor model on isolated state).
