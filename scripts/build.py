#!/usr/bin/env python3
"""Materialize the Claude and Gemini agent layers from canonical sources.

Single source of truth lives at the repo root:
  skills/<plugin>/<skill-name>/SKILL.md
  commands/<plugin>/<command-name>.md   (Claude .md form, with YAML frontmatter)

This script regenerates everything else:
  claude-plugin/<plugin>/skills/<skill-name>/SKILL.md     (file copy)
  claude-plugin/<plugin>/commands/<command-name>.md       (file copy)
  gemini-extension/<plugin>/skills/<skill-name>/SKILL.md  (file copy)
  gemini-extension/<plugin>/commands/<command-name>.toml  (generated; see below)

Why copies instead of symlinks: Claude's plugin install does not preserve
symlinks that point outside the plugin source directory; the cache ends up
empty for skills/ and commands/. Materialising real files is the only way
the install works against both local and GitHub marketplace sources.

The pre-commit hook in .githooks/pre-commit and the CI workflow in
.github/workflows/build-check.yml keep the materialised layers in sync
with the canonical sources.

Gemini command TOML conversion is mechanical:
  - description from frontmatter -> TOML basic string
  - body (everything after the closing ---) -> TOML multiline string
  - 'Target: {{args}}' is appended so Gemini wires user args into the prompt
"""

from __future__ import annotations

import re
import shutil
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SKILLS_SRC = ROOT / "skills"
COMMANDS_SRC = ROOT / "commands"
CLAUDE_DST = ROOT / "claude-plugin"
GEMINI_DST = ROOT / "gemini-extension"

FRONTMATTER_RE = re.compile(r"\A---\n(.*?)\n---\n(.*)\Z", re.DOTALL)
DESC_RE = re.compile(r"^description:\s*(.*?)\s*$", re.MULTILINE)


def escape_basic_string(value: str) -> str:
    """Escape backslashes and double quotes for a TOML basic string."""
    return value.replace("\\", "\\\\").replace('"', '\\"')


def md_to_toml(src_md: Path) -> str:
    text = src_md.read_text(encoding="utf-8")
    match = FRONTMATTER_RE.match(text)
    if not match:
        raise SystemExit(f"{src_md}: no YAML frontmatter found")
    frontmatter, body = match.group(1), match.group(2)

    desc_match = DESC_RE.search(frontmatter)
    if not desc_match:
        raise SystemExit(f"{src_md}: no 'description:' field in frontmatter")
    description = desc_match.group(1).strip().strip('"').strip("'")

    body = body.rstrip("\n")
    if '"""' in body:
        raise SystemExit(
            f"{src_md}: body contains triple-quote, which would break TOML"
        )

    return (
        f'description = "{escape_basic_string(description)}"\n'
        'prompt = """\n'
        f"{body}\n"
        "\n"
        "Target: {{args}}\n"
        '"""\n'
    )


def replace_dir(target: Path, source: Path) -> None:
    """Atomically replace target dir contents with a copy of source."""
    if target.exists() or target.is_symlink():
        if target.is_symlink() or target.is_file():
            target.unlink()
        else:
            shutil.rmtree(target)
    shutil.copytree(source, target)


def build_plugin(plugin: str) -> tuple[int, int]:
    skills_src = SKILLS_SRC / plugin
    commands_src = COMMANDS_SRC / plugin

    skill_count = sum(1 for _ in skills_src.glob("*/SKILL.md"))
    command_count = sum(1 for _ in commands_src.glob("*.md"))

    # Claude layer: file copies of skills/ and commands/.
    replace_dir(CLAUDE_DST / plugin / "skills", skills_src)
    replace_dir(CLAUDE_DST / plugin / "commands", commands_src)

    # Gemini layer: file copy of skills/, generated TOMLs for commands/.
    replace_dir(GEMINI_DST / plugin / "skills", skills_src)

    gemini_cmd_dir = GEMINI_DST / plugin / "commands"
    if gemini_cmd_dir.exists():
        shutil.rmtree(gemini_cmd_dir)
    gemini_cmd_dir.mkdir(parents=True)
    for src_md in sorted(commands_src.glob("*.md")):
        (gemini_cmd_dir / f"{src_md.stem}.toml").write_text(
            md_to_toml(src_md), encoding="utf-8"
        )

    return skill_count, command_count


def main() -> int:
    if not SKILLS_SRC.is_dir() or not COMMANDS_SRC.is_dir():
        raise SystemExit("missing canonical skills/ or commands/ directory")

    plugins = sorted(p.name for p in SKILLS_SRC.iterdir() if p.is_dir())
    total_skills = total_commands = 0
    for plugin in plugins:
        s, c = build_plugin(plugin)
        total_skills += s
        total_commands += c
        print(f"  {plugin}: {s} skills, {c} commands", file=sys.stderr)

    print(
        f"built {len(plugins)} plugins: "
        f"{total_skills} skills, {total_commands} commands "
        f"(claude-plugin/ + gemini-extension/)",
        file=sys.stderr,
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
