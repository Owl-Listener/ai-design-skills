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
## References
See [REFERENCES.md](./REFERENCES.md) for the academic papers and practitioner resources that informed this collection.
## Contributing
See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines on adding new skills, commands, and plugins.
## License
MIT — see [LICENSE](./LICENSE).
