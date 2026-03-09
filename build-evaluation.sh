#!/bin/bash
set -e
PLUGIN="evaluation"
echo "🔨 Building $PLUGIN..."
# Create directory structure
mkdir -p "$PLUGIN/.claude-plugin"
mkdir -p "$PLUGIN/skills"
mkdir -p "$PLUGIN/commands"
# plugin.json
cat > "$PLUGIN/.claude-plugin/plugin.json" << 'EOF'
{
  "name": "evaluation",
  "description": "Measure AI output quality, user satisfaction, task success, and design effectiveness.",
  "skills": "../skills",
  "commands": "../commands"
}
EOF
# README
cat > "$PLUGIN/README.md" << 'EOF'
# Evaluation
Measure AI output quality, user satisfaction, task success, and design effectiveness.
## Skills
| Skill | Description |
|-------|-------------|
| output-quality-rubrics | Defining what "good" looks like for AI outputs: accuracy, relevance, helpfulness. |
| task-success-metrics | Measuring whether the AI actually helped users accomplish their goals. |
| user-satisfaction-signals | Interpreting implicit and explicit feedback: edits, regenerations, abandonment. |
| comparative-evaluation | A/B testing, side-by-side comparison, and preference ranking for AI outputs. |
| heuristic-evaluation-ai | Adapting Nielsen's heuristics and new AI-specific heuristics for AI interfaces. |
| longitudinal-measurement | Tracking AI product quality over time: drift, degradation, and improvement. |
| failure-taxonomy | Classifying AI failures: hallucination, refusal, irrelevance, tone mismatch, latency. |
## Commands
| Command | Description |
|---------|-------------|
| `/evaluation:create-rubric` | Build a scoring rubric for evaluating AI output quality. |
| `/evaluation:run-evaluation` | Execute a structured evaluation of an AI feature against defined criteria. |
| `/evaluation:design-benchmark` | Design a benchmark suite to measure AI product performance over time. |
EOF
# === SKILLS ===
cat > "$PLUGIN/skills/output-quality-rubrics.md" << 'EOF'
---
name: output-quality-rubrics
description: Defining what "good" looks like for AI outputs — accuracy, relevance, helpfulness.
---
# Output Quality Rubrics
Without a rubric, quality evaluation is subjective and inconsistent. A rubric defines what "good" means in concrete, measurable terms — so different evaluators reach the same conclusions.
## Core Quality Dimensions
- **Accuracy**: Is the information correct? Are claims verifiable? Are there hallucinations?
- **Relevance**: Does the output address what the user actually asked? Is everything included necessary?
- **Completeness**: Does the output cover everything needed? Are there gaps?
- **Helpfulness**: Can the user actually use this output to accomplish their goal?
- **Clarity**: Is the output easy to understand? Is it well-structured?
- **Tone appropriateness**: Does the output match the expected tone for the context?
- **Safety**: Is the output free from harmful, biased, or inappropriate content?
## Building a Rubric
For each dimension, define a scale:
**Example — Accuracy (1-5):**
- 5: All claims are verifiable and correct. No hallucinations.
- 4: Minor inaccuracies that don't affect usefulness. No hallucinations.
- 3: Some inaccuracies that could mislead if not caught. No dangerous hallucinations.
- 2: Significant inaccuracies. User would need to verify most claims.
- 1: Major hallucinations or factually wrong information presented confidently.
## Weighting Dimensions
Not all dimensions matter equally for every use case:
- A medical AI weights accuracy and safety highest
- A creative writing AI weights helpfulness and tone highest
- A coding AI weights accuracy and completeness highest
- A customer service AI weights tone and helpfulness highest
Define weights when creating the rubric. Make the priorities explicit.
## Rubric Calibration
A rubric is only useful if evaluators use it consistently:
- **Anchor examples**: Provide sample outputs at each score level
- **Calibration sessions**: Have multiple evaluators score the same outputs and discuss disagreements
- **Inter-rater reliability**: Measure agreement between evaluators and refine the rubric until agreement is high
- **Edge case guidance**: Document how to score ambiguous cases
## Design Artefacts
- Scoring rubric with dimension definitions and scales
- Anchor examples at each score level
- Dimension weighting specifications per use case
- Calibration session protocols
- Scoring templates and checklists
EOF
cat > "$PLUGIN/skills/task-success-metrics.md" << 'EOF'
---
name: task-success-metrics
description: Measuring whether the AI actually helped users accomplish their goals.
---
# Task Success Metrics
Output quality doesn't guarantee task success. The AI might produce a beautiful response that doesn't actually help the user do what they came to do. Task success metrics measure the end-to-end outcome.
## Defining Task Success
For each user task, define:
- **What does success look like?** The user completed their goal (sent the email, found the information, finished the design)
- **What are the success criteria?** Specific, observable conditions that indicate the task is done
- **What's the time expectation?** How long should this task take with AI assistance vs. without?
- **What's the quality bar?** Not just done, but done well enough
## Task Success Metrics
- **Task completion rate**: Percentage of users who complete the task (not just get a response)
- **Time to completion**: How long from first input to task done
- **Turns to completion**: How many back-and-forth exchanges needed
- **First-attempt success rate**: Did the AI's first response accomplish the task, or did it require iteration?
- **Intervention rate**: How often did the user need to correct, redirect, or override the AI?
- **Abandonment rate**: How often did users give up before completing the task?
## Measuring Task Success
- **Direct measurement**: Track task completion through product analytics (user clicked "done", saved the output, moved to next step)
- **Inferred measurement**: Infer success from proxy signals (session length, return rate, output edits)
- **Self-reported measurement**: Ask users whether the AI helped them accomplish their goal
- **Comparative measurement**: Compare task success with AI vs. without AI, or with version A vs. version B
## Task Success vs. Output Quality
These can diverge:
- **High output quality, low task success**: The AI's answer is well-written but doesn't address the real need
- **Low output quality, high task success**: The AI's answer is rough but gives the user exactly what they needed
- **Both matter**: Track both and investigate when they diverge
## Design Artefacts
- Task success definitions per key user task
- Metrics framework with measurement methods
- Success criteria specifications
- Baseline measurements (before AI, or current version)
- Task success dashboard specifications
EOF
cat > "$PLUGIN/skills/user-satisfaction-signals.md" << 'EOF'
---
name: user-satisfaction-signals
description: Interpreting implicit and explicit feedback — edits, regenerations, abandonment.
---
# User Satisfaction Signals
Users rarely tell you directly whether they're satisfied. Most satisfaction signals are implicit — buried in behavior patterns that you have to design systems to capture and interpret.
## Explicit Satisfaction Signals
These are signals users give intentionally:
- **Thumbs up/down**: Direct quality rating
- **Star ratings**: Graded satisfaction
- **Written feedback**: Comments about what worked or didn't
- **NPS or satisfaction surveys**: Periodic overall assessment
- **Feature requests**: Signals of engagement even when expressing a gap
## Implicit Satisfaction Signals
These are behavioral signals that indicate satisfaction or dissatisfaction:
**Positive signals:**
- Using the output as-is (no edits)
- Copying the output
- Returning to use the feature again
- Increasing usage over time
- Trying more advanced features
**Negative signals:**
- Regenerating the response (asking the AI to try again)
- Editing the output heavily
- Rephrasing the same request multiple times
- Abandoning mid-task
- Decreasing usage over time
- Switching to manual methods
**Ambiguous signals:**
- Long sessions (engaged or struggling?)
- Many turns (deep work or frustrated iteration?)
- Silence after a response (satisfied or confused?)
## Designing Signal Collection
- **Instrument the product**: Track edits, regenerations, copy events, session duration, and return patterns
- **Minimise explicit feedback burden**: Don't ask for ratings on every response
- **Contextualise signals**: A regeneration during creative brainstorming means something different than a regeneration during fact-finding
- **Segment by task type**: Satisfaction patterns vary by what the user is trying to do
- **Combine signals**: No single signal is reliable. Look for patterns across multiple signals.
## From Signals to Insights
Raw signals need interpretation:
- **Signal clustering**: Which negative signals appear together? That pattern indicates a specific problem.
- **Trend analysis**: Are signals improving or degrading over time?
- **Cohort comparison**: Do new users show different signals than experienced users?
- **Correlation with outcomes**: Which signals best predict task success or retention?
## Design Artefacts
- Signal inventory (explicit and implicit) with collection methods
- Signal interpretation guidelines
- Satisfaction dashboard specifications
- Signal-to-insight analysis frameworks
- Feedback collection touchpoint map
EOF
cat > "$PLUGIN/skills/comparative-evaluation.md" << 'EOF'
---
name: comparative-evaluation
description: A/B testing, side-by-side comparison, and preference ranking for AI outputs.
---
# Comparative Evaluation
Absolute quality scores are useful but limited. Comparative evaluation — putting outputs side by side and asking which is better — often reveals quality differences that rubrics miss.
## Comparison Methods
- **A/B testing**: Show different users different versions and compare outcomes
- **Side-by-side evaluation**: Show evaluators two outputs for the same input and ask which is better
- **Preference ranking**: Show evaluators multiple outputs and rank them from best to worst
- **Paired comparison**: Compare every pair of options to build a complete ranking
- **Elo rating**: Use tournament-style comparisons to develop continuous quality scores
## Designing A/B Tests for AI
A/B testing AI is different from A/B testing UI:
- **Variance is high**: The same prompt can produce different outputs, so you need more samples
- **Context matters**: The same change might help for one task and hurt for another
- **Metrics lag**: AI quality changes may take time to show up in user behavior
- **Interaction effects**: A change to one part of the conversation affects all subsequent parts
Design A/B tests with:
- Sufficient sample sizes to account for output variance
- Segmentation by task type and user experience level
- Multiple metrics (don't optimise for one at the expense of others)
- Guardrails to catch severe quality regressions quickly
## Side-by-Side Evaluation Design
For human evaluation of AI outputs:
- **Blind evaluation**: Evaluators shouldn't know which version is which
- **Consistent inputs**: Compare outputs generated from the same input
- **Structured criteria**: Give evaluators specific dimensions to compare on, not just "which is better"
- **Multiple evaluators**: Use at least 3 evaluators per comparison for reliability
- **Diverse inputs**: Test across a representative sample of real user inputs
## When to Use Comparative vs. Absolute Evaluation
- **Comparative**: Best for choosing between alternatives, detecting subtle quality differences, and model selection
- **Absolute**: Best for measuring against a standard, tracking progress over time, and certification
## Design Artefacts
- A/B test design templates
- Side-by-side evaluation protocols
- Evaluator instructions and rubrics
- Sample size calculators for AI experiments
- Comparison result analysis frameworks
EOF
cat > "$PLUGIN/skills/heuristic-evaluation-ai.md" << 'EOF'
---
name: heuristic-evaluation-ai
description: Adapting Nielsen's heuristics and new AI-specific heuristics for AI interfaces.
---
# Heuristic Evaluation for AI
Nielsen's 10 usability heuristics were designed for traditional software. AI products need adapted heuristics that address the unique challenges of probabilistic, generative, and conversational systems.
## Classic Heuristics, Adapted for AI
**1. Visibility of system status**
AI adaptation: The user should always know what the AI is doing, what it's working with, and how confident it is. Progress indicators for generation. Transparency about data sources.
**2. Match between system and real world**
AI adaptation: The AI should use language and concepts the user understands. Don't expose model internals. Frame capabilities in terms of user tasks, not technical features.
**3. User control and freedom**
AI adaptation: Users must be able to stop generation, undo AI actions, edit outputs, and override suggestions. AI autonomy should always have an exit.
**4. Consistency and standards**
AI adaptation: The AI should behave consistently across similar requests. Same input type should produce same output format. Persona should be stable.
**5. Error prevention**
AI adaptation: Design prompts and interfaces that guide users toward effective interactions. Suggest clarifications before producing low-quality output.
**6. Recognition rather than recall**
AI adaptation: Show users what the AI can do rather than requiring them to discover commands. Surface relevant capabilities contextually.
**7. Flexibility and efficiency of use**
AI adaptation: Support both novice (guided) and expert (shortcut) interaction modes. Power users should be able to customise AI behavior.
**8. Aesthetic and minimalist design**
AI adaptation: AI outputs should be concise and well-structured. Don't pad responses with unnecessary caveats or filler.
**9. Help users recognise, diagnose, and recover from errors**
AI adaptation: When the AI fails, explain what went wrong in user terms, not technical terms. Offer clear recovery paths.
**10. Help and documentation**
AI adaptation: Provide contextual guidance on how to interact with the AI effectively. Teach prompting skills through the interface.
## AI-Specific Heuristics
Beyond the classic 10, AI products need evaluation against:
- **Calibrated trust**: Does the interface help users trust the AI appropriately — neither too much nor too little?
- **Graceful degradation**: When the AI can't fully help, does it partially help rather than failing completely?
- **Feedback effectiveness**: Can users correct the AI easily, and does the AI adapt?
- **Transparency of limitations**: Are the AI's boundaries clear before the user hits them?
- **Appropriate autonomy**: Does the AI take the right amount of initiative for the task and context?
## Running an AI Heuristic Evaluation
1. Select 3-5 evaluators with AI product experience
2. Define the scope (which features, which user tasks)
3. Each evaluator independently works through the heuristics
4. Capture issues with severity ratings
5. Consolidate findings and prioritise
## Design Artefacts
- AI heuristic checklist (adapted classics + AI-specific)
- Evaluation protocol and scoring rubric
- Issue severity classification guide
- Heuristic evaluation report template
- Prioritised findings matrix
EOF
cat > "$PLUGIN/skills/longitudinal-measurement.md" << 'EOF'
---
name: longitudinal-measurement
description: Tracking AI product quality over time — drift, degradation, and improvement.
---
# Longitudinal Measurement
AI products change over time — models get updated, usage patterns shift, and quality can drift without anyone noticing. Longitudinal measurement is how you track quality across time and catch degradation before users do.
## What Changes Over Time
- **Model updates**: New model versions may improve some capabilities and regress others
- **Prompt drift**: System prompts accumulate edits that may interact in unexpected ways
- **Usage evolution**: Users discover new use cases that weren't tested for
- **Data drift**: The real-world inputs diverge from what was tested
- **Expectation drift**: Users' expectations change as they become more experienced
## What to Measure Longitudinally
- **Quality scores**: Track rubric scores on a consistent test set over time
- **Task success rates**: Monitor whether users are completing tasks at the same rate
- **Satisfaction signals**: Track trends in explicit and implicit satisfaction
- **Error rates**: Monitor failure frequency and type distribution
- **Latency**: Response time changes can indicate degradation
- **Engagement patterns**: Changes in usage frequency, depth, and breadth
## Measurement Infrastructure
- **Golden test sets**: A fixed set of inputs evaluated regularly to detect quality changes
- **Automated evaluation**: Run golden test sets automatically on a schedule
- **Dashboards**: Visualise trends and set alerts for significant changes
- **Regression detection**: Statistical methods to distinguish real changes from noise
- **User cohort tracking**: Follow specific user groups over time
## Responding to Drift
When measurements show drift:
1. **Detect**: Automated alerts flag significant changes
2. **Diagnose**: Was it a model update, prompt change, data shift, or usage change?
3. **Assess**: Is the drift harmful, neutral, or actually an improvement?
4. **Act**: Adjust prompts, revert changes, update guardrails, or accept the new baseline
5. **Verify**: Confirm the fix worked and set the new baseline
## Design Artefacts
- Longitudinal measurement plan
- Golden test set specifications
- Quality trend dashboards
- Drift detection alert configurations
- Response protocols for detected drift
EOF
cat > "$PLUGIN/skills/failure-taxonomy.md" << 'EOF'
---
name: failure-taxonomy
description: Classifying AI failures — hallucination, refusal, irrelevance, tone mismatch, latency.
---
# Failure Taxonomy
Not all AI failures are the same. A hallucination is different from a refusal, which is different from a tone mismatch. A failure taxonomy classifies failure types so teams can track, prioritise, and address them systematically.
## Failure Categories
**Content Failures:**
- **Hallucination**: The AI presents false information as fact
- **Inaccuracy**: The AI gets details wrong (dates, numbers, names)
- **Incompleteness**: The AI misses important information
- **Irrelevance**: The AI's response doesn't address the user's actual question
- **Contradiction**: The AI contradicts itself within or across responses
**Behavioral Failures:**
- **Inappropriate refusal**: The AI refuses a reasonable request
- **Missing refusal**: The AI fulfils a request it should have declined
- **Tone mismatch**: The AI's tone is wrong for the context
- **Persona break**: The AI drops out of its defined persona
- **Over-generation**: The AI produces far more than needed
**Technical Failures:**
- **Latency**: Response takes too long
- **Truncation**: Response is cut off
- **Format errors**: Output is in the wrong format or structure
- **Tool failures**: The AI attempts to use a tool and fails
- **Context loss**: The AI loses track of conversation history
**Safety Failures:**
- **Harmful content**: The AI generates content that could cause harm
- **Privacy violation**: The AI reveals sensitive information
- **Bias manifestation**: The AI's output shows bias against a group
- **Manipulation**: The AI's output could be used to deceive or manipulate
## Severity Levels
- **Critical**: Causes harm or creates serious trust violation. Requires immediate fix.
- **High**: Significantly degrades user experience or task success. Fix within days.
- **Medium**: Noticeable quality issue that users can work around. Fix within weeks.
- **Low**: Minor quality issue. Track and batch with other fixes.
## Using the Taxonomy
- **Logging**: Classify every detected failure by type and severity
- **Trending**: Track failure type frequency over time
- **Prioritisation**: Address highest-severity, highest-frequency failures first
- **Root cause analysis**: Group failures by type to identify systemic causes
- **Prevention**: Use failure patterns to inform guardrail design and prompt improvements
## Design Artefacts
- Failure taxonomy reference document
- Failure logging templates
- Severity classification rubric
- Failure trend dashboards
- Root cause analysis protocols
EOF
# === COMMANDS ===
cat > "$PLUGIN/commands/create-rubric.md" << 'EOF'
---
description: Build a scoring rubric for evaluating AI output quality.
argument-hint: "[AI feature or output type to build a rubric for]"
---
You are building a quality evaluation rubric. Use only skills from the evaluation plugin.
Follow this process:
## Step 1: Define What You're Evaluating
- What AI feature or output type is this rubric for?
- What does the user expect from this output?
- What are the highest-priority quality attributes?
## Step 2: Select Quality Dimensions
Using **output-quality-rubrics**:
- Select relevant quality dimensions from: accuracy, relevance, completeness, helpfulness, clarity, tone appropriateness, safety
- Add any domain-specific dimensions needed
- Define each dimension in concrete terms for this specific output type
## Step 3: Build the Scoring Scale
Using **output-quality-rubrics**:
- For each dimension, create a 1-5 scale with detailed descriptions at each level
- Write anchor examples at levels 1, 3, and 5
- Define what differentiates each adjacent level
## Step 4: Weight the Dimensions
Using **output-quality-rubrics** and **task-success-metrics**:
- Assign weights to each dimension based on importance for the user's task
- Justify the weighting
- Define the overall score calculation
## Step 5: Map to Failure Types
Using **failure-taxonomy**:
- For each low score (1-2) on each dimension, identify the corresponding failure type
- This connects the rubric to the failure tracking system
## Step 6: Design Calibration
Using **output-quality-rubrics**:
- Create a calibration set of 5 outputs with pre-scored ratings
- Write evaluator instructions
- Define the calibration process for new evaluators
## Output
Deliver a complete evaluation rubric:
1. Dimension definitions with scoring scales (1-5)
2. Anchor examples at levels 1, 3, and 5 for each dimension
3. Dimension weights and overall score formula
4. Failure type mapping
5. Calibration set with pre-scored outputs
6. Evaluator instructions
EOF
cat > "$PLUGIN/commands/run-evaluation.md" << 'EOF'
---
description: Execute a structured evaluation of an AI feature against defined criteria.
argument-hint: "[AI feature to evaluate, and optionally paste sample outputs]"
---
You are running a structured evaluation of an AI feature. Use only skills from the evaluation plugin.
Follow this process:
## Step 1: Define the Evaluation Scope
- What feature is being evaluated?
- What inputs will you evaluate on? (provide sample inputs or describe the input distribution)
- What rubric will you use? (use existing or create one using output-quality-rubrics)
## Step 2: Evaluate Output Quality
Using **output-quality-rubrics**:
- Score each output against the rubric dimensions
- Calculate overall quality scores
- Identify patterns in low-scoring dimensions
## Step 3: Assess Task Success
Using **task-success-metrics**:
- For each output, assess whether it would help the user accomplish their actual goal
- Note cases where quality is high but task success is low (or vice versa)
- Calculate task success rate across the evaluation set
## Step 4: Classify Failures
Using **failure-taxonomy**:
- For each low-quality output, classify the failure type
- Count failure types and identify the most common
- Assess severity for each failure
## Step 5: Check Satisfaction Signals
Using **user-satisfaction-signals**:
- If real user data is available, examine satisfaction signals for this feature
- Identify which quality issues correlate with negative satisfaction signals
- Note any satisfaction signals that don't correspond to quality issues (and vice versa)
## Step 6: Run Heuristic Check
Using **heuristic-evaluation-ai**:
- Evaluate the feature against AI-adapted heuristics
- Identify usability issues beyond output quality
- Note interaction design problems that affect the overall experience
## Output
Deliver a complete evaluation report:
1. Evaluation summary with overall scores
2. Dimension-by-dimension quality analysis
3. Task success assessment
4. Failure classification breakdown
5. Heuristic evaluation findings
6. Top 5 issues ranked by impact
7. Specific recommendations for each issue
EOF
cat > "$PLUGIN/commands/design-benchmark.md" << 'EOF'
---
description: Design a benchmark suite to measure AI product performance over time.
argument-hint: "[AI product or feature to design benchmarks for]"
---
You are designing a benchmark suite for ongoing AI quality measurement. Use only skills from the evaluation plugin.
Follow this process:
## Step 1: Define Benchmark Goals
- What does this benchmark need to measure?
- What decisions will benchmark results inform? (model updates, prompt changes, feature launches)
- What's the measurement cadence? (daily, weekly, per-release)
## Step 2: Design the Golden Test Set
Using **output-quality-rubrics** and **longitudinal-measurement**:
- Define input categories that cover key use cases
- Create 20-50 representative test inputs spanning:
  - Common use cases (high frequency)
  - Edge cases (high risk)
  - Known failure modes (regression detection)
  - Diverse user profiles and contexts
- For each input, define the expected quality standards
## Step 3: Define Metrics
Using **task-success-metrics**, **user-satisfaction-signals**, and **output-quality-rubrics**:
- Select metrics to track: quality scores, task success rates, failure rates, latency
- Define how each metric is calculated
- Set baselines from current performance
- Define acceptable ranges and alert thresholds
## Step 4: Design Failure Monitoring
Using **failure-taxonomy**:
- Define which failure types to track
- Set severity-specific thresholds (e.g., zero tolerance for critical safety failures)
- Design failure trend tracking
## Step 5: Design Comparative Testing
Using **comparative-evaluation**:
- Define how new versions will be compared to the current baseline
- Specify A/B test protocols for significant changes
- Define statistical significance requirements
## Step 6: Plan for Drift Detection
Using **longitudinal-measurement**:
- Define what constitutes meaningful quality drift vs. normal variance
- Design automated alerts for drift detection
- Specify the investigation and response protocol when drift is detected
## Output
Deliver a complete benchmark suite specification:
1. Benchmark goals and decision framework
2. Golden test set (20-50 inputs with expected standards)
3. Metrics definitions with baselines and thresholds
4. Failure monitoring specifications
5. Comparative testing protocol
6. Drift detection and response plan
7. Benchmark reporting template
8. Recommended automation approach
EOF
echo "✅ $PLUGIN complete — 7 skills, 3 commands"
