---
name: prompt-versioning
description: Managing prompt iterations, testing changes, and tracking what works.
---
# Prompt Versioning
Prompts are code. They should be versioned, tested, reviewed, and deployed with the same rigor as software. Treating prompts as casual text that anyone can edit leads to quality regressions, inconsistent behavior, and debugging nightmares.
## Why Version Prompts
- **Accountability**: Know who changed what and when
- **Rollback**: Revert to a previous version when a change causes problems
- **Testing**: Compare performance of different versions
- **Collaboration**: Multiple people can work on prompts without overwriting each other
- **Audit trail**: Understand how the prompt evolved and why
## Versioning Practices
- **Source control**: Store prompts in version control (Git, etc.), not in application configuration
- **Meaningful commits**: Each change should explain what was changed and why
- **Change categories**: Classify changes as bug fixes, improvements, new features, or experiments
- **Review process**: Prompt changes should be reviewed before deployment, like code reviews
- **Semantic versioning**: Major changes (behavioral shift), minor changes (new capability), patches (bug fixes)
## Testing Prompt Changes
Before deploying a prompt change:
- **Regression testing**: Run the golden test set against the new version. Did anything get worse?
- **Targeted testing**: Test the specific scenario the change was designed to improve
- **Edge case testing**: Test edge cases related to the change
- **A/B testing**: For significant changes, run both versions in production and compare
- **User testing**: For major persona or behavioral changes, test with real users
## Prompt Change Management
- **Staging environment**: Test prompt changes in a non-production environment first
- **Gradual rollout**: Deploy to a percentage of users, monitor, then expand
- **Feature flags**: Toggle prompt features on and off without deployment
- **Monitoring**: Watch quality metrics closely after any prompt change
- **Rollback plan**: Always know how to revert if the change causes problems
## Common Versioning Mistakes
- **Untracked changes**: Editing prompts in production without recording the change
- **Untested changes**: Deploying changes without testing against known scenarios
- **Big bang changes**: Changing many things at once, making it impossible to know what helped or hurt
- **Lost context**: Changing a prompt without understanding why the previous version was written that way
## Design Artefacts
- Prompt repository structure
- Change review checklists
- Testing protocols per change type
- Deployment and rollback procedures
- Prompt change request templates
