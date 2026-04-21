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
## Gemini CLI port
The `gemini/` directory mirrors each Claude Code plugin as a Gemini CLI extension:
- `gemini/<plugin>/gemini-extension.json` — manifest.
- `gemini/<plugin>/GEMINI.md` — context file; `@`-includes every skill.
- `gemini/<plugin>/skills/<name>/SKILL.md` — skill content (copied verbatim from the Claude plugin).
- `gemini/<plugin>/commands/<name>.toml` — command translated from the Claude `.md` frontmatter form.
When adding or editing skills/commands, update both sides. Command bodies should stay prose-identical; the only Gemini-specific change is the TOML wrapper plus a trailing `Target: {{args}}` line.
## Code of Conduct
Be kind, be constructive, be design-minded.
