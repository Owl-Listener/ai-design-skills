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
