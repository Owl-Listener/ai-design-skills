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
