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
