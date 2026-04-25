# system-behavior-shaping (Gemini CLI)

Craft AI personality, tone, persona, and behavioral consistency across contexts.

## Install

Clone the monorepo and install this extension from its local path:

```bash
git clone https://github.com/Owl-Listener/ai-design-skills
cd ai-design-skills
gemini extensions install ./gemini/system-behavior-shaping
```

For development, symlink instead:

```bash
gemini extensions link ./gemini/system-behavior-shaping
```

## Skills

| Skill | File |
|-------|------|
| behavioral-consistency | `skills/behavioral-consistency/SKILL.md` |
| cultural-adaptation | `skills/cultural-adaptation/SKILL.md` |
| domain-voice | `skills/domain-voice/SKILL.md` |
| emotional-design | `skills/emotional-design/SKILL.md` |
| error-personality | `skills/error-personality/SKILL.md` |
| persona-architecture | `skills/persona-architecture/SKILL.md` |
| tone-calibration | `skills/tone-calibration/SKILL.md` |

## Commands

Invoke from within Gemini CLI:

| Command | File |
|---------|------|
| `/system-behavior-shaping:calibrate-tone` | `commands/calibrate-tone.toml` |
| `/system-behavior-shaping:design-persona` | `commands/design-persona.toml` |
| `/system-behavior-shaping:stress-test` | `commands/stress-test.toml` |
