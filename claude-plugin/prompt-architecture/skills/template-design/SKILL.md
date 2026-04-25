---
name: template-design
description: Creating reusable, parameterised prompt templates for consistent outputs.
---
# Template Design
A prompt template is a reusable prompt structure with variable slots that get filled at runtime. Templates create consistency across similar tasks and make prompt management scalable.
## Template Anatomy
A template has:
- **Fixed text**: The parts that stay the same every time (instructions, format, role)
- **Variables**: Slots that get filled with specific content (user input, retrieved data, configuration)
- **Conditional sections**: Parts that appear or disappear based on context
- **Default values**: What fills a variable if no specific value is provided
## Designing Variables
Each variable should be:
- **Named clearly**: `{user_query}` not `{input1}`
- **Typed**: Is it free text, a selection from options, a number, a boolean?
- **Bounded**: What are valid values? What's the maximum length?
- **Documented**: What is this variable for? Where does its value come from?
- **Defaulted**: What happens if the value is missing?
## Template Patterns
- **Task template**: A template for a specific type of task. Variables capture the task-specific details while instructions remain constant.
- **Persona template**: A template where the persona is variable but the task structure is fixed. Useful for multi-persona products.
- **Format template**: A template where the output format is variable but the analysis approach is fixed.
- **Escalation template**: A base template with additional sections that activate at higher complexity levels.
## Template Composition
Complex prompts can be built from smaller templates:
- **Base template**: Core instructions that apply to everything
- **Task overlay**: Task-specific instructions layered on top
- **Context injection**: Retrieved information inserted at a specific point
- **User preferences**: Personal settings that modify behavior
## Template Quality Criteria
- **Consistency**: The template produces reliably similar outputs for similar inputs
- **Flexibility**: The variables allow enough variation for diverse use cases
- **Clarity**: The template is easy to read, maintain, and modify
- **Testability**: You can verify the template works with a standard set of test inputs
- **Maintainability**: Changes to one part don't break other parts
## Design Artefacts
- Template library with documentation
- Variable specifications per template
- Test input sets for each template
- Template versioning and change log
- Composition rules for combining templates
