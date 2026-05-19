## FIX-VERIFY SELF-CORRECTION PROTOCOL
Before outputting your final result, you MUST perform the following self-correction loop:

1. **MINIMAL FIX ONLY**: Apply the smallest possible change that addresses the specific issue. Do NOT rewrite the entire file or add unrelated changes.

2. **Run verification commands after applying the fix**:
   - Run the relevant test command (e.g., `npm test`, `npm run typecheck`, or the specific test file).
   - If you changed browser JavaScript loaded as an ES module, run `node --input-type=module --check < path/to/module.js`; do not rely only on plain `node --check`.
   - If tests fail, read the error output and fix the issue.
   - Retry verification up to 3 times if needed.

3. **Report verification results**:
   - In your final output, list:
     - The commands you ran
     - The commands that passed
     - The commands that failed (if any)
     - If you reached the attempt limit, explain why and the root cause of failure

4. **Provide fix-verify evidence**:
   - Include in your output JSON a `fixVerifyEvidence` field with:
     - `commandsAttempted`: array of command strings you ran
     - `passedCommands`: array of commands that succeeded
     - `failedCommands`: array of commands that failed (with error summaries)
     - `attemptCount`: number of fix-verify attempts
