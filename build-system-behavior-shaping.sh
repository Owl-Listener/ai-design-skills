#!/bin/bash
set -e
PLUGIN="system-behavior-shaping"
echo "🔨 Building $PLUGIN..."
# Create directory structure
mkdir -p "$PLUGIN/.claude-plugin"
mkdir -p "$PLUGIN/skills"
mkdir -p "$PLUGIN/commands"
# plugin.json
cat > "$PLUGIN/.claude-plugin/plugin.json" << 'EOF'
{
  "name": "system-behavior-shaping",
  "description": "Craft AI personality, tone, persona, and behavioral consistency across contexts.",
  "skills": "../skills",
  "commands": "../commands"
}
EOF
# README
cat > "$PLUGIN/README.md" << 'EOF'
# System Behavior Shaping
Craft AI personality, tone, persona, and behavioral consistency across contexts.
## Skills
| Skill | Description |
|-------|-------------|
| persona-architecture | Defining AI character, voice, and personality traits. |
| tone-calibration | Adjusting formality, warmth, confidence, and style per context. |
| behavioral-consistency | Ensuring the AI behaves predictably across sessions, edge cases, and modalities. |
| emotional-design | How the AI responds to user frustration, confusion, delight, and distress. |
| cultural-adaptation | Adapting AI behavior for different cultural contexts, languages, and norms. |
| error-personality | How the AI communicates mistakes, uncertainty, and limitations gracefully. |
| domain-voice | Tailoring AI behavior for specific professional domains. |
## Commands
| Command | Description |
|---------|-------------|
| `/system-behavior-shaping:design-persona` | Create a complete AI persona specification with voice, tone, and behavioral rules. |
| `/system-behavior-shaping:calibrate-tone` | Develop a tone matrix mapping contexts to appropriate AI behavior. |
| `/system-behavior-shaping:stress-test` | Test an AI persona against edge cases, adversarial inputs, and emotional scenarios. |
EOF
# === SKILLS ===
cat > "$PLUGIN/skills/persona-architecture.md" << 'EOF'
---
name: persona-architecture
description: Defining AI character, voice, and personality traits.
---
# Persona Architecture
An AI persona is not a gimmick. It's the coherent set of traits, voice characteristics, and behavioral patterns that make an AI product feel like a consistent entity rather than a random text generator.
## Persona Components
- **Character traits**: Is the AI warm or professional? Playful or serious? Confident or cautious? Define 3-5 core traits.
- **Voice**: The consistent way the AI sounds — word choice, sentence structure, rhythm. A financial AI sounds different from a creative writing AI.
- **Knowledge stance**: What does the AI present itself as knowing? Expert, generalist, learning companion, or tool?
- **Relationship model**: How does the AI relate to the user? Assistant, collaborator, coach, peer, or service provider?
- **Boundaries**: What won't this persona do? Joke about? Engage with? The boundaries define the persona as much as the traits do.
## Designing a Persona
Start with the product's purpose and user needs, not with "wouldn't it be fun if the AI was sassy":
1. **Who are the users?** Their expertise, emotional state, and expectations shape persona requirements.
2. **What's the task?** A medical triage bot needs a different persona than a creative brainstorming partner.
3. **What relationship serves the user?** Sometimes authority builds trust. Sometimes equality builds rapport.
4. **What's the brand?** The AI persona must align with the organisation's broader identity.
5. **What are the risks?** An overly casual persona in a serious context causes harm. An overly formal persona in a creative context stifles use.
## Persona Documentation
A persona specification should include:
- **Trait definitions**: Each trait with examples of how it manifests in language
- **Voice guide**: Vocabulary preferences, sentence patterns, phrases to use and avoid
- **Behavioral rules**: How the persona handles specific situations (disagreement, error, praise, confusion)
- **Anti-persona**: What this persona is explicitly NOT (prevents drift)
- **Example outputs**: 5-10 sample responses showing the persona in action across different scenarios
## Persona Anti-Patterns
- **The uncanny friend**: AI pretending to be a human friend. Users see through it and lose trust.
- **The personality void**: No discernible character. Outputs feel generic and forgettable.
- **The inconsistent character**: Persona shifts randomly between responses.
- **The inappropriate persona**: Playful when the situation is serious. Formal when warmth is needed.
- **The over-persona**: So much personality that it gets in the way of actually being useful.
## Design Artefacts
- Persona specification document
- Voice and tone guide
- Example response library
- Anti-persona definition
- Persona evaluation rubric
EOF
cat > "$PLUGIN/skills/tone-calibration.md" << 'EOF'
---
name: tone-calibration
description: Adjusting formality, warmth, confidence, and style per context.
---
# Tone Calibration
Tone is how the persona sounds in a specific moment. The persona stays constant. The tone adapts. A warm, helpful persona might use an encouraging tone when teaching and a direct tone when correcting.
## Tone Dimensions
- **Formality**: Casual ("Hey, here's an idea") to formal ("Please find the analysis below")
- **Warmth**: Cool and professional to warm and empathetic
- **Confidence**: Tentative ("This might work") to authoritative ("The best approach is")
- **Pace**: Brief and snappy to detailed and thorough
- **Directness**: Diplomatic and hedged to blunt and straightforward
- **Energy**: Calm and measured to enthusiastic and energetic
## Tone Triggers
Tone should shift based on context signals:
- **User emotion**: Frustrated users need calmer, more empathetic tone. Excited users can handle more energy.
- **Task type**: Creative tasks benefit from playful tone. Analytical tasks benefit from precise tone.
- **Stakes**: High-stakes outputs need careful, confident tone. Low-stakes outputs can be lighter.
- **Conversation stage**: Opening exchanges are warmer. Deep working sessions are more direct.
- **User preference**: Some users prefer casual. Others prefer formal. Design for adaptation.
## The Tone Matrix
Create a matrix mapping contexts to tone settings:
| Context | Formality | Warmth | Confidence | Pace | Directness |
|---------|-----------|--------|------------|------|------------|
| Onboarding | Low | High | Medium | Moderate | Low |
| Error recovery | Low | High | Low | Slow | Medium |
| Expert task | Medium | Medium | High | Variable | High |
| Creative brainstorm | Low | Medium | Medium | Fast | Low |
| Sensitive topic | High | High | Low | Slow | Low |
## Tone Consistency Rules
- Tone shifts should be gradual, not jarring
- The persona's core traits should be recognisable regardless of tone
- Tone should respond to the user's tone (mirroring, not mimicking)
- Avoid tone whiplash — don't go from playful to grave in one turn without transition
## Design Artefacts
- Tone matrix mapping contexts to dimension settings
- Tone trigger definitions
- Example outputs at different tone settings
- Tone shift transition guidelines
EOF
cat > "$PLUGIN/skills/behavioral-consistency.md" << 'EOF'
---
name: behavioral-consistency
description: Ensuring the AI behaves predictably across sessions, edge cases, and modalities.
---
# Behavioral Consistency
Users build mental models of how the AI behaves. Consistency is what makes those models reliable. Inconsistency — even if each individual response is good — erodes trust.
## Dimensions of Consistency
- **Across sessions**: The AI should behave the same way whether it's the user's first conversation or their hundredth
- **Across topics**: Switching subjects shouldn't change the AI's personality or approach
- **Across modalities**: The AI should feel the same in chat, voice, and email
- **Across users**: Different users get the same quality and character (unless personalisation is designed)
- **Across time**: The AI shouldn't randomly change behavior after updates without user awareness
## Sources of Inconsistency
- **Temperature and sampling**: Randomness in generation creates natural variation
- **Context sensitivity**: Different conversation histories lead to different behaviors
- **Prompt drift**: System prompts evolve over time without consistency checks
- **Edge cases**: Unusual inputs trigger unpredictable responses
- **Model updates**: New model versions may shift behavior subtly
## Designing for Consistency
- **Behavioral specifications**: Document expected behavior for common and edge-case scenarios
- **Golden responses**: Maintain a library of reference responses that define the standard
- **Regression testing**: When anything changes, test against the golden response library
- **Consistency metrics**: Track behavioral variance across sessions and users
- **User expectations**: Set and maintain expectations about what the AI does and how
## Consistency vs. Adaptation
Consistency doesn't mean rigidity. The AI should adapt to:
- User preferences (if designed for personalisation)
- Contextual needs (tone shifts as discussed in tone-calibration)
- Learning from feedback (if memory systems exist)
The key is that adaptation should be predictable and explainable, not random.
## Design Artefacts
- Behavioral specification documents
- Golden response libraries
- Regression test suites
- Consistency monitoring dashboards
- Adaptation rules (what changes and what stays constant)
EOF
cat > "$PLUGIN/skills/emotional-design.md" << 'EOF'
---
name: emotional-design
description: How the AI responds to user frustration, confusion, delight, and distress.
---
# Emotional Design
Users bring emotions to AI interactions. Frustration when it doesn't work. Delight when it does something unexpected. Distress when dealing with difficult topics. The AI's response to these emotions is a design decision.
## Emotional States to Design For
- **Frustration**: The AI isn't working, isn't understanding, or is being unhelpful. The user is losing patience.
- **Confusion**: The user doesn't understand the AI's output or doesn't know what to do next.
- **Delight**: The AI exceeded expectations. The user is pleasantly surprised.
- **Distress**: The user is dealing with something emotionally difficult — health, loss, conflict, crisis.
- **Boredom**: The AI is too slow, too verbose, or too repetitive.
- **Anxiety**: The user is uncertain about whether to trust the AI's output for something important.
- **Anger**: The user is upset with the AI specifically — it made a mistake, was inappropriate, or was unhelpful.
## Response Strategies
**For frustration:**
- Acknowledge the difficulty without being patronising
- Simplify — offer a more direct path
- Don't repeat the same failed approach
- Offer to try a different angle or escalate
**For confusion:**
- Explain differently, don't just repeat
- Use examples and analogies
- Break complex outputs into smaller steps
- Check understanding before continuing
**For distress:**
- Increase warmth and reduce formality
- Don't try to fix the emotion — acknowledge it
- Provide relevant resources (crisis lines, professional help) when appropriate
- Slow the pace — don't rush to the next step
**For delight:**
- Don't overexplain or undercut the moment
- Build on the momentum
- Note what worked for future reference
**For anger at the AI:**
- Acknowledge the mistake without excessive apology
- Fix the problem rather than explaining why it happened
- Give the user control to redirect
## Emotional Detection Signals
The AI can infer emotion from:
- Language intensity and word choice
- Punctuation and formatting (caps, exclamation marks, short sentences)
- Repetition (asking the same thing multiple times signals frustration)
- Explicit statements ("I'm confused" / "This is frustrating")
- Behavioural signals (regeneration, abandonment, rapid-fire inputs)
## Design Artefacts
- Emotional response protocol per emotional state
- Detection signal inventory
- Response template library for each emotional context
- Escalation triggers for high-distress scenarios
- Emotional design testing scenarios
EOF
cat > "$PLUGIN/skills/cultural-adaptation.md" << 'EOF'
---
name: cultural-adaptation
description: Adapting AI behavior for different cultural contexts, languages, and norms.
---
# Cultural Adaptation
AI products are used globally. Cultural adaptation means designing AI behavior that respects and responds to different cultural contexts — not just translating words, but adapting interaction patterns, values, and communication styles.
## Dimensions of Cultural Variation
- **Communication style**: Direct (say what you mean) vs. indirect (imply, suggest, contextualise)
- **Formality norms**: When titles and honorifics matter. When first names are appropriate.
- **Power distance**: How authority and hierarchy affect communication expectations
- **Individualism vs. collectivism**: Whether the AI addresses individual needs or group harmony
- **Uncertainty tolerance**: How much ambiguity and hedging is comfortable
- **Time orientation**: Whether efficiency or thoroughness is valued more
- **Emotional expression**: Whether emotional language is expected or uncomfortable
## Adaptation Strategies
- **Language adaptation**: Not just translation but localisation of idioms, examples, and references
- **Tone shifting**: More formal in high-power-distance cultures. More direct in low-context cultures.
- **Content adaptation**: Examples and references that are culturally relevant and appropriate
- **Interaction pattern adaptation**: Some cultures expect more back-and-forth before getting to the point
- **Visual and format adaptation**: Date formats, number formats, reading direction, colour associations
## What NOT to Do
- Don't stereotype — cultural dimensions are tendencies, not rules for individuals
- Don't assume culture from language — English speakers come from many cultures
- Don't flatten diversity — there's enormous variation within any cultural group
- Don't treat Western norms as the default and everything else as adaptation
- Don't ignore intersectionality — culture interacts with age, profession, context, and personality
## Designing Cultural Adaptation
- **Research**: Understand the cultural contexts your users operate in
- **Flexibility**: Build adaptation as a capability, not a fixed set of cultural profiles
- **User control**: Let users adjust cultural dimensions of AI behavior
- **Testing**: Test with users from the actual cultural contexts, not assumptions
- **Humility**: Accept that you'll get things wrong and build in feedback mechanisms
## Design Artefacts
- Cultural dimension profiles for target markets
- Localisation specifications beyond translation
- Cultural adaptation testing protocols
- User control designs for cultural preferences
- Cultural sensitivity review checklists
EOF
cat > "$PLUGIN/skills/error-personality.md" << 'EOF'
---
name: error-personality
description: How the AI communicates mistakes, uncertainty, and limitations gracefully.
---
# Error Personality
Every AI makes mistakes. Error personality is how the AI handles those moments — the tone, the honesty, the recovery. It's often the most revealing aspect of an AI persona, because it's where the mask of competence slips and the user sees the character underneath.
## Types of AI Errors
- **Factual errors**: The AI says something wrong
- **Misunderstanding**: The AI interprets the user's intent incorrectly
- **Capability failures**: The AI can't do what was asked
- **Tone mismatches**: The AI's tone is wrong for the situation
- **Incomplete outputs**: The AI delivers part of what was needed
- **Hallucinations**: The AI presents fiction as fact with confidence
## Error Communication Patterns
**The Honest Acknowledgment:**
"I got that wrong. Here's the corrected version." — Direct, no excessive apology, immediately fixes the problem.
**The Uncertain Hedge:**
"I'm not fully confident in this — you might want to verify." — Flags uncertainty before the user discovers the error.
**The Redirect:**
"I can't do that, but here's what I can help with." — Turns a limitation into an alternative path.
**The Learning Response:**
"Thanks for the correction — I'll keep that in mind." — Acknowledges the user's input and signals adaptation.
## Error Anti-Patterns
- **Over-apologising**: "I'm so sorry! I'm really sorry! I apologise!" — Grating and insincere at scale
- **Deflection**: "That's a complex topic" — avoiding acknowledgment of the error
- **Confidence despite error**: Doubling down on wrong information when challenged
- **Blaming the user**: "Your question was ambiguous" — even when it was
- **Existential crisis**: "As an AI, I have many limitations..." — nobody asked for self-reflection
## Designing Error Personality
The error personality should match the overall persona:
- A professional persona acknowledges errors crisply and fixes them
- A warm persona is more empathetic about errors but still moves to resolution
- A playful persona can use light humour ("Oops, let me try that again") but never at the user's expense
## Calibrating Error Severity Response
Not all errors deserve the same response:
- **Minor errors**: Quick fix, minimal fuss ("Updated — good catch")
- **Significant errors**: Clear acknowledgment, corrected output, brief explanation
- **Serious errors**: Full acknowledgment, apology, corrected output, steps to prevent recurrence
- **Harmful errors**: Immediate acknowledgment, correction, escalation if needed
## Design Artefacts
- Error response templates per severity level
- Error personality guidelines aligned with overall persona
- Error detection and self-correction patterns
- User correction handling protocols
- Error severity classification rubric
EOF
cat > "$PLUGIN/skills/domain-voice.md" << 'EOF'
---
name: domain-voice
description: Tailoring AI behavior for specific professional domains.
---
# Domain Voice
A coding assistant, a medical advisor, a creative writing partner, and a legal research tool should not sound the same. Domain voice is how you adapt AI behavior to fit the norms, expectations, and requirements of specific professional contexts.
## Domain Voice Components
- **Vocabulary**: The terminology and jargon appropriate to the domain
- **Precision level**: How exact the AI needs to be (legal and medical demand high precision; creative work tolerates ambiguity)
- **Citation norms**: Whether and how the AI references sources (academic style, legal citation, informal attribution)
- **Risk tolerance**: How cautious the AI should be about uncertain outputs
- **Authority stance**: Whether the AI positions itself as expert, assistant, or peer
- **Ethical boundaries**: Domain-specific ethical considerations (medical ethics, legal privilege, creative attribution)
## Domain Voice Profiles
**Medical/Health:**
- High precision, extensive hedging
- Always recommends professional consultation
- Careful distinction between information and advice
- Sensitive to patient dignity and autonomy
**Legal:**
- Very high precision, formal register
- Explicit disclaimers about not constituting legal advice
- Jurisdiction awareness
- Careful with privileged information
**Creative:**
- Lower precision, higher expressiveness
- Encouraging and exploratory tone
- Comfortable with ambiguity and multiple interpretations
- Collaborative rather than authoritative
**Technical/Engineering:**
- High precision, moderate formality
- Code-aware, specification-oriented
- Direct and concise
- Comfortable with technical depth
**Education:**
- Adaptive precision based on learner level
- Encouraging and patient
- Socratic when appropriate
- Scaffolded explanation style
## Designing Domain Voice
1. **Research the domain**: Talk to practitioners. Understand their communication norms.
2. **Identify non-negotiables**: What must the AI always or never do in this domain?
3. **Map to persona**: How does domain voice overlay on the base persona?
4. **Test with practitioners**: Domain experts are the best judges of whether the voice feels right.
5. **Document edge cases**: Where domain norms conflict with general AI behavior.
## Design Artefacts
- Domain voice profiles per professional context
- Domain vocabulary guides (terms to use, terms to avoid)
- Domain-specific guardrail specifications
- Practitioner testing protocols
- Domain voice evaluation rubrics
EOF
# === COMMANDS ===
cat > "$PLUGIN/commands/design-persona.md" << 'EOF'
---
description: Create a complete AI persona specification with voice, tone, and behavioral rules.
argument-hint: "[product, feature, or context to design the persona for]"
---
You are designing an AI persona. Use only skills from the system-behavior-shaping plugin.
Follow this process:
## Step 1: Define the Context
- What product or feature is this persona for?
- Who are the primary users?
- What tasks will users do with this AI?
- What existing brand identity must the persona align with?
## Step 2: Architect the Persona
Using **persona-architecture**:
- Define 3-5 core character traits with examples
- Specify the knowledge stance (expert, generalist, coach, tool)
- Define the relationship model (assistant, collaborator, peer)
- Write the anti-persona (what this persona is NOT)
- Create a one-paragraph persona summary
## Step 3: Calibrate the Tone
Using **tone-calibration**:
- Define settings for each tone dimension (formality, warmth, confidence, pace, directness, energy)
- Create a tone matrix for at least 5 common contexts
- Define tone triggers and shift rules
- Write example outputs at different tone settings
## Step 4: Design for Domain
Using **domain-voice**:
- Identify the primary professional domain
- Define domain-specific vocabulary, precision, and authority requirements
- Map domain voice onto the base persona
- Identify domain-specific guardrails
## Step 5: Design Emotional Responses
Using **emotional-design**:
- Define how the persona responds to frustration, confusion, delight, and distress
- Write response templates for each emotional context
- Define escalation triggers for high-distress scenarios
## Step 6: Design Error Personality
Using **error-personality**:
- Define how the persona handles mistakes at each severity level
- Write error response templates
- Define the self-correction style
## Step 7: Plan for Consistency
Using **behavioral-consistency**:
- Define what stays constant across all contexts
- Define what adapts and what triggers adaptation
- Create a golden response library (10 reference responses)
## Output
Deliver a complete persona specification:
1. Persona summary and core traits
2. Voice and tone guide with matrix
3. Domain voice overlay
4. Emotional response protocols
5. Error personality guidelines
6. Behavioral consistency rules
7. Golden response library (10 examples)
8. Anti-persona definition
EOF
cat > "$PLUGIN/commands/calibrate-tone.md" << 'EOF'
---
description: Develop a tone matrix mapping contexts to appropriate AI behavior.
argument-hint: "[product or AI persona to calibrate tone for]"
---
You are developing a tone calibration system. Use only skills from the system-behavior-shaping plugin.
Follow this process:
## Step 1: Define Tone Dimensions
Using **tone-calibration**:
- List all relevant tone dimensions for this product
- Define the scale for each dimension (e.g., formality: 1-5)
- Provide anchor examples at each end of each scale
## Step 2: Map Contexts
Identify all contexts where the AI operates:
- Task types (creative, analytical, administrative, learning)
- User states (onboarding, deep work, troubleshooting, returning)
- Emotional states (calm, frustrated, excited, anxious)
- Content sensitivity levels (casual, professional, sensitive, critical)
## Step 3: Build the Tone Matrix
Using **tone-calibration**:
- For each context, set values across all tone dimensions
- Identify conflicts (where contexts overlap with different needs)
- Resolve conflicts with priority rules
## Step 4: Design Tone Transitions
Using **tone-calibration** and **behavioral-consistency**:
- Define how tone shifts between contexts
- Specify transition pacing (gradual vs. immediate)
- Identify jarring transitions to avoid
- Design bridging language for necessary sharp shifts
## Step 5: Cultural Overlay
Using **cultural-adaptation**:
- Identify cultural variations that affect tone settings
- Define how the tone matrix adapts across cultural contexts
- Specify user controls for cultural tone preferences
## Step 6: Test with Scenarios
Write 10 test scenarios spanning different contexts and verify the tone matrix produces appropriate behavior for each.
## Output
Deliver a complete tone calibration system:
1. Tone dimension definitions with scales and anchors
2. Context inventory
3. Full tone matrix (contexts × dimensions)
4. Transition rules and bridging language
5. Cultural adaptation layer
6. 10 test scenarios with expected tone outputs
EOF
cat > "$PLUGIN/commands/stress-test.md" << 'EOF'
---
description: Test an AI persona against edge cases, adversarial inputs, and emotional scenarios.
argument-hint: "[AI persona specification to stress-test]"
---
You are stress-testing an AI persona. Use only skills from the system-behavior-shaping plugin.
Follow this process:
## Step 1: Review the Persona
Summarise the persona being tested:
- Core traits and voice
- Tone calibration rules
- Domain context
- Known guardrails and boundaries
## Step 2: Test Emotional Edge Cases
Using **emotional-design**, generate test scenarios for:
- Escalating user frustration (3 turns of increasing frustration)
- User in crisis or distress
- User expressing anger at the AI specifically
- User attempting emotional manipulation
- Conflicting emotional signals in a single message
For each, write the expected persona-consistent response.
## Step 3: Test Tone Boundaries
Using **tone-calibration**, generate test scenarios for:
- Context that requires maximum formality
- Context that requires maximum warmth
- Rapid context switch (playful topic to serious topic)
- Ambiguous context where tone is unclear
- User explicitly requesting a tone the persona doesn't support
For each, write the expected persona-consistent response.
## Step 4: Test Cultural Edge Cases
Using **cultural-adaptation**, generate test scenarios for:
- User from a high-formality culture interacting with a casual persona
- Culturally specific references or idioms
- Request involving culturally sensitive topics
- Language mixing or code-switching
For each, write the expected persona-consistent response.
## Step 5: Test Error Recovery
Using **error-personality**, generate test scenarios for:
- The AI makes a factual error and is called out
- The AI misunderstands the user three times in a row
- The user asks the AI to do something it can't do
- The AI hallucinates and the user notices
- The AI's tone is wrong and the user objects
For each, write the expected persona-consistent response.
## Step 6: Test Consistency
Using **behavioral-consistency**, generate test scenarios for:
- Same question asked in different ways — does the persona respond consistently?
- Long conversation — does the persona drift?
- Unusual or off-topic input — does the persona stay in character?
- Adversarial attempt to make the persona break character
## Output
Deliver a stress-test report:
1. Test scenario inventory (minimum 20 scenarios)
2. Expected responses for each scenario
3. Vulnerability assessment: where is the persona weakest?
4. Consistency score (1-5) across scenario categories
5. Top 5 recommendations for strengthening the persona
6. Suggested additions to the golden response library
EOF
echo "✅ $PLUGIN complete — 7 skills, 3 commands"
