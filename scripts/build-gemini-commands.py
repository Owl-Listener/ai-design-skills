#!/usr/bin/env python3
"""Generate Gemini CLI command TOMLs from canonical Claude command markdown.

Reads:  commands/<plugin>/<name>.md  (frontmatter + prose body)
Writes: gemini-extension/<plugin>/commands/<name>.toml

Conversion is mechanical:
  - description from frontmatter -> TOML basic string
  - body (everything after the closing ---) -> TOML multiline string
  - 'Target: {{args}}' is appended so Gemini wires user args into the prompt
"""

from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC_DIR = ROOT / "commands"
DST_DIR = ROOT / "gemini-extension"

FRONTMATTER_RE = re.compile(r"\A---\n(.*?)\n---\n(.*)\Z", re.DOTALL)
DESC_RE = re.compile(r"^description:\s*(.*?)\s*$", re.MULTILINE)


def escape_basic_string(value: str) -> str:
    """Escape backslashes and double quotes for a TOML basic string."""
    return value.replace("\\", "\\\\").replace('"', '\\"')


def convert(src_md: Path) -> str:
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


def main() -> int:
    if not SRC_DIR.is_dir():
        raise SystemExit(f"missing source directory: {SRC_DIR}")

    written = 0
    for plugin_dir in sorted(p for p in SRC_DIR.iterdir() if p.is_dir()):
        for src_md in sorted(plugin_dir.glob("*.md")):
            dst = DST_DIR / plugin_dir.name / "commands" / f"{src_md.stem}.toml"
            dst.parent.mkdir(parents=True, exist_ok=True)
            dst.write_text(convert(src_md), encoding="utf-8")
            written += 1

    print(f"wrote {written} Gemini command TOMLs under {DST_DIR}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
