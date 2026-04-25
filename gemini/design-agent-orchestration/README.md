# design-agent-orchestration (Gemini CLI)

Design multi-agent systems, handoffs between AI agents, and human-in-the-loop workflows.

## Install

Clone the monorepo and install this extension from its local path:

```bash
git clone https://github.com/Owl-Listener/ai-design-skills
cd ai-design-skills
gemini extensions install ./gemini/design-agent-orchestration
```

For development, symlink instead:

```bash
gemini extensions link ./gemini/design-agent-orchestration
```

## Skills

| Skill | File |
|-------|------|
| agent-role-design | `skills/agent-role-design/SKILL.md` |
| failure-recovery | `skills/failure-recovery/SKILL.md` |
| handoff-protocols | `skills/handoff-protocols/SKILL.md` |
| human-in-the-loop | `skills/human-in-the-loop/SKILL.md` |
| observability-design | `skills/observability-design/SKILL.md` |
| state-management | `skills/state-management/SKILL.md` |
| task-decomposition | `skills/task-decomposition/SKILL.md` |

## Commands

Invoke from within Gemini CLI:

| Command | File |
|---------|------|
| `/design-agent-orchestration:design-oversight` | `commands/design-oversight.toml` |
| `/design-agent-orchestration:design-workflow` | `commands/design-workflow.toml` |
| `/design-agent-orchestration:map-agents` | `commands/map-agents.toml` |
