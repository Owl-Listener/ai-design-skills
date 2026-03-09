#!/bin/bash
set -e
PLUGIN="prompt-architecture"
echo "🔨 Building $PLUGIN..."
# Create directory structure
mkdir -p "$PLUGIN/.claude-plugin"
mkdir -p "$PLUGIN/skills"
mkdir -p "$PLUGIN/commands"
# plugin.json
cat > "$PLUGIN/.claude-plugin/plugin.json" << 'EOF'
{
  "name": "prompt-architecture",
  "description": "Structure prompts as design artefacts — system prompts, templates, chains, and reusable patterns.",
  "skills": "../skills",
  "commands": "../commands"
}
EOF
# README
cat > "$PLUGIN/README.md" << 'EOF'
# Prompt Architecture
Structure prompts as design artefacts — system prompts, templates, chains, and reusable patterns.
## Skills
| Skill | Description |
|-------|-------------|
| system-prompt-structure | Anatomy of effective system prompts: role, context, constraints, format. |
| template-design | Creating reusable, parameterised prompt templates for consistent outputs. |
| chain-of-thought-design | Designing reasoning chains that produce better outputs. |
| few-shot-patterns | Crafting examples that steer AI behavior effectively. |
| constraint-specification | Defining output format, length, tone, and content boundaries within prompts. |
| prompt-versioning | Managing prompt iterations, testing changes, and tracking what works. |
| context-engineering | Designing what information goes into the context window and in what order. |
## Commands
| Command | Description |
|---------|-------------|
| `/prompt-architecture:design-prompt` | Create a structured system prompt for an AI feature. |
| `/prompt-architecture:build-chain` | Design a multi-step prompt chain for a complex task. |
| `/prompt-architecture:audit-prompt` | Evaluate an existing prompt for clarity, effectiveness, and edge cases. |
EOF
# === SKILLS ===
cat > "$PLUGIN/skills/system-prompt-structure.md" << 'EOF'
---
name: system-prompt-structure
description: Anatomy of effective system prompts — role, context, constraints, format.
---
# System Prompt Structure
A system prompt is the most important piece of design in an AI product. It defines who the AI is, what it knows, how it behaves, and what it produces. It's the equivalent of a brand guide, interaction spec, and behavioral contract rolled into one document.
## Anatomy of a System Prompt
A well-structured system prompt has distinct sections, each serving a specific purpose:
**1. Identity and Role**
Who is the AI? What's its purpose? This anchors everything that follows.
- "You are a senior UX researcher helping design teams..."
- Keep it specific. "You are a helpful assistant" is too vague to produce consistent behavior.
**2. Context and Knowledge**
What does the AI know? What's its domain? What information is it working with?
- Domain boundaries: what it's an expert in and what's outside its scope
- Background information relevant to the task
- User context: who it's talking to and what they need
**3. Behavioral Rules**
How should the AI behave? What are the do's and don'ts?
- Tone and voice specifications
- Response format preferences
- Guardrails and prohibited behaviors
- Interaction style (ask clarifying questions, be concise, think step by step)
**4. Output Specifications**
What should the AI produce? In what format?
- Expected output structure
- Length guidelines
- Format requirements (markdown, JSON, plain text)
- Quality criteria
**5. Examples (optional but powerful)**
Concrete demonstrations of expected behavior.
- Input-output pairs showing ideal responses
- Edge cases showing how to handle tricky situations
## Structure Principles
- **Order matters**: Models pay more attention to content at the beginning and end of the prompt. Put the most important instructions first.
- **Specificity beats length**: A short, specific prompt outperforms a long, vague one.
- **Positive instructions beat negative**: "Do X" is clearer than "Don't do Y" — though both have their place.
- **Separation of concerns**: Keep identity, rules, and output specs in distinct sections.
- **Testability**: Every instruction in the prompt should be testable. If you can't tell whether the AI followed it, rewrite it.
## Common Structural Mistakes
- **Kitchen sink prompts**: Cramming every possible instruction in. The model can't prioritise.
- **Contradictory instructions**: Rules that conflict with each other, forcing the model to guess which to follow.
- **Implicit expectations**: Assuming the model knows what you want without saying it.
- **Scattered instructions**: The same topic addressed in multiple places, creating inconsistency.
- **Static prompts**: Never updating the prompt based on what actually works.
## Design Artefacts
- System prompt document with labelled sections
- Prompt requirement specifications (what the prompt must achieve)
- Prompt review checklists
- Version history with change rationale
EOF
cat > "$PLUGIN/skills/template-design.md" << 'EOF'
---
name: template-design
description: Creating reusable, parameterised prompt templates for consistent outputs.
---
# Template Design
A prompt template is a reusable prompt structure with variable slots that get filled at runtime. Templates create consistency across similar tasks and make prompt management scalable.
## Template Anatomy
A template has:
- **Fixed text**: The parts that stay the same every time (instructions, format, role)
- **Variables**: Slots that get filled with specific content (user input, retrieved data, configuration)
- **Conditional sections**: Parts that appear or disappear based on context
- **Default values**: What fills a variable if no specific value is provided
## Designing Variables
Each variable should be:
- **Named clearly**: `{user_query}` not `{input1}`
- **Typed**: Is it free text, a selection from options, a number, a boolean?
- **Bounded**: What are valid values? What's the maximum length?
- **Documented**: What is this variable for? Where does its value come from?
- **Defaulted**: What happens if the value is missing?
## Template Patterns
- **Task template**: A template for a specific type of task. Variables capture the task-specific details while instructions remain constant.
- **Persona template**: A template where the persona is variable but the task structure is fixed. Useful for multi-persona products.
- **Format template**: A template where the output format is variable but the analysis approach is fixed.
- **Escalation template**: A base template with additional sections that activate at higher complexity levels.
## Template Composition
Complex prompts can be built from smaller templates:
- **Base template**: Core instructions that apply to everything
- **Task overlay**: Task-specific instructions layered on top
- **Context injection**: Retrieved information inserted at a specific point
- **User preferences**: Personal settings that modify behavior
## Template Quality Criteria
- **Consistency**: The template produces reliably similar outputs for similar inputs
- **Flexibility**: The variables allow enough variation for diverse use cases
- **Clarity**: The template is easy to read, maintain, and modify
- **Testability**: You can verify the template works with a standard set of test inputs
- **Maintainability**: Changes to one part don't break other parts
## Design Artefacts
- Template library with documentation
- Variable specifications per template
- Test input sets for each template
- Template versioning and change log
- Composition rules for combining templates
EOF
cat > "$PLUGIN/skills/chain-of-thought-design.md" << 'EOF'
---
name: chain-of-thought-design
description: Designing reasoning chains that produce better outputs.
---
# Chain-of-Thought Design
Chain-of-thought prompting asks the AI to show its reasoning step by step before arriving at an answer. When designed well, this produces more accurate, more nuanced, and more trustworthy outputs. When designed poorly, it produces verbose justification of bad answers.
## When Chain-of-Thought Helps
- **Complex reasoning**: Multi-step problems where the answer depends on intermediate conclusions
- **Ambiguous inputs**: When the AI needs to consider multiple interpretations
- **High-stakes outputs**: When you need to verify the reasoning, not just the answer
- **Creative exploration**: When generating ideas benefits from building on each step
- **Analytical tasks**: Comparisons, evaluations, and trade-off analyses
## When Chain-of-Thought Hurts
- **Simple lookups**: "What's the capital of France?" doesn't need step-by-step reasoning
- **Speed-critical responses**: Reasoning adds latency and token cost
- **Pattern-matching tasks**: Some tasks are better served by direct response
- **When reasoning is wrong**: The AI can reason convincingly toward an incorrect conclusion
## Designing Reasoning Chains
A reasoning chain has structure. Design it deliberately:
**1. Problem decomposition**
"First, break this problem into its component parts."
**2. Evidence gathering**
"For each part, identify what you know and what you're uncertain about."
**3. Analysis**
"Analyse each component, noting assumptions and limitations."
**4. Synthesis**
"Combine your analysis into an overall assessment."
**5. Conclusion**
"State your conclusion and your confidence level."
## Chain Variants
- **Linear chain**: Step 1 → Step 2 → Step 3 → Answer. Simple and predictable.
- **Branching chain**: Consider multiple paths, evaluate each, then choose. Better for decisions.
- **Iterative chain**: Draft an answer, critique it, revise it. Better for quality refinement.
- **Debate chain**: Argue for and against a position, then synthesise. Better for balanced analysis.
## Controlling Chain Quality
- **Specify the steps**: Don't just say "think step by step." Define what the steps are.
- **Limit reasoning depth**: Set a maximum number of steps or reasoning length to prevent runaway chains.
- **Separate thinking from output**: Let the AI reason internally, then produce a clean final output.
- **Validate intermediate steps**: Check that each step is sound, not just the final answer.
## Design Artefacts
- Chain-of-thought templates per task type
- Reasoning step specifications
- Chain variant selection guidelines
- Quality checkpoints for intermediate steps
- Examples of well-structured and poorly-structured chains
EOF
cat > "$PLUGIN/skills/few-shot-patterns.md" << 'EOF'
---
name: few-shot-patterns
description: Crafting examples that steer AI behavior effectively.
---
# Few-Shot Patterns
Few-shot prompting provides examples of input-output pairs that demonstrate the desired behavior. The AI learns the pattern from the examples and applies it to new inputs. The quality of examples directly determines the quality of outputs.
## Why Examples Work
Examples communicate what instructions alone cannot:
- **Implicit patterns**: The AI picks up on format, style, and reasoning patterns from examples without being told explicitly
- **Ambiguity resolution**: When instructions could be interpreted multiple ways, examples show which interpretation you want
- **Quality calibration**: Examples set the bar for output quality, length, and depth
- **Edge case handling**: Examples of tricky cases teach the AI how to handle similar situations
## Example Design Principles
**Diversity**: Examples should cover different scenarios, not repeat the same type
- Include easy cases, hard cases, and edge cases
- Vary the input format and content
- Show different valid output formats if applicable
**Clarity**: Each example should demonstrate one clear pattern
- Avoid examples that could be interpreted multiple ways
- Make the mapping from input to output obvious
- Remove irrelevant variation between examples
**Quality**: Examples set the ceiling for output quality
- Every example should be one you'd be happy to ship
- If the example has a flaw, the AI will replicate that flaw
- Invest time in crafting examples — they're worth more than instructions
**Ordering**: The position of examples matters
- Put the most representative example first
- Put edge cases after common cases
- End with an example closest to the expected input type
## How Many Examples
- **Zero-shot**: No examples. Relies entirely on instructions. Good for simple, well-understood tasks.
- **One-shot**: Single example. Enough when the pattern is straightforward.
- **Few-shot (3-5)**: Multiple examples. Best for complex patterns or nuanced quality requirements.
- **Many-shot (5+)**: Diminishing returns but useful for highly variable tasks or when consistency is critical.
Balance example count against context window cost. More examples means less room for other context.
## Anti-Patterns
- **Identical examples**: All examples are basically the same, teaching nothing about variation
- **Perfect-only examples**: No examples of how to handle imperfect inputs or edge cases
- **Contradictory examples**: Examples that demonstrate inconsistent patterns
- **Low-quality examples**: Sloppy examples produce sloppy outputs
- **Outdated examples**: Examples that no longer reflect current requirements
## Design Artefacts
- Example libraries per task type
- Example quality rubrics
- Example selection guidelines
- Example maintenance and update schedules
- Example effectiveness testing results
EOF
cat > "$PLUGIN/skills/constraint-specification.md" << 'EOF'
---
name: constraint-specification
description: Defining output format, length, tone, and content boundaries within prompts.
---
# Constraint Specification
Constraints are the rules that shape AI output — what format to use, how long to be, what to include, what to exclude. Well-specified constraints produce predictable, useful outputs. Vague constraints produce inconsistent results.
## Types of Constraints
**Format constraints:**
- Output structure (JSON, markdown, plain text, bullet points, prose)
- Section headings and organisation
- Required fields and optional fields
- Data types and schemas
**Length constraints:**
- Word count ranges (not exact numbers — models are bad at counting)
- Section length proportions ("spend 60% on analysis, 40% on recommendations")
- Minimum and maximum bounds
- Conciseness directives ("be brief" vs. "be thorough")
**Content constraints:**
- Topics to include and exclude
- Required information elements
- Prohibited content
- Source restrictions (only use provided context, don't use external knowledge)
**Tone constraints:**
- Formality level
- Emotional register
- Audience-appropriate language
- Voice and style guidelines
**Quality constraints:**
- Accuracy requirements ("cite sources", "flag uncertainty")
- Completeness requirements ("address all aspects of the question")
- Originality requirements ("don't repeat the question back")
- Actionability requirements ("every recommendation must be implementable")
## Writing Effective Constraints
- **Be specific**: "Keep responses under 200 words" beats "be concise"
- **Prioritise**: When constraints conflict, state which wins. "Accuracy over brevity."
- **Provide examples**: Show what a constrained output looks like
- **Test boundaries**: What happens at the edge of each constraint?
- **Separate hard and soft constraints**: Hard constraints must always be met. Soft constraints are preferences.
## Constraint Interactions
Constraints interact and can conflict:
- "Be thorough" vs. "Keep it under 100 words"
- "Be creative" vs. "Follow this exact format"
- "Be helpful" vs. "Don't give medical advice"
Resolve conflicts explicitly in the prompt. Don't make the model guess which constraint takes priority.
## Design Artefacts
- Constraint specification documents per output type
- Constraint priority hierarchies
- Constraint test cases (inputs designed to stress each constraint)
- Constraint violation examples (what bad looks like)
- Constraint evolution logs (how constraints changed and why)
EOF
cat > "$PLUGIN/skills/prompt-versioning.md" << 'EOF'
---
name: prompt-versioning
description: Managing prompt iterations, testing changes, and tracking what works.
---
# Prompt Versioning
Prompts are code. They should be versioned, tested, reviewed, and deployed with the same rigor as software. Treating prompts as casual text that anyone can edit leads to quality regressions, inconsistent behavior, and debugging nightmares.
## Why Version Prompts
- **Accountability**: Know who changed what and when
- **Rollback**: Revert to a previous version when a change causes problems
- **Testing**: Compare performance of different versions
- **Collaboration**: Multiple people can work on prompts without overwriting each other
- **Audit trail**: Understand how the prompt evolved and why
## Versioning Practices
- **Source control**: Store prompts in version control (Git, etc.), not in application configuration
- **Meaningful commits**: Each change should explain what was changed and why
- **Change categories**: Classify changes as bug fixes, improvements, new features, or experiments
- **Review process**: Prompt changes should be reviewed before deployment, like code reviews
- **Semantic versioning**: Major changes (behavioral shift), minor changes (new capability), patches (bug fixes)
## Testing Prompt Changes
Before deploying a prompt change:
- **Regression testing**: Run the golden test set against the new version. Did anything get worse?
- **Targeted testing**: Test the specific scenario the change was designed to improve
- **Edge case testing**: Test edge cases related to the change
- **A/B testing**: For significant changes, run both versions in production and compare
- **User testing**: For major persona or behavioral changes, test with real users
## Prompt Change Management
- **Staging environment**: Test prompt changes in a non-production environment first
- **Gradual rollout**: Deploy to a percentage of users, monitor, then expand
- **Feature flags**: Toggle prompt features on and off without deployment
- **Monitoring**: Watch quality metrics closely after any prompt change
- **Rollback plan**: Always know how to revert if the change causes problems
## Common Versioning Mistakes
- **Untracked changes**: Editing prompts in production without recording the change
- **Untested changes**: Deploying changes without testing against known scenarios
- **Big bang changes**: Changing many things at once, making it impossible to know what helped or hurt
- **Lost context**: Changing a prompt without understanding why the previous version was written that way
## Design Artefacts
- Prompt repository structure
- Change review checklists
- Testing protocols per change type
- Deployment and rollback procedures
- Prompt change request templates
EOF
cat > "$PLUGIN/skills/context-engineering.md" << 'EOF'
---
name: context-engineering
description: Designing what information goes into the context window and in what order.
---
# Context Engineering
The context window is finite. What goes into it — and in what order — determines the quality of every output. Context engineering is the practice of deliberately designing the information architecture of the context window.
## The Context Budget
Every context window has a token budget. Allocate it deliberately:
- **System prompt**: The foundational instructions (typically 5-20% of the budget)
- **Retrieved context**: Documents, data, and information pulled in for the current task
- **Conversation history**: Previous turns in the conversation
- **User input**: The current request
- **Working space**: Room for the model to generate its response
These compete for space. More retrieved context means less conversation history. A longer system prompt means less room for everything else.
## Information Architecture in Context
Order matters. The model pays different amounts of attention to different positions:
- **Beginning**: High attention. Put your most important instructions here.
- **Middle**: Lower attention. This is where information can get lost in long contexts.
- **End**: High attention. The most recent information (user input) naturally goes here.
- **Adjacent to the task**: Information placed right before the user's question gets more attention than information earlier in the context.
## Context Selection
Not everything should go into the context. Design selection criteria:
- **Relevance**: Does this information help answer the current question?
- **Recency**: Is this the most up-to-date information available?
- **Specificity**: Is this specific enough to be useful, or is it too generic?
- **Redundancy**: Is this information already covered elsewhere in the context?
- **Authority**: Is this from a reliable source?
## Context Strategies
- **Retrieval-augmented generation (RAG)**: Pull relevant documents into the context dynamically
- **Summarisation**: Compress older context into summaries to free up space
- **Prioritised history**: Keep recent and important conversation turns, drop less important ones
- **Structured context**: Organise information with clear headers and sections so the model can navigate it
- **Context caching**: Pre-compute and cache frequently used context blocks
## Context Quality Signals
How to tell if your context engineering is working:
- **Output relevance**: Do outputs address the actual question using the provided context?
- **Hallucination rate**: Is the model making things up because the context is insufficient?
- **Context utilisation**: Is the model actually using the provided context, or ignoring it?
- **Consistency**: Are outputs consistent when the same context is provided?
## Design Artefacts
- Context budget allocation documents
- Information architecture diagrams for the context window
- Context selection criteria per feature
- Retrieval strategy specifications
- Context quality monitoring metrics
EOF
# === COMMANDS ===
cat > "$PLUGIN/commands/design-prompt.md" << 'EOF'
---
description: Create a structured system prompt for an AI feature.
argument-hint: "[AI feature or product to design a system prompt for]"
---
You are designing a system prompt. Use only skills from the prompt-architecture plugin.
Follow this process:
## Step 1: Define Requirements
- What is this AI feature for?
- Who are the users?
- What should the AI do? What should it NOT do?
- What output format and quality is expected?
## Step 2: Structure the Prompt
Using **system-prompt-structure**:
- Write the Identity and Role section
- Write the Context and Knowledge section
- Write the Behavioral Rules section
- Write the Output Specifications section
- Ensure sections are clearly separated and ordered by importance
## Step 3: Design Constraints
Using **constraint-specification**:
- Define format constraints (output structure, required fields)
- Define length constraints (word count ranges, section proportions)
- Define content constraints (topics to include/exclude, source restrictions)
- Define tone constraints (formality, voice, audience)
- Define quality constraints (accuracy, completeness, actionability)
- Establish constraint priority hierarchy
## Step 4: Add Examples
Using **few-shot-patterns**:
- Create 2-3 input-output examples demonstrating ideal behavior
- Include one common case and one edge case
- Ensure examples are high quality and consistent with the constraints
## Step 5: Design Context Integration
Using **context-engineering**:
- Define where retrieved context will be injected
- Specify context selection criteria
- Allocate the context budget across sections
- Design the information architecture within the prompt
## Step 6: Plan for Iteration
Using **prompt-versioning**:
- Document the rationale for key design decisions
- Define test cases for evaluating the prompt
- Establish the review and deployment process
## Output
Deliver a complete system prompt package:
1. The system prompt itself (ready to use)
2. Prompt design rationale document
3. Constraint specification
4. Example library (2-3 examples)
5. Context integration specification
6. Test cases for validation
7. Version notes (v1.0)
EOF
cat > "$PLUGIN/commands/build-chain.md" << 'EOF'
---
description: Design a multi-step prompt chain for a complex task.
argument-hint: "[complex task that requires multiple prompt steps]"
---
You are designing a prompt chain. Use only skills from the prompt-architecture plugin.
Follow this process:
## Step 1: Understand the Task
- What is the end goal?
- Why can't a single prompt accomplish this?
- What are the intermediate outputs needed?
## Step 2: Design the Chain Structure
Using **chain-of-thought-design**:
- Choose the chain variant: linear, branching, iterative, or debate
- Define each step in the chain
- For each step, define the input (from user or previous step) and expected output
- Map dependencies between steps
## Step 3: Design Each Step's Prompt
Using **system-prompt-structure** and **constraint-specification**:
- For each step, write the prompt
- Define constraints specific to that step
- Ensure each step's output format matches the next step's expected input
## Step 4: Design Templates
Using **template-design**:
- Identify which parts of each prompt are fixed and which are variable
- Create templates for each step with clearly defined variables
- Define how outputs from one step feed into variables of the next
## Step 5: Add Examples Per Step
Using **few-shot-patterns**:
- For each step, provide at least one example of expected input and output
- Ensure examples flow coherently across the chain
## Step 6: Design Context Flow
Using **context-engineering**:
- Define what context carries forward between steps
- Specify what gets summarised or dropped between steps
- Allocate context budgets per step
- Design the overall information flow through the chain
## Step 7: Design Failure Handling
- What happens if a step produces poor output?
- Define retry logic and quality gates between steps
- Design fallback paths for chain failures
## Output
Deliver a complete prompt chain specification:
1. Chain overview diagram showing all steps and connections
2. Individual prompts for each step
3. Templates with variable definitions
4. Context flow specification
5. Examples flowing through the full chain
6. Failure handling and quality gates
7. Estimated token budget per step and total
EOF
cat > "$PLUGIN/commands/audit-prompt.md" << 'EOF'
---
description: Evaluate an existing prompt for clarity, effectiveness, and edge cases.
argument-hint: "[paste the prompt to audit, or describe where to find it]"
---
You are auditing an existing prompt. Use only skills from the prompt-architecture plugin.
Follow this process:
## Step 1: Structural Analysis
Using **system-prompt-structure**:
- Does the prompt have clear, separated sections?
- Is identity/role defined clearly?
- Are behavioral rules explicit and non-contradictory?
- Are output specifications concrete?
- Is the most important content at the beginning?
- Score structure quality (1-5)
## Step 2: Constraint Analysis
Using **constraint-specification**:
- Are constraints specific and measurable?
- Are there constraint conflicts?
- Is there a clear priority hierarchy?
- Are there missing constraints that should be added?
- Score constraint quality (1-5)
## Step 3: Example Analysis
Using **few-shot-patterns**:
- Are there examples? Are there enough?
- Do examples demonstrate the right behavior?
- Are examples diverse and high-quality?
- Do examples match the stated constraints?
- Score example quality (1-5)
## Step 4: Context Analysis
Using **context-engineering**:
- Is the context budget well-allocated?
- Is information ordered effectively?
- Is there unnecessary content consuming context space?
- Are context injection points well-designed?
- Score context design quality (1-5)
## Step 5: Edge Case Testing
Generate 5 challenging inputs and predict how the prompt would handle them:
- An ambiguous request
- A request at the boundary of the prompt's scope
- A very simple request (is the prompt over-engineered for simple cases?)
- A very complex request (does the prompt handle complexity?)
- An adversarial or tricky request
## Step 6: Versioning Assessment
Using **prompt-versioning**:
- Is the prompt versioned and tracked?
- Is there documentation for why it's written this way?
- Are there test cases?
- Is there a review process?
## Output
Deliver a prompt audit report:
1. Overall quality score (1-5) with justification
2. Section-by-section analysis with scores
3. Issues found: Issue | Severity | Category | Recommendation
4. Edge case analysis with predicted behavior
5. Top 5 improvements ranked by expected impact
6. Rewritten prompt (improved version) if significant changes are needed
EOF
echo "✅ $PLUGIN complete — 7 skills, 3 commands"
