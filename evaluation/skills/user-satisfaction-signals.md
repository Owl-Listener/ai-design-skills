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
