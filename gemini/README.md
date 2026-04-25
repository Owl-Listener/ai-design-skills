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

## Install

Gemini CLI installs one extension per directory, and `gemini extensions install <github-url>` expects the manifest at the repo root — so for this monorepo, clone and install each extension from its local path.

```bash
git clone https://github.com/Owl-Listener/ai-design-skills
cd ai-design-skills
gemini extensions install ./gemini/model-interaction-design
```

Repeat for any of the other five extensions. To install all of them:

```bash
for ext in gemini/*/; do gemini extensions install "./$ext"; done
```

For development (symlink instead of copy, so edits take effect immediately):

```bash
gemini extensions link ./gemini/model-interaction-design
```

Manage installed extensions with `gemini extensions list`, `update`, `enable`, `disable`, `uninstall`.

## Format

Each extension follows Gemini CLI conventions:

- `gemini-extension.json` — manifest (`name`, `version`, `description`, `contextFileName`).
- `GEMINI.md` — context file; `@`-includes every skill so the skill content is loaded into context when the extension is active.
- `skills/<name>/SKILL.md` — one directory per skill, content copied verbatim from the Claude plugin.
- `commands/<name>.toml` — custom slash commands, invoked as `/<extension>:<command> <args>`. Translated from Claude Code's markdown-with-frontmatter; `{{args}}` is wired in at the end of each prompt.
