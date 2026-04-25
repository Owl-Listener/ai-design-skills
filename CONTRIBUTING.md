# Contributing to AI Design Skills
Thanks for your interest in contributing! This collection is open to new skills, commands, and plugins that help designers work with AI products.

## Repo layout

There is one canonical copy of every skill and every command. The agent-specific layers (Claude Code plugins and Gemini CLI extensions) reference that canonical content via symlinks (skills) or a build script (Gemini command TOMLs).

```
skills/<plugin>/<skill-name>/SKILL.md       # canonical skill
commands/<plugin>/<command-name>.md         # canonical slash command (Claude .md form)

claude-plugin/<plugin>/                     # Claude Code installable layer
├── .claude-plugin/plugin.json
├── README.md
├── skills    -> ../../skills/<plugin>      # symlink
└── commands  -> ../../commands/<plugin>    # symlink

gemini-extension/<plugin>/                  # Gemini CLI installable layer
├── gemini-extension.json
├── GEMINI.md
├── README.md
├── skills    -> ../../skills/<plugin>      # symlink
└── commands/<command-name>.toml            # generated from commands/<plugin>/<name>.md

scripts/build-gemini-commands.py            # commands/*.md → gemini-extension/*/commands/*.toml
.githooks/pre-commit                        # auto-runs build script when commands/ changes
.github/workflows/build-check.yml           # CI fails if generated TOMLs drift from source
```

## Adding a Skill
Skills are domain knowledge units (nouns). They teach the agent about a design topic.
1. Create a new directory `skills/<plugin>/<skill-name>/` and put the content in `SKILL.md`.
2. Use YAML frontmatter with `name` and `description`.
3. The folder name must match the `name` field in the frontmatter.
4. Write substantive content — not just definitions, but frameworks, principles, and practical guidance.
```yaml
---
name: skill-name
description: One-line description of the skill.
---
```

Both Claude Code and Gemini CLI pick the new skill up automatically because each agent's `<plugin>/skills` is a symlink to `skills/<plugin>/`.

## Adding a Command
Commands are workflows (verbs). They chain multiple skills together to accomplish a task.
1. Create a new `.md` file at `commands/<plugin>/<command-name>.md`.
2. Use YAML frontmatter with `description` and `argument-hint`.
3. Commands should only reference skills from their own plugin.
4. Structure commands as step-by-step processes with clear outputs.
```yaml
---
description: What this command does.
argument-hint: "[what the user should provide]"
---
```

The Claude side picks the new command up directly via the symlink. For the Gemini side, run the build script (or rely on the pre-commit hook):
```bash
python3 scripts/build-gemini-commands.py
```
This generates `gemini-extension/<plugin>/commands/<command-name>.toml`. Commit the regenerated TOML alongside the source `.md`.

## Adding a Plugin
A plugin is a collection of related skills and commands.
1. Create `skills/<plugin>/` and `commands/<plugin>/` and add content as above.
2. Create `claude-plugin/<plugin>/.claude-plugin/plugin.json` with `name` and `description`.
3. Symlink `claude-plugin/<plugin>/skills -> ../../skills/<plugin>` and `claude-plugin/<plugin>/commands -> ../../commands/<plugin>`.
4. Add `claude-plugin/<plugin>/README.md` with a table of skills and commands.
5. Create `gemini-extension/<plugin>/gemini-extension.json` (with `name`, `version`, `description`, `contextFileName: "GEMINI.md"`).
6. Add `gemini-extension/<plugin>/GEMINI.md` that `@`-includes every skill (`@./skills/<name>/SKILL.md`).
7. Symlink `gemini-extension/<plugin>/skills -> ../../skills/<plugin>`.
8. Run `python3 scripts/build-gemini-commands.py` to materialise the Gemini TOMLs.
9. Add `gemini-extension/<plugin>/README.md`.
10. Add the plugin to the root `.claude-plugin/marketplace.json` (`{ "name": "...", "source": "./claude-plugin/<plugin>" }`).
11. Update the root `README.md` plugins table.

## Local setup
Activate the pre-commit hook so Gemini TOMLs stay in sync automatically:
```bash
git config core.hooksPath .githooks
```
The hook is a no-op if you don't touch `commands/` or the build script. CI will reject any drift in `gemini-extension/`, so even contributors who skip the hook are caught before merge.

### Windows note
The Claude and Gemini extension layers use filesystem symlinks. On Windows, git supports symlinks but requires `git config --global core.symlinks true` and either developer mode or admin privileges. If you cannot use symlinks, you can still edit canonical content and rely on CI to validate generated files; the agent installs themselves require symlinks to function.

## Guidelines
- Skills should contain original design thinking, not just summaries of existing frameworks.
- Commands should produce concrete, usable design artefacts.
- All content should be written from a design perspective, not an engineering perspective.
- Use British English spelling conventions (artefact, colour, organisation).
- Keep the MIT license on all contributions.

## Code of Conduct
Be kind, be constructive, be design-minded.
