---
name: context-engineering
description: Designing what information goes into the context window and in what order.
---
# Context Engineering
The context window is finite. What goes into it — and in what order — determines the quality of every output. Context engineering is the practice of deliberately designing the information architecture of the context window.
## The Context Budget
Every context window has a token budget. Allocate it deliberately:
- **System prompt**: The foundational instructions (typically 5-20% of the budget)
- **Retrieved context**: Documents, data, and information pulled in for the current task
- **Conversation history**: Previous turns in the conversation
- **User input**: The current request
- **Working space**: Room for the model to generate its response
These compete for space. More retrieved context means less conversation history. A longer system prompt means less room for everything else.
## Information Architecture in Context
Order matters. The model pays different amounts of attention to different positions:
- **Beginning**: High attention. Put your most important instructions here.
- **Middle**: Lower attention. This is where information can get lost in long contexts.
- **End**: High attention. The most recent information (user input) naturally goes here.
- **Adjacent to the task**: Information placed right before the user's question gets more attention than information earlier in the context.
## Context Selection
Not everything should go into the context. Design selection criteria:
- **Relevance**: Does this information help answer the current question?
- **Recency**: Is this the most up-to-date information available?
- **Specificity**: Is this specific enough to be useful, or is it too generic?
- **Redundancy**: Is this information already covered elsewhere in the context?
- **Authority**: Is this from a reliable source?
## Context Strategies
- **Retrieval-augmented generation (RAG)**: Pull relevant documents into the context dynamically
- **Summarisation**: Compress older context into summaries to free up space
- **Prioritised history**: Keep recent and important conversation turns, drop less important ones
- **Structured context**: Organise information with clear headers and sections so the model can navigate it
- **Context caching**: Pre-compute and cache frequently used context blocks
## Context Quality Signals
How to tell if your context engineering is working:
- **Output relevance**: Do outputs address the actual question using the provided context?
- **Hallucination rate**: Is the model making things up because the context is insufficient?
- **Context utilisation**: Is the model actually using the provided context, or ignoring it?
- **Consistency**: Are outputs consistent when the same context is provided?
## Design Artefacts
- Context budget allocation documents
- Information architecture diagrams for the context window
- Context selection criteria per feature
- Retrieval strategy specifications
- Context quality monitoring metrics
