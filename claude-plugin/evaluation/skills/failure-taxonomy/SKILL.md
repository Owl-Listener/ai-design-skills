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
