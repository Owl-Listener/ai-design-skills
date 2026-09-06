# Contributing to AI Design Skills
Thanks for your interest in contributing! This collection is open to new skills, commands, and plugins that help designers work with AI products.

## Repo layout

There is one canonical copy of every skill and every command. The agent-specific layers (Claude Code plugins, Gemini CLI extensions, and Codex skills) are **generated** from the canonical sources by `scripts/build.py` and committed.

```
skills/<plugin>/<skill-name>/SKILL.md       # ◄ canonical skill (edit here)
commands/<plugin>/<command-name>.md         # ◄ canonical slash command (edit here)

claude-plugin/<plugin>/                     # Claude Code installable layer
├── .claude-plugin/plugin.json
├── README.md
├── skills/<skill-name>/SKILL.md            # generated copy of canonical skill
└── commands/<command-name>.md              # generated copy of canonical command

gemini-extension/<plugin>/                  # Gemini CLI installable layer
├── gemini-extension.json
├── GEMINI.md
├── README.md
├── skills/<skill-name>/SKILL.md            # generated copy of canonical skill
└── commands/<command-name>.toml            # generated TOML wrapper of canonical command

codex-skills/<plugin>/<skill-or-command>/SKILL.md  # generated Codex skill or workflow

scripts/build.py                            # rebuilds all three agent layers
scripts/install_codex.py                    # links Codex skills without overwriting existing files
scripts/test_codex.py                       # packaging and installation regression tests
.githooks/pre-commit                        # auto-runs build.py when skills/ or commands/ changes
.github/workflows/build-check.yml           # CI fails if any layer drifts from canonical
```

The agent layers are file copies, not symlinks. Earlier iterations of this layout used symlinks, but `claude plugin install` does not preserve symlinks pointing outside the plugin source directory — the cache ends up empty for `skills/` and `commands/`. Materialised copies are the only layout that works against both local-directory and GitHub marketplace installs.

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

Run the build script (or rely on the pre-commit hook) so the new skill propagates into all three agent layers:
```bash
python3 scripts/build.py
```
This regenerates `claude-plugin/<plugin>/skills/`, `gemini-extension/<plugin>/skills/`, and `codex-skills/<plugin>/`. Commit the regenerated files alongside the canonical source.

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

Run the build script (or rely on the pre-commit hook):
```bash
python3 scripts/build.py
```
This copies the `.md` into `claude-plugin/<plugin>/commands/` and generates `gemini-extension/<plugin>/commands/<command-name>.toml`. It also creates `codex-skills/<plugin>/<command-name>/SKILL.md`, adding a name and translating the argument hint into input guidance while preserving the workflow body. Codex workflows can be invoked with `$command-name` and remain eligible for automatic selection. Command names must not collide with skill names. Commit the regenerated files alongside the source `.md`.

## Adding a Plugin
A plugin is a collection of related skills and commands.
1. Create `skills/<plugin>/` and `commands/<plugin>/` and add content as above.
2. Create `claude-plugin/<plugin>/.claude-plugin/plugin.json` with `name` and `description`.
3. Add `claude-plugin/<plugin>/README.md` with a table of skills and commands.
4. Create `gemini-extension/<plugin>/gemini-extension.json` (with `name`, `version`, `description`, `contextFileName: "GEMINI.md"`).
5. Add `gemini-extension/<plugin>/GEMINI.md` that `@`-includes every skill (`@./skills/<name>/SKILL.md`).
6. Add `gemini-extension/<plugin>/README.md`.
7. Run `python3 scripts/build.py` to materialise all three agent layers from the canonical sources.
8. Add the plugin to the root `.claude-plugin/marketplace.json` (`{ "name": "...", "source": "./claude-plugin/<plugin>" }`).
9. Update the root `README.md` plugins table.

## Local setup
Activate the pre-commit hook so all three agent layers stay in sync automatically:
```bash
git config core.hooksPath .githooks
```
The hook is a no-op if you don't touch `skills/`, `commands/`, or the build script. CI rejects any drift in `claude-plugin/`, `gemini-extension/`, or `codex-skills/`, so even contributors who skip the hook are caught before merge.

Run the packaging tests before submitting a PR:

```bash
python3 -m unittest discover -s scripts -p 'test_*.py'
python3 scripts/build.py
git status --short
```

For Codex development, run `python3 scripts/install_codex.py` once. Rebuild after editing canonical content; the installed symlinks pick up the regenerated files. Do not edit generated files directly. The installer requires Python 3.9+ and supports `--dest` for isolated installation tests.

## Guidelines
- Skills should contain original design thinking, not just summaries of existing frameworks.
- Commands should produce concrete, usable design artefacts.
- All content should be written from a design perspective, not an engineering perspective.
- Use British English spelling conventions (artefact, colour, organisation).
- Keep the MIT license on all contributions.

## Code of Conduct
Be kind, be constructive, be design-minded.
