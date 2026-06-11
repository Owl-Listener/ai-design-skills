#!/usr/bin/env python3
"""Install the VS Code Copilot layer into your personal VS Code prompts folder.

Copies pre-built files from vscode-copilot/ in this repo to:
  <VSCODE_USER_PROMPTS_FOLDER>/                   (agent files)
  <VSCODE_USER_PROMPTS_FOLDER>/ai-design-skills/  (prompt command files)

After running, reload VS Code (Developer: Reload Window) and open Copilot chat.
The 6 domain agents appear in the agent selector; type / to access 18 commands.

Usage:
  python scripts/build_vscode_prompts.py

To target a different output folder:
  python scripts/build_vscode_prompts.py --out "C:/path/to/prompts"
"""

from __future__ import annotations

import argparse
import os
import shutil
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
VSCODE_SRC = ROOT / "vscode-copilot"

_APPDATA = os.environ.get("APPDATA", "")
DEFAULT_OUT = Path(_APPDATA) / "Code" / "User" / "prompts" if _APPDATA else None


def install(out_root: Path) -> None:
    if not VSCODE_SRC.is_dir():
        raise SystemExit(
            f"vscode-copilot/ not found at {VSCODE_SRC}. "
            "Run 'python3 scripts/build.py' first to generate command files."
        )

    plugins = sorted(p.name for p in VSCODE_SRC.iterdir() if p.is_dir())
    agents_copied = prompts_copied = 0

    for plugin in plugins:
        plugin_dir = VSCODE_SRC / plugin

        # Copy agent file to prompts folder root.
        for agent_file in plugin_dir.glob("*.agent.md"):
            dst = out_root / agent_file.name
            shutil.copy2(agent_file, dst)
            agents_copied += 1
            print(f"  agent  {dst.relative_to(out_root)}", file=sys.stderr)

        # Copy generated prompt commands to ai-design-skills/<plugin>/.
        cmd_src = plugin_dir / "commands"
        if cmd_src.is_dir():
            cmd_dst = out_root / "ai-design-skills" / plugin
            cmd_dst.mkdir(parents=True, exist_ok=True)
            for prompt_file in sorted(cmd_src.glob("*.prompt.md")):
                dst = cmd_dst / prompt_file.name
                shutil.copy2(prompt_file, dst)
                prompts_copied += 1
                print(
                    f"  prompt ai-design-skills/{plugin}/{prompt_file.name}",
                    file=sys.stderr,
                )

    print(
        f"\ndone: {agents_copied} agents, {prompts_copied} prompts "
        f"→ {out_root}",
        file=sys.stderr,
    )
    print(
        "Reload VS Code (Developer: Reload Window) then open Copilot chat to use them.",
        file=sys.stderr,
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--out",
        metavar="FOLDER",
        help="VS Code user prompts folder (default: %%APPDATA%%/Code/User/prompts)",
    )
    args = parser.parse_args()

    if args.out:
        out_root = Path(args.out)
    elif DEFAULT_OUT:
        out_root = DEFAULT_OUT
    else:
        raise SystemExit(
            "Cannot find VS Code user prompts folder. "
            "Set APPDATA or pass --out <folder>."
        )

    install(out_root)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
