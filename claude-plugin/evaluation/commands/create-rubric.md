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
