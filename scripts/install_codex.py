#!/usr/bin/env python3
"""Link generated skills into Codex's user skill directory without overwriting files."""

import argparse
from pathlib import Path

SOURCE = Path(__file__).resolve().parent.parent / "codex-skills"


def install(source: Path, destination: Path, plugins: list[str]) -> int:
    selected = plugins or sorted(p.name for p in source.iterdir() if p.is_dir())
    links = {}
    for plugin in selected:
        if plugin not in {p.name for p in source.iterdir() if p.is_dir()}:
            raise ValueError(f"Unknown collection: {plugin}")
        for skill in sorted((source / plugin).iterdir()):
            if not (skill / "SKILL.md").is_file():
                continue
            target = destination / skill.name
            source_path = skill.resolve()
            if target in links and links[target] != source_path:
                raise ValueError(f"Duplicate skill name: {skill.name}")
            if target.exists() or target.is_symlink():
                if not target.is_symlink() or target.resolve() != source_path:
                    raise ValueError(f"Already exists: {target}; move it or choose --dest")
            links[target] = source_path
    if not links:
        raise ValueError("No generated skills found; run python3 scripts/build.py first")
    destination.mkdir(parents=True, exist_ok=True)
    for target, source_path in links.items():
        if not target.is_symlink():
            target.symlink_to(source_path, target_is_directory=True)
    return len(links)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("plugins", nargs="*", help="Collection names; default: all six")
    parser.add_argument("--dest", type=Path, default=Path.home() / ".agents" / "skills")
    args = parser.parse_args()
    try:
        count = install(SOURCE, args.dest.expanduser().absolute(), args.plugins)
    except ValueError as exc:
        parser.exit(1, f"{exc}\n")
    print(f"Linked {count} skills in {args.dest}. Keep this checkout for the links to work.")


if __name__ == "__main__":
    main()
