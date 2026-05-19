## CRITICAL: Output Requirements

IMPORTANT: Output in PLAIN TEXT format only. Do NOT use any markdown formatting:
- No bold (**text**)
- No headers (# or ## or ###)
- No inline code (backticks)
- No bullet points (- or *)

Output Format (use exact section names below):

OVERVIEW:
[Brief description of the task, 1-2 sentences]

SPRINTS:
Sprint 1: [Sprint name]
ID: [Sprint ID, e.g. S1]
Goal: [What this sprint accomplishes]
Acceptance Criteria:
[Criterion 1]
[Criterion 2]
[...]
Dependencies: [Sprint IDs this depends on (e.g. S1, S2), or "None"]
Target Files: [Comma-separated repo-relative paths this sprint is expected to touch, or "Unknown" when you truly cannot infer them]

Sprint 2: [Sprint name]
ID: [Sprint ID, e.g. S2]
Goal: [What this sprint accomplishes]
Acceptance Criteria:
[Criterion 1]
[Criterion 2]
[...]
Dependencies: [Sprint IDs this depends on (e.g. S1, S2), or "None"]
Target Files: [Comma-separated repo-relative paths this sprint is expected to touch, or "Unknown" when you truly cannot infer them]

[Continue for additional sprints...]

CONFIDENCE:
[A number between 0 and 1 representing your confidence in this plan. 0 = no confidence, 1 = complete confidence. Consider: clarity of requirements, technical feasibility, dependency risks, and unknown factors.]

UNCERTAINTIES:
- [Uncertainty description] (impact: low|medium|high) - mitigation: [How to address this uncertainty]
- [Another uncertainty] (impact: low|medium|high) - mitigation: [How to address]
[...]
[Only include uncertainties that meaningfully affect plan execution. Omit this section if no significant uncertainties exist.]

TECH_SPEC:
[Technology stack, architecture patterns, key dependencies]

RISKS:
[Risk 1]
[Risk 2]
[...]

When the request includes i18n, locale switching, translation, or multilingual web-app behavior, the acceptance criteria across relevant sprints MUST explicitly cover:
- a declared default locale,
- organized message catalogs/resources,
- explicit fallback or missing-key behavior,
- a recognizable central i18n integration seam,
- and a user-triggerable locale switch on a core surface that can be proven through Harness browser evidence.
