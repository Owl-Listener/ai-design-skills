# evaluation (Gemini CLI)

Measure AI output quality, user satisfaction, task success, and design effectiveness.

## Install

Clone the monorepo and install this extension from its local path:

```bash
git clone https://github.com/Owl-Listener/ai-design-skills
cd ai-design-skills
gemini extensions install ./gemini-extension/evaluation
```

For development, symlink instead:

```bash
gemini extensions link ./gemini-extension/evaluation
```

## Skills

| Skill | File |
|-------|------|
| comparative-evaluation | `skills/comparative-evaluation/SKILL.md` |
| failure-taxonomy | `skills/failure-taxonomy/SKILL.md` |
| heuristic-evaluation-ai | `skills/heuristic-evaluation-ai/SKILL.md` |
| longitudinal-measurement | `skills/longitudinal-measurement/SKILL.md` |
| output-quality-rubrics | `skills/output-quality-rubrics/SKILL.md` |
| task-success-metrics | `skills/task-success-metrics/SKILL.md` |
| user-satisfaction-signals | `skills/user-satisfaction-signals/SKILL.md` |

## Commands

Invoke from within Gemini CLI:

| Command | File |
|---------|------|
| `/evaluation:create-rubric` | `commands/create-rubric.toml` |
| `/evaluation:design-benchmark` | `commands/design-benchmark.toml` |
| `/evaluation:run-evaluation` | `commands/run-evaluation.toml` |
