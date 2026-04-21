# AI Design Skills — Gemini CLI Extensions

Gemini CLI port of the [AI Design Skills Collection](../README.md). Six extensions, 42 skills, 18 custom commands — matching the Claude Code plugins.

## Extensions

| Extension | Skills | Commands | Description |
|-----------|--------|----------|-------------|
| [model-interaction-design](./model-interaction-design) | 7 | 3 | Design how humans and AI models communicate — conversation patterns, turn-taking, mixed-initiative flows, and generative UI. |
| [ai-alignment-reasoning](./ai-alignment-reasoning) | 7 | 3 | Design guardrails, safety boundaries, value alignment, and ethical constraints into AI products. |
| [system-behavior-shaping](./system-behavior-shaping) | 7 | 3 | Craft AI personality, tone, persona, and behavioral consistency across contexts. |
| [evaluation](./evaluation) | 7 | 3 | Measure AI output quality, user satisfaction, task success, and design effectiveness. |
| [design-agent-orchestration](./design-agent-orchestration) | 7 | 3 | Design multi-agent systems, handoffs between AI agents, and human-in-the-loop workflows. |
| [prompt-architecture](./prompt-architecture) | 7 | 3 | Structure prompts as design artefacts — system prompts, templates, chains, and reusable patterns. |

## Install a single extension

```bash
gemini extensions install https://github.com/Owl-Listener/ai-design-skills --path gemini/model-interaction-design
```

## Install locally

```bash
git clone https://github.com/Owl-Listener/ai-design-skills
cd ai-design-skills
gemini extensions link ./gemini/model-interaction-design
```

## Format

Each extension follows Gemini CLI conventions:

- `gemini-extension.json` — manifest (name, version, description, contextFileName).
- `GEMINI.md` — context file that `@`-includes every skill.
- `skills/<name>/SKILL.md` — one directory per skill.
- `commands/<name>.toml` — custom slash commands (invoked as `/<extension>:<command>`).

## What gets ported

Skills keep their original markdown (YAML frontmatter with `name` and `description`, then the design guidance). Commands are translated from Claude Code's markdown-with-frontmatter to Gemini CLI's TOML format, with `{{args}}` wired in for the command argument.
