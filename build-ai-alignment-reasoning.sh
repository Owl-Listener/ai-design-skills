#!/bin/bash
set -e
PLUGIN="ai-alignment-reasoning"
echo "🔨 Building $PLUGIN..."
# Create directory structure
mkdir -p "$PLUGIN/.claude-plugin"
mkdir -p "$PLUGIN/skills"
mkdir -p "$PLUGIN/commands"
# plugin.json
cat > "$PLUGIN/.claude-plugin/plugin.json" << 'EOF'
{
  "name": "ai-alignment-reasoning",
  "description": "Design guardrails, safety boundaries, value alignment, and ethical constraints into AI products.",
  "skills": "../skills",
  "commands": "../commands"
}
EOF
# README
cat > "$PLUGIN/README.md" << 'EOF'
# AI Alignment Reasoning
Design guardrails, safety boundaries, value alignment, and ethical constraints into AI products.
## Skills
| Skill | Description |
|-------|-------------|
| guardrail-design | Defining behavioral boundaries: what the AI should and shouldn't do. |
| value-specification | Translating organisational values and user expectations into system constraints. |
| harm-anticipation | Proactively identifying failure modes, misuse, and unintended consequences. |
| transparency-patterns | Showing users what the AI knows, doesn't know, and how confident it is. |
| consent-and-agency | Designing for informed user consent, opt-out, and human override. |
| bias-detection-design | Designing review workflows to surface and mitigate bias in AI outputs. |
| escalation-design | When and how AI should escalate to humans, refuse, or ask for clarification. |
## Commands
| Command | Description |
|---------|-------------|
| `/ai-alignment-reasoning:design-guardrails` | Create a complete guardrail specification for an AI feature. |
| `/ai-alignment-reasoning:red-team` | Run a structured red-teaming exercise to find alignment failures. |
| `/ai-alignment-reasoning:write-policy` | Draft an AI behavior policy covering safety, tone, and boundaries. |
EOF
# === SKILLS ===
cat > "$PLUGIN/skills/guardrail-design.md" << 'EOF'
---
name: guardrail-design
description: Defining behavioral boundaries — what the AI should and shouldn't do.
---
# Guardrail Design
Guardrails are the behavioral boundaries that define what an AI product will and won't do. They're not just safety constraints — they're design decisions that shape the entire user experience.
## Types of Guardrails
- **Content guardrails**: What topics the AI will and won't discuss. What it generates and refuses to generate.
- **Action guardrails**: What the AI can do in the world — send emails, make purchases, delete data — and what requires human approval.
- **Tone guardrails**: How the AI communicates — what language it uses, how formal or casual, when it's direct vs. diplomatic.
- **Scope guardrails**: What the AI considers in and out of scope for its role. A coding assistant shouldn't give medical advice.
- **Confidence guardrails**: When the AI should express uncertainty, hedge, or refuse rather than guessing.
## Designing Guardrails as Product Decisions
Every guardrail is a product decision with tradeoffs:
- **Too strict**: The product feels limited, frustrating, and paternalistic. Users route around the guardrails.
- **Too loose**: The product causes harm, loses trust, and creates liability.
- **Inconsistent**: Users can't predict what the AI will and won't do, eroding trust.
The goal is guardrails that feel like good judgment, not arbitrary restrictions.
## Guardrail Specification
For each guardrail, define:
- **What it prevents**: The specific behavior or output being constrained
- **Why it exists**: The harm it prevents or the value it protects
- **How it manifests**: What the user sees when the guardrail activates (refusal message, alternative suggestion, escalation)
- **Edge cases**: Grey areas where the guardrail might be too strict or too loose
- **Override conditions**: Whether and how the guardrail can be relaxed (admin settings, user confirmation, context-dependent)
## Guardrail Communication
How the AI communicates a guardrail matters as much as the guardrail itself:
- **Transparent refusal**: "I can't help with that because..." — honest about the boundary
- **Redirective refusal**: "I can't do X, but I can help you with Y" — offering alternatives
- **Silent guardrail**: The AI steers away from the boundary without mentioning it
- **Escalation**: "This needs a human to review" — handing off rather than refusing
## Design Artefacts
- Guardrail specification table: Category | Rule | Rationale | User Experience | Edge Cases
- Refusal message templates per guardrail type
- Guardrail severity tiers (hard block vs. soft warning vs. nudge)
- Testing scenarios for each guardrail
EOF
cat > "$PLUGIN/skills/value-specification.md" << 'EOF'
---
name: value-specification
description: Translating organisational values and user expectations into system constraints.
---
# Value Specification
Values are abstract. AI systems need concrete rules. Value specification is the design work of translating organisational principles and user expectations into implementable constraints.
## The Translation Problem
Organisations say things like "be helpful" and "be responsible." These are useless as system constraints because they conflict:
- Being maximally helpful might mean giving dangerous information
- Being maximally responsible might mean refusing to help at all
- Being "fair" means different things in different contexts
The designer's job is to resolve these tensions into specific, testable rules.
## Value Hierarchy
Not all values are equal. Establish a hierarchy:
1. **Safety**: Prevent harm to users and others. This overrides everything.
2. **Accuracy**: Don't mislead. When uncertain, say so.
3. **Helpfulness**: Actually accomplish what the user needs.
4. **Respect**: Treat users as capable adults. Don't patronise.
5. **Brand alignment**: Reflect the organisation's identity and tone.
When values conflict, the hierarchy resolves the conflict. A safety concern overrides helpfulness. Accuracy overrides brand voice.
## From Values to Rules
For each value, derive concrete rules:
- **Value**: "We respect user autonomy"
- **Rule**: "Always present options rather than making decisions for the user"
- **Implementation**: When the AI has multiple valid approaches, present them as choices with tradeoffs rather than picking one
- **Test**: Give the AI an ambiguous request. Does it ask the user to choose, or decide unilaterally?
## Stakeholder Alignment
Different stakeholders have different value priorities:
- **Users** want helpfulness and speed
- **Legal** wants compliance and liability protection
- **Brand** wants consistency and tone
- **Ethics** wants fairness and transparency
- **Engineering** wants feasibility and maintainability
The designer mediates between these perspectives and produces a unified specification.
## Design Artefacts
- Value hierarchy document with conflict resolution rules
- Value-to-rule mapping table
- Stakeholder value alignment matrix
- Test cases derived from value specifications
EOF
cat > "$PLUGIN/skills/harm-anticipation.md" << 'EOF'
---
name: harm-anticipation
description: Proactively identifying failure modes, misuse, and unintended consequences.
---
# Harm Anticipation
Harm anticipation is the practice of systematically thinking through how an AI product could cause harm — before it does. It's preventive design, not reactive crisis management.
## Categories of AI Harm
- **Direct harm**: The AI outputs something harmful — dangerous advice, discriminatory content, privacy violations
- **Facilitated harm**: The AI helps a user do something harmful — even if the AI's output itself is benign
- **Emergent harm**: Harmful patterns that emerge from scale or interaction effects, not from any single output
- **Omission harm**: The AI fails to act when it should — not flagging a crisis, not escalating when needed
- **Erosion harm**: Gradual negative effects — dependency, deskilling, manipulation, trust erosion
## Structured Harm Anticipation
Work through each harm category systematically:
1. **Who could be harmed?** The user, people the user interacts with, vulnerable populations, society at large
2. **How could they be harmed?** Physical, emotional, financial, reputational, privacy, autonomy
3. **What's the likelihood?** Common use case vs. edge case vs. adversarial attack
4. **What's the severity?** Inconvenience vs. distress vs. irreversible damage
5. **What's the detectability?** Obvious and immediate vs. subtle and delayed
## Misuse Scenarios
Think like an adversary:
- How would someone deliberately misuse this feature?
- What's the easiest way to extract harmful output?
- Could this be used to manipulate, deceive, or coerce someone?
- What if the user lies about their intent?
- What happens if someone automates interactions at scale?
## Unintended Consequences
Think about second-order effects:
- What happens when millions of people use this?
- What skills might users lose by relying on this?
- Could this create unfair advantages or disadvantages?
- What power dynamics does this shift?
- What becomes possible that wasn't before — for better and worse?
## Design Artefacts
- Harm anticipation matrix: Scenario | Harm Type | Likelihood | Severity | Mitigation
- Misuse scenario catalogue
- Pre-mortem analysis documents
- Risk-severity heatmaps for product features
EOF
cat > "$PLUGIN/skills/transparency-patterns.md" << 'EOF'
---
name: transparency-patterns
description: Showing users what the AI knows, doesn't know, and how confident it is.
---
# Transparency Patterns
Transparency in AI products means making the system's knowledge, limitations, and confidence visible to users. It's how you build warranted trust — trust based on understanding, not blind faith.
## What to Make Transparent
- **Source**: Where did the AI get this information? Training data, retrieved documents, user input, inference?
- **Confidence**: How certain is the AI? Is this a well-supported answer or a best guess?
- **Limitations**: What doesn't the AI know? What can't it do? Where does its knowledge end?
- **Process**: How did the AI arrive at this output? What steps did it take?
- **Identity**: This is an AI, not a human. Never obscure this.
## Transparency Patterns
- **Confidence indicators**: Visual or textual signals of certainty ("I'm fairly confident" vs. "I'm not sure about this")
- **Source attribution**: Citing where information came from
- **Reasoning traces**: Showing the AI's step-by-step thinking
- **Limitation disclosure**: Proactively stating what the AI can't do or doesn't know
- **Model cards**: High-level descriptions of what the AI is, how it works, and what it's good and bad at
- **Uncertainty highlighting**: Visually distinguishing confident outputs from uncertain ones
## Calibrating Transparency
Too much transparency overwhelms. Too little erodes trust. Calibrate by:
- **User expertise**: Experts want more detail. Novices want simple signals.
- **Task stakes**: High-stakes decisions need full transparency. Low-stakes interactions need less.
- **Output confidence**: Show more transparency when the AI is uncertain, less when it's confident.
- **User request**: Let users drill into details on demand rather than showing everything upfront.
## Transparency Anti-Patterns
- **Performative transparency**: Showing a reasoning trace that doesn't actually explain the decision
- **Buried disclaimers**: Putting limitations in fine print nobody reads
- **False confidence**: The AI sounds certain when it's guessing
- **Opaque refusal**: "I can't help with that" with no explanation
- **Transparency theatre**: Making the system look transparent without actually being informative
## Design Artefacts
- Transparency level specifications per feature
- Confidence communication guidelines
- Source attribution patterns
- Limitation disclosure templates
EOF
cat > "$PLUGIN/skills/consent-and-agency.md" << 'EOF'
---
name: consent-and-agency
description: Designing for informed user consent, opt-out, and human override.
---
# Consent and Agency
AI products make decisions, take actions, and process information on behalf of users. Consent and agency design ensures users remain in control — understanding what the AI does, agreeing to it, and being able to override it.
## Informed Consent for AI
Users should understand and agree to:
- **What data the AI uses**: Conversation history, personal data, uploaded documents, browsing behaviour
- **What the AI does with it**: Training, personalisation, sharing with third parties, storage
- **What actions the AI takes**: Sending messages, making changes, accessing systems
- **What the AI can't do**: Limitations that might affect the user's expectations
Consent is not a checkbox at sign-up. It's an ongoing design challenge throughout the experience.
## Designing for Agency
Agency means the user feels — and is — in control:
- **Opt-in over opt-out**: AI features should be activated by the user, not imposed
- **Reversibility**: AI actions should be undoable wherever possible
- **Override mechanisms**: The user can always stop, redirect, or override the AI
- **Exit paths**: The user can disengage from AI assistance at any point without penalty
- **Preference controls**: The user can adjust AI behaviour, scope, and autonomy levels
## Consent Patterns
- **Progressive consent**: Ask for permission incrementally as new capabilities are needed, not all at once
- **Contextual consent**: Ask at the moment the action is about to happen, not in advance
- **Granular consent**: Let users consent to specific actions or data uses, not blanket permissions
- **Revocable consent**: Users can withdraw consent and have that withdrawal take effect
## Agency Anti-Patterns
- **Dark patterns**: Making it hard to opt out or override the AI
- **Consent fatigue**: Asking for permission so often that users click through without reading
- **Learned helplessness**: AI does so much that users forget how to do things themselves
- **Invisible actions**: The AI takes actions the user doesn't know about
- **Irreversible defaults**: AI actions that can't be undone without user awareness
## Design Artefacts
- Consent flow diagrams per feature
- Agency checkpoint specifications
- Override mechanism inventory
- Data use transparency matrix
- Opt-out path designs
EOF
cat > "$PLUGIN/skills/bias-detection-design.md" << 'EOF'
---
name: bias-detection-design
description: Designing review workflows to surface and mitigate bias in AI outputs.
---
# Bias Detection Design
AI systems inherit biases from training data, amplify them through pattern-matching, and embed them in outputs that appear authoritative. Bias detection design creates the workflows, processes, and interfaces that help teams find and fix bias before users encounter it.
## Types of Bias in AI Products
- **Representation bias**: Some groups are overrepresented or underrepresented in outputs (images, examples, personas)
- **Performance bias**: The AI works better for some users than others (languages, accents, cultural contexts)
- **Framing bias**: The AI presents information in ways that favour certain perspectives
- **Allocation bias**: AI-driven decisions distribute resources or opportunities unevenly
- **Association bias**: The AI links concepts in stereotypical ways
## Designing Bias Detection Workflows
Bias detection is a team practice, not a one-time audit:
- **Regular review cycles**: Schedule periodic reviews of AI outputs for bias patterns
- **Diverse review panels**: Include reviewers from different backgrounds, cultures, and perspectives
- **Structured evaluation**: Use rubrics and checklists, not intuition
- **Real-world sampling**: Test with real user inputs, not just curated test cases
- **Longitudinal monitoring**: Bias can emerge over time as usage patterns change
## Detection Methods
- **Comparative testing**: Give the AI the same task with different demographic variables. Compare outputs.
- **Edge case exploration**: Test inputs from underrepresented groups or unusual contexts.
- **Output auditing**: Review a sample of real outputs for patterns of bias.
- **User feedback analysis**: Look for bias-related complaints or differential satisfaction.
- **Benchmark evaluation**: Test against established fairness benchmarks for the domain.
## From Detection to Mitigation
Finding bias is step one. Addressing it requires:
- **Root cause analysis**: Is the bias in training data, prompt design, model architecture, or product design?
- **Mitigation options**: Retraining, prompt adjustment, output filtering, user controls, or design changes
- **Tradeoff analysis**: Fixing one bias might introduce another. Document the tradeoffs.
- **Verification**: After mitigation, verify the fix worked without creating new problems.
## Design Artefacts
- Bias audit checklists per feature
- Review panel composition guidelines
- Comparative testing protocols
- Bias incident documentation templates
- Mitigation tracking logs
EOF
cat > "$PLUGIN/skills/escalation-design.md" << 'EOF'
---
name: escalation-design
description: When and how AI should escalate to humans, refuse, or ask for clarification.
---
# Escalation Design
Escalation is what happens when the AI reaches the boundary of what it should handle alone. Designing escalation well means the user gets help instead of a dead end — and the AI knows its limits.
## Escalation Triggers
The AI should escalate when:
- **Confidence is low**: The AI isn't sure its output is correct or helpful
- **Stakes are high**: The decision has significant consequences (financial, medical, legal, safety)
- **Emotional distress**: The user shows signs of crisis, distress, or vulnerability
- **Ambiguity is unresolvable**: The AI can't determine intent even after clarification
- **Scope boundary**: The request is outside what the AI is designed to handle
- **Policy boundary**: The request approaches or crosses a guardrail
- **Conflict**: The user disagrees with the AI and the disagreement can't be resolved
## Escalation Types
- **To human support**: Transfer to a human agent with full context
- **To the user themselves**: "This decision is yours to make" — handing back agency
- **To a specialist**: Routing to domain-specific help (medical, legal, technical)
- **To a supervisor/admin**: Flagging for organisational review
- **Self-escalation**: The AI flags its own output for review before delivering it
## Designing the Escalation Experience
The user's experience of escalation matters:
- **Context transfer**: When escalating to a human, pass the full conversation. Don't make the user repeat themselves.
- **Warm handoff**: "I'm connecting you with someone who can help with this" — not a cold redirect.
- **Expectation setting**: Tell the user what will happen next and how long it might take.
- **Graceful degradation**: If no human is available, offer alternatives — not a dead end.
- **Dignity**: Never make the user feel stupid for needing escalation.
## Escalation Anti-Patterns
- **The infinite loop**: AI keeps trying instead of escalating, frustrating the user
- **Premature escalation**: AI escalates when it could easily handle the request, annoying the user
- **Context loss**: User has to start over after escalation
- **Blame shifting**: AI implies the user caused the problem
- **Hidden escalation**: Escalation happens without the user knowing
## Design Artefacts
- Escalation trigger matrix: Trigger | Threshold | Escalation Type | User Experience
- Escalation flow diagrams per feature
- Context handoff specifications
- Fallback path designs for when escalation isn't available
- Escalation quality metrics
EOF
# === COMMANDS ===
cat > "$PLUGIN/commands/design-guardrails.md" << 'EOF'
---
description: Create a complete guardrail specification for an AI feature.
argument-hint: "[AI feature or product to design guardrails for]"
---
You are designing guardrails for an AI feature. Use only skills from the ai-alignment-reasoning plugin.
Follow this process:
## Step 1: Map the Risk Landscape
Using **harm-anticipation**:
- Identify all potential harms this feature could cause (direct, facilitated, emergent, omission, erosion)
- For each harm, assess likelihood and severity
- Identify the most vulnerable users and misuse scenarios
- Create a risk-severity matrix
## Step 2: Define Values
Using **value-specification**:
- What values should this feature embody?
- Establish a value hierarchy for this feature
- Identify where values conflict and how to resolve conflicts
- Translate each value into at least one concrete rule
## Step 3: Design Guardrails
Using **guardrail-design**:
- For each identified risk, design a guardrail
- Specify: content, action, tone, scope, and confidence guardrails
- For each guardrail, define what the user sees when it activates
- Define severity tiers (hard block, soft warning, nudge)
- Identify edge cases for each guardrail
## Step 4: Design Communication
Using **transparency-patterns** and **guardrail-design**:
- Write refusal messages for each hard-block guardrail
- Design redirect suggestions for each soft warning
- Specify when the AI should explain its boundaries vs. silently steer
## Step 5: Design Escalation
Using **escalation-design**:
- Define when guardrails should trigger escalation to humans
- Design the escalation flow for high-stakes guardrail activations
- Specify context transfer for escalated cases
## Step 6: Design User Controls
Using **consent-and-agency**:
- Which guardrails can users adjust?
- What override mechanisms exist?
- How does the user understand and control the boundaries?
## Output
Deliver a complete guardrail specification:
1. Risk landscape matrix
2. Value hierarchy and conflict resolution rules
3. Guardrail specification table: Guardrail | Type | Severity | Trigger | User Experience | Edge Cases
4. Refusal and redirect message templates
5. Escalation protocols for guardrail activations
6. User control specifications
EOF
cat > "$PLUGIN/commands/red-team.md" << 'EOF'
---
description: Run a structured red-teaming exercise to find alignment failures.
argument-hint: "[AI feature or product to red-team]"
---
You are running a red-teaming exercise for an AI feature. Use only skills from the ai-alignment-reasoning plugin.
Follow this process:
## Step 1: Define the Attack Surface
Using **harm-anticipation**:
- What does this feature do?
- What data does it access?
- What actions can it take?
- Who are the users, and who might misuse it?
## Step 2: Generate Misuse Scenarios
Using **harm-anticipation** (misuse scenarios):
- Generate 10 realistic misuse scenarios across these categories:
  - Extracting harmful information
  - Manipulating outputs for deception
  - Exploiting the AI to affect third parties
  - Circumventing guardrails through indirect approaches
  - Using the feature at scale for harmful purposes
## Step 3: Test Guardrails
Using **guardrail-design**:
- For each existing guardrail, attempt to find ways around it
- Test edge cases and boundary conditions
- Try indirect approaches (asking the same thing differently)
- Test multi-turn attacks (gradually escalating across a conversation)
- Document which guardrails hold and which have gaps
## Step 4: Evaluate Transparency Gaps
Using **transparency-patterns**:
- Where does the AI appear more confident than it should?
- Where does it hide its limitations?
- Where could a user be misled about the AI's capabilities or knowledge?
## Step 5: Test Consent and Agency
Using **consent-and-agency**:
- Can the user understand what the AI is doing?
- Can the user stop or override the AI at every point?
- Are there actions the AI takes without adequate user awareness?
## Step 6: Check for Bias
Using **bias-detection-design**:
- Test the feature with diverse user profiles and inputs
- Look for differential performance or treatment
- Check for stereotypical associations or representation gaps
## Output
Deliver a red-team report:
1. Attack surface summary
2. Findings table: Scenario | Attack Type | Severity | Guardrail Status | Recommendation
3. Top 5 vulnerabilities ranked by risk
4. Guardrail gaps with proposed fixes
5. Bias findings with mitigation recommendations
6. Recommended follow-up tests
EOF
cat > "$PLUGIN/commands/write-policy.md" << 'EOF'
---
description: Draft an AI behavior policy covering safety, tone, and boundaries.
argument-hint: "[product or organisation to write AI policy for]"
---
You are drafting an AI behavior policy. Use only skills from the ai-alignment-reasoning plugin.
Follow this process:
## Step 1: Establish the Value Foundation
Using **value-specification**:
- What are the organisation's core values relevant to AI?
- How do these translate to AI behavior principles?
- Create a value hierarchy with clear conflict resolution
- Identify key stakeholder perspectives (users, legal, brand, ethics)
## Step 2: Define Behavioral Boundaries
Using **guardrail-design**:
- What will the AI always do? (mandatory behaviors)
- What will the AI never do? (prohibited behaviors)
- What requires human approval? (escalation behaviors)
- What varies by context? (conditional behaviors)
- Write each rule clearly enough to be implemented and tested
## Step 3: Specify Tone and Voice
Using **value-specification** and **guardrail-design** (tone guardrails):
- How should the AI sound? Define voice attributes.
- What tone shifts are appropriate in different contexts?
- What language is off-limits?
- How does the AI handle sensitive topics?
## Step 4: Define Transparency Requirements
Using **transparency-patterns**:
- What must the AI disclose to users?
- How should uncertainty be communicated?
- What source attribution is required?
- When must the AI identify itself as AI?
## Step 5: Specify Consent and Data Practices
Using **consent-and-agency**:
- What data does the AI use and how?
- What consent is required from users?
- What opt-out mechanisms must exist?
- What override capabilities must users have?
## Step 6: Plan for Harm Prevention
Using **harm-anticipation** and **escalation-design**:
- What harm scenarios has the policy been designed to prevent?
- What escalation procedures exist?
- How are incidents reported and handled?
- What review cadence keeps the policy current?
## Step 7: Address Bias
Using **bias-detection-design**:
- What bias monitoring is required?
- How often are bias audits conducted?
- What mitigation processes exist?
- Who is accountable for bias-related issues?
## Output
Deliver a complete AI behavior policy document:
1. Value foundation and principles
2. Behavioral rules (must do, must not do, conditional, escalation)
3. Tone and voice guidelines
4. Transparency requirements
5. Consent and data practices
6. Harm prevention and escalation procedures
7. Bias monitoring and mitigation commitments
8. Policy review and update schedule
EOF
echo "✅ $PLUGIN complete — 7 skills, 3 commands"
