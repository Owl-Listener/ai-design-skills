# AI Design Skills Collection

Agentic skills, commands, and plugins for designing AI products — from interaction patterns to alignment, evaluation, agent orchestration, and prompt architecture.

**42 skills** and **18 commands** across **6 plugins**, available for both [Claude Code](https://docs.anthropic.com/en/docs/claude-code) and [Gemini CLI](https://github.com/google-gemini/gemini-cli). Same skills, same shape, both supported as first-class agents.

---

## Why this exists

Agentic Experience Design (AXD) is a new discipline. It has its own vocabulary, definitions, and practices, and it is emerging in real time. *Mixed-initiative flow. Harm anticipation. Handoff protocol. Error personality.* These are real, useful, often-academic terms. They have not yet been collected into a form designers can reach for in real work.

This repo is the collection. Six plugins, mapped to six layers of the discipline: *model interaction, alignment reasoning, system behaviour, evaluation, agent orchestration, prompt architecture.* Inside each, seven skills and three commands your AI agent can load when you are designing or auditing agentic experiences. The work in the underlying ideas was done by alignment researchers and HCI scholars over the last three years; the translation into installable skills is the contribution. See [`REFERENCES.md`](./REFERENCES.md) for the mapping from skills back to source papers.

---

## Quick Start

Pick the install command for your agent.

### Claude Code

Add the marketplace, then install plugins from it.

```bash
claude plugin marketplace add Owl-Listener/ai-design-skills
claude plugin install model-interaction-design@ai-design-skills
```

To install all six plugins at once:

```bash
for p in model-interaction-design ai-alignment-reasoning system-behavior-shaping evaluation design-agent-orchestration prompt-architecture; do
  claude plugin install "$p@ai-design-skills"
done
```

### Gemini CLI

Gemini CLI installs one extension per directory and expects the manifest at the install source's root, so for this monorepo, clone and install each extension from its local path.

```bash
git clone https://github.com/Owl-Listener/ai-design-skills
cd ai-design-skills
gemini extensions install ./gemini-extension/model-interaction-design
```

To install all six:

```bash
for ext in gemini-extension/*/; do gemini extensions install "./$ext"; done
```

For development (symlink instead of copy, so edits take effect immediately):

```bash
gemini extensions link ./gemini-extension/model-interaction-design
```

Both agents load skills the same way: each skill has a `description` field in its frontmatter, the agent matches your wording against those descriptions, and the relevant skill loads automatically. You do not pick the skill — the agent does.

---

## First time using a CLI agent?

If you have not used either Claude Code or Gemini CLI before, the path is short.

1. Pick an agent. Both work with this skill set; both are well-documented; both are free for personal use. Set-up instructions for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) and [Gemini CLI](https://github.com/google-gemini/gemini-cli).
2. Open a terminal in any project folder.
3. Run the install command for your agent (above).
4. From then on, the agent will load the relevant skills automatically when you ask agentic-experience-design questions.

Try this as a first prompt to see the difference:

> *"I am designing an AI assistant for customer support. Help me write the error states for when the assistant does not understand the user's question. Walk me through the trade-offs."*

You will see the agent reach for `error-personality`, `tone-calibration`, and (depending on the framing) `harm-anticipation` automatically. Compare the answer to the same question without the skills installed — the difference is what this repo is for. A worked example of that exact comparison is at [`examples/error-states-walkthrough.md`](./examples/error-states-walkthrough.md).

---

## Where to start

You can install all six plugins at once, but if you want to start small, here is a guide based on what you are working on.

- **Building any agentic feature:** start with `model-interaction-design` and `prompt-architecture`. These are the foundation.
- **Shipping a feature soon:** add `evaluation` and `ai-alignment-reasoning`. You need the failure modes mapped before launch.
- **Working on a multi-agent system:** add `design-agent-orchestration`. Handoff protocols and orchestration anti-patterns are non-negotiable here.
- **Designing the agent's voice:** add `system-behavior-shaping`. Persona architecture, error personality, tone calibration.
- **Just curious:** install all six. They are small.

---

## What Are Skills and Commands?

**Skills** are domain knowledge units (nouns). They teach the agent about designing AI products — like crafting conversation patterns, specifying guardrails, or structuring system prompts.

**Commands** are workflows (verbs). They chain multiple skills together to accomplish a task — like designing a complete AI persona or auditing a prompt for effectiveness.

When you ask your agent a question, it matches your wording against the `description` field in each skill's frontmatter and loads the relevant ones automatically.

---

## The Six Plugins

| Plugin | What it covers | Skills | Commands |
| --- | --- | ---: | ---: |
| `model-interaction-design` | How humans and agents take turns | 7 | 3 |
| `ai-alignment-reasoning` | Outside-of-the-model alignment work | 7 | 3 |
| `system-behavior-shaping` | How the agent shows up — persona, tone, error personality | 7 | 3 |
| `evaluation` | Failure taxonomies, output rubrics, agent-specific heuristics | 7 | 3 |
| `design-agent-orchestration` | Multi-agent role design, handoffs, observability | 7 | 3 |
| `prompt-architecture` | Chain-of-thought, constraint specification, system prompts | 7 | 3 |

Each plugin has its own `README.md` with a full skill-by-skill table.

---

## References

The skills are translations of academic and industry work into a form coding agents can use. See [`REFERENCES.md`](./REFERENCES.md) for the mapping from skills to source papers — Gao et al. on mixed-initiative interaction, Schreiber et al. on persona-based interactions, and others.

---

## Contributing

Skill files are plain markdown. Editing one is a sentence and a commit. New skills welcome — see [`CONTRIBUTING.md`](./CONTRIBUTING.md) for the file conventions and what makes a skill substantive.

If you build something on top of these — a workflow, a higher-level command, a derivative plugin for a specific domain — open an issue or a PR. The discipline gets better when more of us write it.

---

## License

[MIT](./LICENSE) — fork it, modify it, ship it. Attribution appreciated, not required.

---

*Built by [MC Dean](https://marieclairedean.substack.com). Read about why AXD is a discipline now in [the launch essay](https://marieclairedean.substack.com).*
