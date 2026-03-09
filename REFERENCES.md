# References
Research papers, practitioner resources, and design guidebooks that informed the skills and commands in this collection.
## Academic Papers
### Human-AI Interaction Design
- Gao, Y., et al. (2024). **A Taxonomy for Human-LLM Interaction Modes: Categorising User Engagement Across Conversation, Collaboration, Delegation, and Exploration.** *Proceedings of CHI 2024, ACM.* — Defines four interaction modes and four phases of human-LLM interaction. Informed the conversation-patterns, mixed-initiative-flow, and progressive-disclosure skills in [model-interaction-design](./model-interaction-design).
### AI Alignment and Safety
- Biswas, S. & Talukdar, P. (2026). **Designing Alignment Guardrails for AI-Facing Products: A Multi-Stakeholder Framework.** — Framework for translating organisational values into implementable AI constraints. 42 citations. Informed guardrail-design, value-specification, and escalation-design in [ai-alignment-reasoning](./ai-alignment-reasoning).
- Zheng, S., et al. (2025). **Alignment at Scale: Governance Mechanisms for Large Language Models in Consumer Products.** — Governance patterns for deploying aligned AI at scale.
- Chua, M., et al. (2024). **User-Centred AI Safety: Designing Transparency and Control for Non-Expert Users.** 58 citations. — Informed transparency-patterns and consent-and-agency in [ai-alignment-reasoning](./ai-alignment-reasoning).
### System Behavior and Persona Design
- Schreiber, A., White, J., & Schmidt, D. (2024). **A Pattern Language for Persona-Based Interactions with Large Language Models.** — Catalogues reusable patterns for defining AI persona, voice, and behavioral rules. Informed persona-architecture and behavioral-consistency in [system-behavior-shaping](./system-behavior-shaping).
- Sorokin, A. (2025). **Behavioral Prompting: Shaping LLM Tone, Register, and Emotional Response Through Systematic Prompt Design.** — Techniques for calibrating AI tone and emotional response across contexts. Informed tone-calibration and emotional-design in [system-behavior-shaping](./system-behavior-shaping).
### Prompt Engineering and Architecture
- Doyle, M. (2024). **LLMs as Method Actors: Persona Prompting, Role Assignment, and the Structured Elicitation of Expert Behavior.** — Framing prompt design as directing a performance. Informed system-prompt-structure and few-shot-patterns in [prompt-architecture](./prompt-architecture).
- Naser, M. Z. (2025). **Chain-of-Thought and Beyond: Structured Reasoning Patterns for Large Language Models.** — Taxonomy of reasoning chain variants. Informed chain-of-thought-design in [prompt-architecture](./prompt-architecture).
- Guruge, D. (2025). **Prompt Architecture for Production Systems: Templates, Chains, and Reusable Patterns.** — Engineering patterns for scalable prompt systems. Informed template-design, constraint-specification, and prompt-versioning in [prompt-architecture](./prompt-architecture).
### Multi-Agent Orchestration
- Renney, A., et al. (2026). **Designing Human-Agent Handoffs: A Framework for Smooth Transitions in Collaborative AI Systems.** — Handoff protocol patterns for multi-agent and human-AI transitions. Informed handoff-protocols and failure-recovery in [design-agent-orchestration](./design-agent-orchestration).
- Zhou, Y., et al. (2026). **Agent Role Specialisation in Multi-LLM Systems: Coordination Patterns and Failure Modes.** — Role design patterns and coordination failures in multi-agent systems. Informed agent-role-design and state-management in [design-agent-orchestration](./design-agent-orchestration).
- Dibia, V. (2025). **Multi-Agent Design Patterns** (book). — Comprehensive reference for agent orchestration patterns. Informed task-decomposition, human-in-the-loop, and observability-design in [design-agent-orchestration](./design-agent-orchestration).
- Moore, S. (2025). **Orchestration Layers for Agentic AI: Routing, Memory, and Tool Use.** — Architectural patterns for orchestrating agent workflows.
### Evaluation
- Wang, J., et al. (2024). **LLM Evaluation Frameworks: A Systematic Review of Quality Metrics and Benchmarking Approaches.** 89 citations. — Survey of evaluation methods. Informed output-quality-rubrics and comparative-evaluation in [evaluation](./evaluation).
- Wang, Y., et al. (2024). **Task Success vs. Output Quality: Divergent Metrics in Human-AI Collaborative Work.** 41 citations. — Distinguishing between output quality and task success. Informed task-success-metrics and user-satisfaction-signals in [evaluation](./evaluation).
- Mertsiotaki, E., et al. (2025). **Longitudinal Evaluation of AI Products: Detecting Drift, Degradation, and Emergent Failures.** — Methods for tracking AI quality over time. Informed longitudinal-measurement and failure-taxonomy in [evaluation](./evaluation).
## Practitioner Resources
### Google PAIR Guidebook
- [People + AI Guidebook](https://pair.withgoogle.com/guidebook/) — Google's comprehensive guide to human-AI interaction design. Specific chapters that informed this collection:
  - **User Needs + Defining Success** — Informed task-success-metrics in [evaluation](./evaluation)
  - **Mental Models + Expectations** — Informed progressive-disclosure in [model-interaction-design](./model-interaction-design)
  - **Trust + Explanations** — Informed transparency-patterns in [ai-alignment-reasoning](./ai-alignment-reasoning)
  - **Feedback + Controls** — Informed feedback-loops in [model-interaction-design](./model-interaction-design) and consent-and-agency in [ai-alignment-reasoning](./ai-alignment-reasoning)
  - **Errors + Graceful Failures** — Informed error-personality in [system-behavior-shaping](./system-behavior-shaping) and failure-recovery in [design-agent-orchestration](./design-agent-orchestration)
  - **Data + Model Evolution** — Informed longitudinal-measurement in [evaluation](./evaluation)
### Nielsen Norman Group
- [NNGroup AI Topic Collection](https://www.nngroup.com/topic/ai/) — Practitioner research on AI product design:
  - **Generative UI** (March 2026) — Informed generative-ui in [model-interaction-design](./model-interaction-design)
  - **Service Design Metrics Shifting with AI** — Informed longitudinal-measurement in [evaluation](./evaluation)
  - **AI Literacy for Designers** — General framing for the design practice perspective across all plugins
  - **AI-Moderated User Interviews** — Informed conversation-patterns in [model-interaction-design](./model-interaction-design)
## Research Gap
A consistent finding across the literature: nearly all existing work on these topics is written by and for engineers. The papers frame AI interaction, alignment, evaluation, and orchestration as technical problems with technical solutions.
This collection fills the gap by reframing these topics as **design work** — with the vocabulary, workflows, artefacts, and practitioner skills that let designers own these competencies rather than deferring to engineering.
