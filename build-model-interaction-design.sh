#!/bin/bash
set -e
PLUGIN="model-interaction-design"
echo "🔨 Building $PLUGIN..."
# Create directory structure
mkdir -p "$PLUGIN/.claude-plugin"
mkdir -p "$PLUGIN/skills"
mkdir -p "$PLUGIN/commands"
# plugin.json
cat > "$PLUGIN/.claude-plugin/plugin.json" << 'EOF'
{
  "name": "model-interaction-design",
  "description": "Design how humans and AI models communicate — conversation patterns, turn-taking, mixed-initiative flows, and generative UI.",
  "skills": "../skills",
  "commands": "../commands"
}
EOF
# README
cat > "$PLUGIN/README.md" << 'EOF'
# Model Interaction Design
Design how humans and AI models communicate — conversation patterns, turn-taking, mixed-initiative flows, and generative UI.
## Skills
| Skill | Description |
|-------|-------------|
| conversation-patterns | Turn-taking, repair sequences, grounding, and dialogue structure. |
| mixed-initiative-flow | When the AI leads vs. when the user leads, and how to hand off control. |
| progressive-disclosure | Revealing AI capability gradually to match user mental models. |
| multimodal-orchestration | Coordinating text, image, voice, and tool-use modalities in a single interaction. |
| context-window-design | Designing around token limits, memory, and conversation persistence. |
| generative-ui | Designing interfaces where AI generates UI components dynamically. |
| feedback-loops | User correction, thumbs up/down, inline editing, and reinforcement signals. |
## Commands
| Command | Description |
|---------|-------------|
| `/model-interaction-design:design-conversation` | Design a complete human-AI conversation flow for a feature. |
| `/model-interaction-design:audit-interaction` | Evaluate an existing AI interaction against interaction mode taxonomies. |
| `/model-interaction-design:map-initiative` | Map who leads at each stage of an AI-powered workflow. |
EOF
# === SKILLS ===
cat > "$PLUGIN/skills/conversation-patterns.md" << 'EOF'
---
name: conversation-patterns
description: Turn-taking, repair sequences, grounding, and dialogue structure for human-AI interaction.
---
# Conversation Patterns
Conversation between humans and AI follows predictable structural patterns. Designing these deliberately — rather than leaving them to model defaults — is core interaction design work.
## Turn-Taking Structure
Every human-AI conversation has a rhythm. The designer decides:
- **Turn length**: Short exchanges (chatbot-style) vs. long-form (essay generation). Match turn length to task complexity.
- **Turn initiation**: Who speaks first? Does the AI greet, or wait? Does it ask a clarifying question before acting?
- **Turn boundaries**: How does the user signal "I'm done"? How does the AI signal "I need more"?
## Repair Sequences
Conversations break down. Repair is how they recover:
- **Self-repair**: The AI detects its own error and corrects ("Actually, let me revise that...")
- **Other-repair**: The user corrects the AI ("No, I meant the other one")
- **Clarification requests**: The AI asks for disambiguation before proceeding
- **Graceful misunderstanding**: The AI acknowledges confusion without frustrating the user
Design repair sequences explicitly. Don't rely on the model to improvise them.
## Grounding
Grounding is how participants establish shared understanding:
- **Confirmation**: "Just to confirm, you want me to..."
- **Summarisation**: "So far we've covered X, Y, and Z"
- **Reference resolution**: Handling pronouns, anaphora, and ambiguous references
- **Context anchoring**: Reminding the user what the AI knows and doesn't know
## Dialogue Structure Patterns
Common structural patterns for human-AI conversation:
- **Interview**: AI asks questions, user answers, AI synthesises
- **Co-creation**: Turn-by-turn collaborative building
- **Instruction-execution**: User gives command, AI performs, user evaluates
- **Exploration**: Open-ended back-and-forth to discover possibilities
- **Guided workflow**: AI leads the user through a multi-step process
Choose the pattern that matches the task. Don't default to instruction-execution for everything.
## Design Artefacts
- Conversation flow diagrams showing turn sequences
- Repair protocol specifications
- Grounding checkpoints mapped to conversation stages
- Turn-taking rules per interaction context
EOF
cat > "$PLUGIN/skills/mixed-initiative-flow.md" << 'EOF'
---
name: mixed-initiative-flow
description: When the AI leads vs. when the user leads, and how to hand off control.
---
# Mixed-Initiative Flow
Mixed-initiative interaction is when both the human and the AI can take the lead. The designer decides who drives at each moment — and how control transfers between them.
## Initiative Spectrum
Interactions sit on a spectrum:
- **User-driven**: The user gives instructions, the AI executes. The user controls pace, direction, and scope.
- **AI-driven**: The AI leads — asking questions, making suggestions, guiding the user through a process.
- **Shared**: Both parties contribute. The AI proposes, the user edits. The user starts, the AI finishes.
Most AI products default to user-driven. The interesting design space is in shared and AI-driven modes.
## Designing Initiative Handoffs
The moment control shifts from one party to the other is where most interactions fail. Design these transitions:
- **Explicit handoff**: "I've drafted three options. Which direction do you want to go?" — the AI clearly passes control.
- **Implicit handoff**: The AI stops generating and waits, signalling the user's turn through UI affordance.
- **Negotiated handoff**: "I could take this further or stop here for your input. What do you prefer?"
- **Forced handoff**: The AI encounters a decision it can't make and must hand back to the human.
## When the AI Should Lead
The AI should take initiative when:
- The user is uncertain or exploring and needs guidance
- The task has a known best-practice sequence the AI can walk through
- The user has explicitly asked for help or coaching
- Proactive suggestions would save time without being intrusive
## When the User Should Lead
The user should retain control when:
- The task involves subjective judgment or creative direction
- Stakes are high and errors are costly
- The user has strong domain expertise
- Privacy or consent decisions are involved
## Anti-Patterns
- **Initiative whiplash**: Control bouncing back and forth too rapidly
- **Passive AI**: Never taking initiative even when it would help
- **Overbearing AI**: Taking over when the user wants control
- **Unclear ownership**: Neither party knows whose turn it is
## Design Artefacts
- Initiative maps showing who leads at each stage
- Handoff trigger definitions (what causes a transfer of control)
- Autonomy level specifications per feature area
EOF
cat > "$PLUGIN/skills/progressive-disclosure.md" << 'EOF'
---
name: progressive-disclosure
description: Revealing AI capability gradually to match user mental models.
---
# Progressive Disclosure
Users don't understand what AI can do. Progressive disclosure is how you reveal capabilities at the right pace — preventing both overwhelm and underuse.
## The Mental Model Gap
Users arrive with mental models shaped by previous technology. They may:
- Treat the AI like a search engine (keyword queries)
- Treat it like a form (expecting rigid structure)
- Underestimate what it can do (asking for less than it offers)
- Overestimate what it can do (expecting perfection)
Progressive disclosure bridges the gap between what users think the AI does and what it actually does.
## Disclosure Strategies
- **On-demand hints**: Show capability suggestions contextually ("Did you know you can also ask me to...")
- **Escalating examples**: Start with simple use cases, reveal complex ones as the user gains confidence
- **Feature graduation**: Unlock advanced features after the user demonstrates comfort with basics
- **Contextual teaching**: When the user attempts something inefficiently, show a better approach
- **Capability boundaries**: Clearly communicate what the AI cannot do, not just what it can
## Layered Capability Revelation
Structure capabilities in layers:
1. **Surface layer**: The most obvious, lowest-risk capabilities. Users discover these immediately.
2. **Intermediate layer**: More powerful features revealed through tooltips, suggestions, or first-use prompts.
3. **Power layer**: Advanced capabilities for experienced users — available but not promoted.
## Pacing
- **Too fast**: Users feel overwhelmed, ignore capabilities, or lose trust
- **Too slow**: Users get bored, think the product is limited, churn
- **Just right**: Each new capability feels like a natural next step
## Design Artefacts
- Capability disclosure maps showing what's revealed when
- Mental model progression diagrams
- First-use experience flows with disclosure triggers
- Capability tier definitions (surface, intermediate, power)
EOF
cat > "$PLUGIN/skills/multimodal-orchestration.md" << 'EOF'
---
name: multimodal-orchestration
description: Coordinating text, image, voice, and tool-use modalities in a single interaction.
---
# Multimodal Orchestration
AI interactions increasingly span multiple modalities — text, images, voice, code, tools, and structured data. Designing how these modalities work together is orchestration.
## Modality Selection
Each modality has strengths:
- **Text**: Precise, editable, referenceable. Best for instructions, explanations, and nuanced content.
- **Image**: Spatial, holistic, immediate. Best for layouts, diagrams, and visual concepts.
- **Voice**: Natural, hands-free, emotional. Best for conversational flow and accessibility.
- **Code**: Executable, precise, verifiable. Best for technical specifications and automation.
- **Structured data**: Tables, forms, JSON. Best for comparison, configuration, and data entry.
- **Tool use**: Actions in external systems. Best for execution, not just generation.
The designer decides which modality the AI uses for each part of a response — and which modality the user uses for each input.
## Cross-Modal Transitions
When the interaction switches modalities, design the transition:
- **Text to image**: "Here's what that layout could look like" — the AI generates a visual from a text description
- **Image to text**: The user uploads a screenshot, the AI describes or critiques it
- **Text to tool**: The AI writes a plan, then executes it via tool use
- **Voice to text**: Spoken conversation captured and summarised as structured notes
Transitions should feel seamless. The user shouldn't have to manually switch modes.
## Modality Conflicts
Sometimes modalities compete:
- Text says one thing, the image shows another
- Voice tone contradicts text content
- Structured output doesn't match the conversational context
Design for consistency across modalities. Establish a primary modality for each interaction type and treat others as supporting.
## Design Artefacts
- Modality maps showing which modality is used at each interaction point
- Cross-modal transition specifications
- Input/output modality matrices per feature
- Fallback definitions when a modality is unavailable
EOF
cat > "$PLUGIN/skills/context-window-design.md" << 'EOF'
---
name: context-window-design
description: Designing around token limits, memory, and conversation persistence.
---
# Context Window Design
Every AI model has a finite context window. Designing within this constraint — and designing the user experience around it — is a core skill for AI product design.
## The Context Window as a Design Material
The context window is not just a technical limitation. It's a design material:
- **What goes in**: System prompts, conversation history, retrieved documents, tool results, user preferences
- **What gets dropped**: Older messages, less relevant context, verbose instructions
- **What the user sees**: The conversation as presented may differ from what the model actually processes
Designers must understand context window allocation to design reliable experiences.
## Memory and Persistence
Users expect AI to remember. Design for different memory horizons:
- **Within-conversation memory**: What was said earlier in this chat. Usually handled by the context window itself.
- **Cross-conversation memory**: Preferences, past decisions, ongoing projects. Requires explicit memory systems.
- **Shared memory**: Context shared across multiple users or agents. Requires careful privacy design.
## Strategies for Limited Context
- **Summarisation**: Compress earlier conversation into summaries to free up tokens
- **Retrieval-augmented generation**: Pull in relevant context on demand rather than keeping everything loaded
- **Priority ordering**: Put the most important context closest to the prompt (recency bias in attention)
- **User-controlled context**: Let users pin, remove, or prioritise what the AI remembers
- **Graceful degradation**: When context is lost, acknowledge it rather than hallucinating continuity
## Design Artefacts
- Context budget allocations (how many tokens for system prompt, history, retrieval, etc.)
- Memory architecture diagrams showing what persists and what's ephemeral
- Context overflow UX flows (what happens when the window fills up)
- User-facing memory controls specification
EOF
cat > "$PLUGIN/skills/generative-ui.md" << 'EOF'
---
name: generative-ui
description: Designing interfaces where AI generates UI components dynamically.
---
# Generative UI
Generative UI is when the AI creates interface elements on the fly — forms, cards, charts, layouts — rather than responding with plain text. The interface itself becomes a model output.
## What Generative UI Changes
Traditional UI is designed ahead of time. Generative UI is created in the moment:
- **Static UI**: Designer creates all possible screens. Developer builds them. User navigates between them.
- **Generative UI**: The AI creates interface elements in response to user needs. No screen was pre-designed.
This shifts the designer's role from designing screens to designing the rules, constraints, and patterns the AI uses to generate screens.
## Design Constraints for Generated UI
The AI needs guardrails for what it generates:
- **Component library**: A defined set of components the AI can compose (cards, tables, forms, charts, buttons)
- **Layout rules**: Grid systems, spacing, hierarchy rules the AI must follow
- **Style boundaries**: Colour, typography, and visual style the AI must stay within
- **Interaction patterns**: How generated elements behave (clickable, editable, dismissible)
- **Accessibility requirements**: Generated UI must meet accessibility standards automatically
## When to Use Generative UI
Generative UI is powerful when:
- The output is structured data that benefits from visual presentation (tables, charts, comparisons)
- The user's request implies an interface (e.g., "show me a dashboard of...")
- Interactive elements would be more useful than text (e.g., forms, selectors, toggles)
- The content is highly variable and can't be pre-designed for every case
## When Not to Use It
- When plain text is clearer and simpler
- When the generated UI could be confusing or inconsistent
- When accessibility cannot be guaranteed
- When the user expects a predictable, stable interface
## Design Artefacts
- Generative UI component libraries (what the AI can use)
- Generation rules and constraints specification
- Quality criteria for generated interfaces
- Fallback designs for when generation fails
EOF
cat > "$PLUGIN/skills/feedback-loops.md" << 'EOF'
---
name: feedback-loops
description: User correction, thumbs up/down, inline editing, and reinforcement signals.
---
# Feedback Loops
Feedback loops are how users tell the AI what's working and what isn't. Designing these loops well is the difference between an AI that improves over time and one that repeats the same mistakes.
## Types of Feedback
- **Explicit feedback**: Thumbs up/down, star ratings, "this was helpful/not helpful" buttons
- **Implicit feedback**: Regeneration (user asks again), editing (user modifies the output), abandonment (user leaves)
- **Corrective feedback**: User provides the right answer ("No, I meant X not Y")
- **Preference feedback**: User chooses between alternatives ("I prefer option B")
- **Contextual feedback**: Feedback tied to a specific part of the output, not the whole response
## Designing for Correction
The most valuable feedback is correction — but it's also the hardest to design for:
- **Inline editing**: Let users edit AI output directly. Track what they change.
- **Partial acceptance**: Let users keep some parts and reject others.
- **Explanation requests**: "Why did you do it this way?" — the user's question reveals what went wrong.
- **Redo with guidance**: "Try again but make it more formal" — correction through re-prompting.
## Feedback Timing
When to ask for feedback matters:
- **Too early**: User hasn't evaluated the output yet. Feedback is premature.
- **Too late**: User has moved on. The moment for feedback has passed.
- **Interruptive**: Modal dialogs or required ratings break flow.
- **Ambient**: Passive signals (edits, regeneration) collected without asking.
Design for ambient feedback first. Add explicit feedback sparingly.
## Closing the Loop
Feedback is only valuable if it changes something. The user needs to see that their feedback matters:
- **Immediate adaptation**: The AI adjusts in the current conversation
- **Persistent learning**: The AI remembers preferences across sessions
- **Acknowledgment**: "I'll keep that in mind" — even if adaptation is delayed
## Design Artefacts
- Feedback mechanism inventory per feature
- Implicit signal definitions (what counts as positive/negative)
- Feedback-to-adaptation mapping (what changes based on what feedback)
- Correction flow specifications
EOF
# === COMMANDS ===
cat > "$PLUGIN/commands/design-conversation.md" << 'EOF'
---
description: Design a complete human-AI conversation flow for a feature.
argument-hint: "[feature or task description]"
---
You are designing a human-AI conversation flow. Use only skills from the model-interaction-design plugin.
Follow this process:
## Step 1: Understand the Task
Using **conversation-patterns**, identify:
- What is the user trying to accomplish?
- What information does the AI need from the user?
- What information does the user need from the AI?
- What's the expected conversation length (2 turns or 20)?
## Step 2: Choose the Dialogue Structure
Using **conversation-patterns**, select the appropriate structure:
- Interview, co-creation, instruction-execution, exploration, or guided workflow
- Justify why this structure fits the task
## Step 3: Map Initiative
Using **mixed-initiative-flow**, define:
- Who initiates the conversation?
- Where does initiative shift from user to AI and back?
- What triggers each handoff?
- Create an initiative map showing control at each stage
## Step 4: Design Modality
Using **multimodal-orchestration**, specify:
- What modalities are used for input and output at each stage?
- Where do cross-modal transitions happen?
- What's the primary modality and what's supporting?
## Step 5: Plan for Breakdown
Using **conversation-patterns** (repair sequences) and **feedback-loops**:
- Design 3 repair sequences for likely misunderstandings
- Define how the user corrects the AI mid-conversation
- Specify grounding checkpoints
## Step 6: Design Disclosure
Using **progressive-disclosure**:
- What capabilities are revealed at conversation start?
- What's revealed as the conversation progresses?
- How does the AI teach the user what else it can do?
## Output
Deliver a complete conversation design document:
1. Conversation flow diagram (text-based) showing all turns
2. Initiative map
3. Modality specification per stage
4. Repair protocol
5. Disclosure plan
6. 3 example conversation transcripts (happy path, error recovery, edge case)
EOF
cat > "$PLUGIN/commands/audit-interaction.md" << 'EOF'
---
description: Evaluate an existing AI interaction against interaction mode taxonomies.
argument-hint: "[description of AI interaction to audit, or paste a conversation transcript]"
---
You are auditing an existing human-AI interaction. Use only skills from the model-interaction-design plugin.
Follow this process:
## Step 1: Classify the Interaction Mode
Using **conversation-patterns**, identify:
- What dialogue structure is being used? (interview, co-creation, instruction-execution, exploration, guided workflow)
- Is this the right structure for the task?
- Are there moments where the structure breaks down?
## Step 2: Evaluate Turn-Taking
Using **conversation-patterns**:
- Are turns appropriately sized for the task?
- Does the AI know when to stop talking?
- Are there awkward turn boundaries?
- Rate turn-taking quality (1-5) with justification
## Step 3: Assess Initiative Balance
Using **mixed-initiative-flow**:
- Who leads at each stage? Is this appropriate?
- Are handoffs clean or confusing?
- Does the AI take initiative when it should? Hold back when it should?
- Are there initiative anti-patterns (whiplash, passive AI, overbearing AI)?
## Step 4: Check Repair Mechanisms
Using **conversation-patterns** and **feedback-loops**:
- When misunderstandings happen, how are they repaired?
- Can the user correct the AI easily?
- Does the AI acknowledge and recover from errors?
- Are there grounding checkpoints?
## Step 5: Evaluate Disclosure
Using **progressive-disclosure**:
- Does the user know what the AI can do?
- Are capabilities revealed at the right pace?
- Is there evidence of underuse (user doesn't know about features)?
## Step 6: Review Context Design
Using **context-window-design**:
- Does the AI maintain context across the conversation?
- Are there moments where context is lost?
- Is memory handled gracefully?
## Output
Deliver an interaction audit report:
1. Overall quality score (1-5) with justification
2. Findings table: Issue | Severity | Skill Area | Recommendation
3. Top 3 improvements ranked by impact
4. Revised conversation flow showing recommended changes
EOF
cat > "$PLUGIN/commands/map-initiative.md" << 'EOF'
---
description: Map who leads at each stage of an AI-powered workflow.
argument-hint: "[AI-powered workflow or feature to map]"
---
You are creating an initiative map for an AI-powered workflow. Use only skills from the model-interaction-design plugin.
Follow this process:
## Step 1: Break Down the Workflow
Identify every stage in the workflow from start to finish:
- What triggers the workflow?
- What are the key decision points?
- What are the outputs at each stage?
- Where does the workflow end?
## Step 2: Assign Initiative
Using **mixed-initiative-flow**, for each stage determine:
- **Who leads**: User, AI, or shared
- **Why**: What makes this the right assignment?
- **Autonomy level**: Full autonomy, supervised autonomy, advisory, or passive
## Step 3: Design Handoff Points
Using **mixed-initiative-flow**, for each transition:
- What triggers the handoff?
- Is it explicit, implicit, negotiated, or forced?
- What information transfers with control?
- What could go wrong at this handoff?
## Step 4: Identify Feedback Points
Using **feedback-loops**, mark where:
- The user can course-correct
- The AI should check in before proceeding
- Implicit feedback is being collected
- Explicit feedback should be requested
## Step 5: Stress Test
Using **mixed-initiative-flow** (anti-patterns):
- Where might initiative whiplash occur?
- Where might the AI be too passive or too aggressive?
- What happens if the user tries to take control at an AI-led stage?
- What happens if the user goes silent at a user-led stage?
## Output
Deliver a complete initiative map:
1. Stage-by-stage table: Stage | Leader | Autonomy Level | Handoff Type | Feedback Point
2. Visual initiative timeline (text-based) showing control flow
3. Handoff protocol specifications for each transition
4. Risk assessment for each handoff point
5. Recommendations for rebalancing initiative if needed
EOF
echo "✅ $PLUGIN complete — 7 skills, 3 commands"
