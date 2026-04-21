# ai-alignment-reasoning (Gemini CLI)

Design guardrails, safety boundaries, value alignment, and ethical constraints into AI products.

## Install

Clone the monorepo and install this extension from its local path:

```bash
git clone https://github.com/Owl-Listener/ai-design-skills
cd ai-design-skills
gemini extensions install ./gemini/ai-alignment-reasoning
```

For development, symlink instead:

```bash
gemini extensions link ./gemini/ai-alignment-reasoning
```

## Skills

| Skill | File |
|-------|------|
| bias-detection-design | `skills/bias-detection-design/SKILL.md` |
| consent-and-agency | `skills/consent-and-agency/SKILL.md` |
| escalation-design | `skills/escalation-design/SKILL.md` |
| guardrail-design | `skills/guardrail-design/SKILL.md` |
| harm-anticipation | `skills/harm-anticipation/SKILL.md` |
| transparency-patterns | `skills/transparency-patterns/SKILL.md` |
| value-specification | `skills/value-specification/SKILL.md` |

## Commands

Invoke from within Gemini CLI:

| Command | File |
|---------|------|
| `/ai-alignment-reasoning:design-guardrails` | `commands/design-guardrails.toml` |
| `/ai-alignment-reasoning:red-team` | `commands/red-team.toml` |
| `/ai-alignment-reasoning:write-policy` | `commands/write-policy.toml` |
