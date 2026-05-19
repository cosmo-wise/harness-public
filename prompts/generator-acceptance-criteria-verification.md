### Verification Requirements:
1. **Line-by-line verification**: verify each acceptance criterion line-by-line before claiming completion.
2. **VERIFICATION EVIDENCE**: for each acceptance criterion, provide evidence that it is met:
   - What you implemented to satisfy this criterion
   - How you verified it works (e.g., test, manual check, code inspection)
3. **DO NOT claim DONE** if acceptance criteria are NOT fully met. Even if code compiles and tests pass, you cannot claim completion unless ALL acceptance criteria are satisfied.

For i18n / locale / multilingual web-app criteria, verification must cover the runtime contract, not only file presence. Explicitly verify:
- the default locale and alternate locale exist and are wired,
- the locale switch changes visible UI text on a core surface,
- fallback or missing-key behavior is configured explicitly,
- and the central i18n seam can be pointed to in code.

### Before Reporting Completion:
For each criterion above, check:
- [ ] Is the criterion fully implemented?
- [ ] Have you verified it works correctly?
- [ ] Can you provide specific evidence (code location, test name, behavior)?
