# prompt-architecture (Gemini CLI)

Structure prompts as design artefacts — system prompts, templates, chains, and reusable patterns.

## Install

Clone the monorepo and install this extension from its local path:

```bash
git clone https://github.com/Owl-Listener/ai-design-skills
cd ai-design-skills
gemini extensions install ./gemini/prompt-architecture
```

For development, symlink instead:

```bash
gemini extensions link ./gemini/prompt-architecture
```

## Skills

| Skill | File |
|-------|------|
| chain-of-thought-design | `skills/chain-of-thought-design/SKILL.md` |
| constraint-specification | `skills/constraint-specification/SKILL.md` |
| context-engineering | `skills/context-engineering/SKILL.md` |
| few-shot-patterns | `skills/few-shot-patterns/SKILL.md` |
| prompt-versioning | `skills/prompt-versioning/SKILL.md` |
| system-prompt-structure | `skills/system-prompt-structure/SKILL.md` |
| template-design | `skills/template-design/SKILL.md` |

## Commands

Invoke from within Gemini CLI:

| Command | File |
|---------|------|
| `/prompt-architecture:audit-prompt` | `commands/audit-prompt.toml` |
| `/prompt-architecture:build-chain` | `commands/build-chain.toml` |
| `/prompt-architecture:design-prompt` | `commands/design-prompt.toml` |
