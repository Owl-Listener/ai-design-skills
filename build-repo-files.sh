#!/bin/bash
set -e
echo "🔨 Building repo-level files..."
# .claude-plugin/marketplace.json
mkdir -p .claude-plugin
cat > .claude-plugin/marketplace.json << 'EOF'
{
  "name": "AI Design Skills Collection",
  "description": "Agentic skills, commands, and plugins for designing AI products — from interaction patterns to alignment, evaluation, agent orchestration, and prompt architecture.",
  "plugins": [
    "model-interaction-design",
    "ai-alignment-reasoning",
    "system-behavior-shaping",
    "evaluation",
    "design-agent-orchestration",
    "prompt-architecture"
  ]
}
EOF
# CONTRIBUTING.md
cat > CONTRIBUTING.md << 'EOF'
# Contributing to AI Design Skills
Thanks for your interest in contributing! This collection is open to new skills, commands, and plugins that help designers work with AI products.
## Structure
```
plugin-name/
├── .claude-plugin/
│   └── plugin.json
├── skills/
│   └── skill-name.md
├── commands/
│   └── command-name.md
└── README.md
```
## Adding a Skill
Skills are domain knowledge units (nouns). They teach Claude about a design topic.
1. Create a new `.md` file in the appropriate plugin's `skills/` directory.
2. Use YAML frontmatter with `name` and `description`.
3. The filename must match the `name` field in the frontmatter.
4. Write substantive content — not just definitions, but frameworks, principles, and practical guidance.
```yaml
---
name: skill-name
description: One-line description of the skill.
---
```
## Adding a Command
Commands are workflows (verbs). They chain multiple skills together to accomplish a task.
1. Create a new `.md` file in the appropriate plugin's `commands/` directory.
2. Use YAML frontmatter with `description` and `argument-hint`.
3. Commands should only reference skills from their own plugin.
4. Structure commands as step-by-step processes with clear outputs.
```yaml
---
description: What this command does.
argument-hint: "[what the user should provide]"
---
```
## Adding a Plugin
A plugin is a collection of related skills and commands.
1. Create a new directory with the plugin name.
2. Add `.claude-plugin/plugin.json` with name, description, skills path, and commands path.
3. Add skills and commands.
4. Add a `README.md` with a table of skills and commands.
5. Update the root `README.md` and `.claude-plugin/marketplace.json`.
## Guidelines
- Skills should contain original design thinking, not just summaries of existing frameworks.
- Commands should produce concrete, usable design artefacts.
- All content should be written from a design perspective, not an engineering perspective.
- Use British English spelling conventions (artefact, colour, organisation).
- Keep the MIT license on all contributions.
## Code of Conduct
Be kind, be constructive, be design-minded.
EOF
# README.md (overwrite the default one)
cat > README.md << 'EOF'
# AI Design Skills Collection
Agentic skills, commands, and plugins for designing AI products — from interaction patterns to alignment, evaluation, agent orchestration, and prompt architecture.
**42 skills** and **18 commands** across **6 plugins** for [Claude Code](https://docs.anthropic.com/en/docs/claude-code).
## Plugins
| Plugin | Skills | Commands | Description |
|--------|--------|----------|-------------|
| [model-interaction-design](./model-interaction-design) | 7 | 3 | Design how humans and AI models communicate — conversation patterns, turn-taking, mixed-initiative flows, and generative UI. |
| [ai-alignment-reasoning](./ai-alignment-reasoning) | 7 | 3 | Design guardrails, safety boundaries, value alignment, and ethical constraints into AI products. |
| [system-behavior-shaping](./system-behavior-shaping) | 7 | 3 | Craft AI personality, tone, persona, and behavioral consistency across contexts. |
| [evaluation](./evaluation) | 7 | 3 | Measure AI output quality, user satisfaction, task success, and design effectiveness. |
| [design-agent-orchestration](./design-agent-orchestration) | 7 | 3 | Design multi-agent systems, handoffs between AI agents, and human-in-the-loop workflows. |
| [prompt-architecture](./prompt-architecture) | 7 | 3 | Structure prompts as design artefacts — system prompts, templates, chains, and reusable patterns. |
## Quick Start
### Install a Single Plugin
```bash
claude install github:Owl-Listener/ai-design-skills/model-interaction-design
```
### Install All Plugins
```bash
claude install github:Owl-Listener/ai-design-skills
```
## What Are Skills and Commands?
- **Skills** are domain knowledge units (nouns). They teach Claude about designing AI products — like crafting conversation patterns, specifying guardrails, or structuring system prompts.
- **Commands** are workflows (verbs). They chain multiple skills together to accomplish a task — like designing a complete AI persona or auditing a prompt for effectiveness.
## All Commands
| Command | Plugin | Description |
|---------|--------|-------------|
| `/model-interaction-design:design-conversation` | model-interaction-design | Design a complete human-AI conversation flow for a feature. |
| `/model-interaction-design:audit-interaction` | model-interaction-design | Evaluate an existing AI interaction against interaction mode taxonomies. |
| `/model-interaction-design:map-initiative` | model-interaction-design | Map who leads at each stage of an AI-powered workflow. |
| `/ai-alignment-reasoning:design-guardrails` | ai-alignment-reasoning | Create a complete guardrail specification for an AI feature. |
| `/ai-alignment-reasoning:red-team` | ai-alignment-reasoning | Run a structured red-teaming exercise to find alignment failures. |
| `/ai-alignment-reasoning:write-policy` | ai-alignment-reasoning | Draft an AI behavior policy covering safety, tone, and boundaries. |
| `/system-behavior-shaping:design-persona` | system-behavior-shaping | Create a complete AI persona specification with voice, tone, and behavioral rules. |
| `/system-behavior-shaping:calibrate-tone` | system-behavior-shaping | Develop a tone matrix mapping contexts to appropriate AI behavior. |
| `/system-behavior-shaping:stress-test` | system-behavior-shaping | Test an AI persona against edge cases, adversarial inputs, and emotional scenarios. |
| `/evaluation:create-rubric` | evaluation | Build a scoring rubric for evaluating AI output quality. |
| `/evaluation:run-evaluation` | evaluation | Execute a structured evaluation of an AI feature against defined criteria. |
| `/evaluation:design-benchmark` | evaluation | Design a benchmark suite to measure AI product performance over time. |
| `/design-agent-orchestration:design-workflow` | design-agent-orchestration | Design a complete multi-agent workflow with roles, handoffs, and fallbacks. |
| `/design-agent-orchestration:map-agents` | design-agent-orchestration | Map out agent responsibilities, boundaries, and communication patterns. |
| `/design-agent-orchestration:design-oversight` | design-agent-orchestration | Create a human oversight plan for an agentic system. |
| `/prompt-architecture:design-prompt` | prompt-architecture | Create a structured system prompt for an AI feature. |
| `/prompt-architecture:build-chain` | prompt-architecture | Design a multi-step prompt chain for a complex task. |
| `/prompt-architecture:audit-prompt` | prompt-architecture | Evaluate an existing prompt for clarity, effectiveness, and edge cases. |
## Contributing
See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines on adding new skills, commands, and plugins.
## License
MIT — see [LICENSE](./LICENSE).
EOF
echo "✅ Repo files complete — marketplace.json, README.md, CONTRIBUTING.md"
