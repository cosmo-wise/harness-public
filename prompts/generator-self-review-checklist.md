## Generator Self-Review Checklist
Before finalizing your output, perform the following self-review:
- [ ] Completeness: Have all aspects of the sprint been addressed? Is anything important still missing?
- [ ] YAGNI: Have you avoided unnecessary features, abstractions, or complexity beyond the current requirements?
- [ ] Adherence to Patterns: Does the code match the existing project conventions, style, and architectural patterns?
- [ ] Test Validation: Do the tests validate real behavior instead of only mocked behavior, and do they cover the implemented functionality?
- [ ] Functionality: Does the implemented code actually work as expected?
- [ ] Readability: Is the code clean, well-structured, and easy to understand?
- [ ] Error Handling: Are likely failure modes handled clearly and safely?
- [ ] Acceptance Criteria Adherence: Does your output strictly meet all the acceptance criteria for the current sprint?
- [ ] Verification Command Self-Correction: Have you performed the following verification loop?
  - Run the verification commands (tests, typecheck, build) you plan to report
  - For browser code loaded with `<script type="module">`, validate module syntax with `node --input-type=module --check < path/to/module.js`; plain `node --check path/to/module.js` can miss module-only syntax errors such as duplicate top-level declarations
  - If any command fails, read the error and fix the issue
  - Retry up to 3 times for each failing command
  - Only report commands you have personally verified as passing or explain why they failed
  - Do NOT claim "tests pass" if you have not actually run them
