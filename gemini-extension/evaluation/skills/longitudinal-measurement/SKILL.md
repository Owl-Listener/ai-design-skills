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
