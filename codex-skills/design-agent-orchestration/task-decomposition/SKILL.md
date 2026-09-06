---
name: task-decomposition
description: Breaking complex user goals into subtasks that agents can handle.
---
# Task Decomposition
Users come with goals, not subtasks. Task decomposition is how a multi-agent system breaks a complex user goal into pieces that individual agents can handle — and then reassembles the results into something coherent.
## Decomposition Strategies
- **Sequential decomposition**: Break the goal into ordered steps. Step 1 must complete before Step 2 starts.
- **Parallel decomposition**: Break the goal into independent parts that can be worked on simultaneously.
- **Hierarchical decomposition**: Break the goal into sub-goals, then break each sub-goal into tasks.
- **Conditional decomposition**: The next step depends on the result of the current step. Different results lead to different paths.
- **Iterative decomposition**: Start with a rough version, then refine through multiple passes.
## Designing Decomposition Rules
For each type of user goal the system handles:
- **What's the entry point?** How does the system receive the goal?
- **What are the subtasks?** List all possible subtasks for this goal type.
- **What are the dependencies?** Which subtasks depend on others' outputs?
- **What's the critical path?** Which sequence of subtasks determines the minimum completion time?
- **What can be parallelised?** Which subtasks can run simultaneously?
- **What's the reassembly logic?** How do subtask results combine into the final output?
## Granularity
How finely to decompose matters:
- **Too coarse**: Single agents get tasks that are too complex, leading to lower quality
- **Too fine**: Overhead from handoffs exceeds the benefit of specialisation
- **Just right**: Each subtask matches one agent's sweet spot in terms of scope and complexity
## Handling Ambiguity
User goals are often ambiguous. The system needs to:
- **Clarify before decomposing**: Ask the user to specify when the goal is unclear
- **Decompose tentatively**: Start with a plan and adjust as information emerges
- **Recompose when needed**: If decomposition was wrong, restructure without starting over
## Design Artefacts
- Task decomposition trees for each goal type
- Dependency maps showing subtask relationships
- Parallelisation specifications
- Reassembly logic definitions
- Ambiguity handling protocols
