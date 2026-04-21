# model-interaction-design (Gemini CLI)

Design how humans and AI models communicate — conversation patterns, turn-taking, mixed-initiative flows, and generative UI.

## Install

Clone the monorepo and install this extension from its local path:

```bash
git clone https://github.com/Owl-Listener/ai-design-skills
cd ai-design-skills
gemini extensions install ./gemini/model-interaction-design
```

For development, symlink instead:

```bash
gemini extensions link ./gemini/model-interaction-design
```

## Skills

| Skill | File |
|-------|------|
| context-window-design | `skills/context-window-design/SKILL.md` |
| conversation-patterns | `skills/conversation-patterns/SKILL.md` |
| feedback-loops | `skills/feedback-loops/SKILL.md` |
| generative-ui | `skills/generative-ui/SKILL.md` |
| mixed-initiative-flow | `skills/mixed-initiative-flow/SKILL.md` |
| multimodal-orchestration | `skills/multimodal-orchestration/SKILL.md` |
| progressive-disclosure | `skills/progressive-disclosure/SKILL.md` |

## Commands

Invoke from within Gemini CLI:

| Command | File |
|---------|------|
| `/model-interaction-design:audit-interaction` | `commands/audit-interaction.toml` |
| `/model-interaction-design:design-conversation` | `commands/design-conversation.toml` |
| `/model-interaction-design:map-initiative` | `commands/map-initiative.toml` |
