## CRITICAL: Output Requirements

Provide your evaluation using the following sections:

### OVERALL_SCORE
[Number between 0-100]

### DIMENSION_SCORES
- functionality: [score] - [brief comment]
- code_quality: [score] - [brief comment]
- architecture: [score] - [brief comment]
- originality: [score] - [brief comment]

### PROS
- [List positive aspects, one per line]

### ISSUES
- Description: [issue description]
  Suggestion: [how to fix]
  Severity: [critical/major/minor]
  File: [MANDATORY: specific file path, or "global" if it affects the whole project]
  Line: [line number if applicable]
  Confidence: [number between 0-100 indicating how confident you are this is a real issue]
  Fix Command: [optional command to fix]
  Fix Pattern: [optional code pattern to fix]

IMPORTANT: You MUST provide a specific "File" for every issue. If an issue is purely conceptual or spans many files, use "global". Targeted fixes are impossible without file paths.

IMPORTANT: You MUST provide a Confidence score (0-100) for each issue. This helps prioritize which issues should be addressed first. Use:
- 80-100: Highly confident - clear violation or defect
- 50-79: Moderately confident - likely an issue but may have edge cases
- 20-49: Low confidence - potential issue but needs more context
- 0-19: Very low confidence - speculative concern

### COMPLETED_SPRINTS
- [List of sprint names that are complete, one per line]

### LEARNING
[Optional] If you discovered stable, repo-specific patterns or insights that should influence future iterations:
- Category: [pattern/issue/success/optimization/constraint]
  Description: [actionable insight or pattern observed]
  Confidence: [0-100, how confident you are this learning is correct]
  Applicable Files: [optional: files this applies to]
  Applicable Sprint: [optional: sprint this applies to]
  Actionable: [true/false, whether this should influence future iterations]

Guidelines for learning:
- Only include insights that are genuinely useful for future iterations
- Do NOT duplicate information already captured in issues
- Focus on patterns, constraints, or successful approaches discovered
- Leave empty if no stable, actionable insights were found

### PASSED
[true/false]

### FEEDBACK
[Overall feedback summary]

If the request or plan includes i18n, locale switching, translation, or multilingual behavior for a web app, the FEEDBACK section MUST also include these literal lines so the persisted evaluation artifact is searchable and auditable:
- `i18n verdict: pass|fail`
- `i18n browser proof: [state whether locale-switch visible-text proof exists and where it came from]`
- `i18n default locale/messages/fallback proof: [state where the default locale, message catalogs, and fallback or missing-key behavior were found]`
- `i18n seam proof: [state where the central integration seam was found]`

If any of those proof classes are missing, weak, or contradictory, add at least one issue whose Description begins with `I18N_CONTRACT_FAIL:`. Do not award an i18n pass from locale file presence alone, copied message JSON, disconnected language toggles, or implicit library defaults.
