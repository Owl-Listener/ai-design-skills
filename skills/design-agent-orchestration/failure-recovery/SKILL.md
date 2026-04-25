---
name: failure-recovery
description: What happens when an agent fails — retry, fallback, escalate, or graceful degradation.
---
# Failure Recovery
Agents fail. Networks time out, models hallucinate, tools error, and edge cases surprise. Failure recovery design determines whether a failure becomes a dead end or a graceful detour.
## Failure Types in Multi-Agent Systems
- **Agent failure**: A single agent crashes, times out, or produces invalid output
- **Handoff failure**: Context is lost or corrupted during transfer between agents
- **Coordination failure**: Agents conflict, deadlock, or produce inconsistent results
- **Resource failure**: External tools, APIs, or data sources are unavailable
- **Cascading failure**: One agent's failure causes downstream agents to fail
## Recovery Strategies
- **Retry**: Try the same operation again. Works for transient errors (network timeouts, rate limits). Set a retry limit to avoid infinite loops.
- **Fallback**: Switch to an alternative approach. A different agent, a simpler method, or a cached result.
- **Escalation**: Pass the problem to a more capable agent or to a human. Used when the failure is beyond the current agent's ability to resolve.
- **Graceful degradation**: Deliver a partial result rather than nothing. Tell the user what worked and what didn't.
- **Compensation**: Undo the effects of a partially completed workflow before retrying or escalating.
## Designing Recovery Paths
For each point in the workflow where failure is possible:
- **What could fail?** List the failure modes
- **What's the first recovery strategy?** Usually retry for transient errors
- **What's the fallback?** If retry fails, what's the alternative?
- **When do you escalate?** After how many retries or what type of failure?
- **What does the user see?** Transparent about the failure or silently recovered?
- **What's the worst case?** If all recovery fails, what's the graceful degradation?
## User Experience of Failures
- **Invisible recovery**: The system retries or falls back without the user noticing. Best for minor, quickly resolved failures.
- **Transparent recovery**: The system tells the user something went wrong and how it's handling it. "This is taking longer than usual — trying an alternative approach."
- **Participatory recovery**: The system asks the user to help. "I couldn't access your calendar. Can you check the connection?"
- **Honest failure**: The system tells the user it can't complete the task and explains why. Offers alternatives.
## Design Artefacts
- Failure mode inventory per agent and per handoff
- Recovery strategy specifications (retry limits, fallback paths, escalation triggers)
- Cascading failure analysis
- User experience specifications for each failure scenario
- Recovery testing protocols
