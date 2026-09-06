"""Packaging and installation regression tests; no Codex account required."""

import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

import build
from install_codex import install


class CodexPackagingTests(unittest.TestCase):
    def test_generated_knowledge_and_workflows_and_stale_file_removal(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            expected = len(list(build.SKILLS_SRC.glob("*/*/SKILL.md"))) + len(list(build.COMMANDS_SRC.glob("*/*.md")))
            with patch.object(build, "CODEX_DST", root / "codex"), \
                 patch.object(build, "CLAUDE_DST", root / "claude"), \
                 patch.object(build, "GEMINI_DST", root / "gemini"):
                for plugin in sorted(build.SKILLS_SRC.iterdir()):
                    build.build_plugin(plugin.name)
                    for source in plugin.glob("*/SKILL.md"):
                        target = build.CODEX_DST / plugin.name / source.parent.name / "SKILL.md"
                        self.assertEqual(source.read_bytes(), target.read_bytes())
                    for source in (build.COMMANDS_SRC / plugin.name).glob("*.md"):
                        target = build.CODEX_DST / plugin.name / source.stem / "SKILL.md"
                        generated = target.read_text()
                        body = build.FRONTMATTER_RE.match(source.read_text()).group(2)
                        self.assertTrue(generated.endswith(body))
                        self.assertIn(f"name: {source.stem}\n", generated)
                        self.assertIn("description:", generated)
                self.assertEqual(len(list(build.CODEX_DST.glob("*/*/SKILL.md"))), expected)
                stale = build.CODEX_DST / "evaluation" / "removed-skill"
                stale.mkdir()
                (stale / "SKILL.md").write_text("obsolete")
                build.build_plugin("evaluation")
                self.assertFalse(stale.exists())
                before = {p.relative_to(build.CODEX_DST): p.read_bytes()
                          for p in build.CODEX_DST.rglob("SKILL.md")}
                for plugin in sorted(build.SKILLS_SRC.iterdir()):
                    build.build_plugin(plugin.name)
                self.assertEqual(before, {p.relative_to(build.CODEX_DST): p.read_bytes()
                                         for p in build.CODEX_DST.rglob("SKILL.md")})
                destination = root / "installed"
                self.assertEqual(install(build.CODEX_DST, destination, []), expected)
                self.assertEqual(install(build.CODEX_DST, destination, []), expected)
                self.assertTrue(all((p / "SKILL.md").is_file() for p in destination.iterdir()))

    def test_install_preflights_conflicts_and_selection(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            source = root / "source"
            for name in ("first", "second"):
                folder = source / "collection" / name
                folder.mkdir(parents=True)
                (folder / "SKILL.md").write_text("content")
            destination = root / "installed"
            destination.mkdir()
            conflict = destination / "second"
            conflict.write_text("keep me")
            with self.assertRaises(ValueError):
                install(source, destination, [])
            self.assertEqual(conflict.read_text(), "keep me")
            self.assertFalse((destination / "first").exists())
            with self.assertRaises(ValueError):
                install(source, destination, ["../source"])
            self.assertEqual(install(source, root / "selected", ["collection"]), 2)

    def test_command_requires_metadata(self):
        with tempfile.TemporaryDirectory() as tmp:
            source = Path(tmp) / "workflow.md"
            for content in ("No frontmatter", "---\nargument-hint: input\n---\nBody"):
                source.write_text(content)
                with self.assertRaises(SystemExit):
                    build.md_to_codex_skill(source)


if __name__ == "__main__":
    unittest.main()
