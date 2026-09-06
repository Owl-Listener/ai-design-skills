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
