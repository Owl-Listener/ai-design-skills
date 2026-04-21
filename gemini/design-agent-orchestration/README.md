# design-agent-orchestration (Gemini CLI)

Design multi-agent systems, handoffs between AI agents, and human-in-the-loop workflows.

## Install

```bash
gemini extensions install https://github.com/Owl-Listener/ai-design-skills --path gemini/design-agent-orchestration
```

Or clone the repo and link locally:

```bash
gemini extensions link ./gemini/design-agent-orchestration
```

## Skills

| Skill | Location |
|-------|----------|
| agent-role-design | see `skills/agent-role-design/SKILL.md` |
| failure-recovery | see `skills/failure-recovery/SKILL.md` |
| handoff-protocols | see `skills/handoff-protocols/SKILL.md` |
| human-in-the-loop | see `skills/human-in-the-loop/SKILL.md` |
| observability-design | see `skills/observability-design/SKILL.md` |
| state-management | see `skills/state-management/SKILL.md` |
| task-decomposition | see `skills/task-decomposition/SKILL.md` |

## Commands

| Command | Location |
|---------|----------|
| `/design-agent-orchestration:design-oversight` | see `commands/design-oversight.toml` |
| `/design-agent-orchestration:design-workflow` | see `commands/design-workflow.toml` |
| `/design-agent-orchestration:map-agents` | see `commands/map-agents.toml` |
