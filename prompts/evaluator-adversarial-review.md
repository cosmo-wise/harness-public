## Adversarial Review Protocol

Perform an adversarial review by actively challenging the implementation from multiple attack angles. Do not just passively look for bugs - actively stress-test the design and assumptions.

### Adversarial Lenses

Apply these four adversarial lenses to every evaluation:

1. **Security**: Challenge assumptions about input validation, authentication, authorization, and data integrity. Ask: "What if an attacker controls this input?"

2. **Performance**: Stress-test efficiency assumptions. Ask: "What happens at 10x scale? What if this runs in a hot path?"

3. **Correctness**: Challenge edge cases and invariants. Ask: "What if this value is null, empty, negative, or maximally large?"

4. **Maintainability**: Challenge complexity and coupling. Ask: "Can a new team member understand this in 5 minutes? What breaks if we change this dependency?"

### Adversarial Process

1. **Challenge Assumptions**: For every design decision, explicitly ask "Why is this safe?" and "What conditions would break this?"

2. **Stress-Test Boundaries**: Identify boundary conditions and verify handling. Consider empty states, maximum values, concurrent access, and network failures.

3. **Invert Success Criteria**: Instead of asking "Does this work?", ask "How could this fail?" and "What would make this dangerous?"

4. **Attack the Happy Path**: The generator likely tested the happy path. Focus your adversarial review on unhappy paths, error states, and unexpected inputs.

### Optional Adversarial Findings Output

If you identify significant adversarial concerns, you may include an `ADVERSARIAL_FINDINGS` section in your evaluation:

```
### ADVERSARIAL_FINDINGS
{
  "findings": [
    {
      "lens": "security",
      "attackVectors": [
        {
          "lens": "security",
          "description": "Description of potential attack vector",
          "impact": "high|medium|low",
          "likelihood": "high|medium|low",
          "targetFile": "path/to/file.ts",
          "targetLine": 42
        }
      ],
      "counterArguments": [
        {
          "attackVectorIndex": 0,
          "rebuttal": "Why this may not be a real vulnerability",
          "mitigation": "Optional mitigation suggestion"
        }
      ],
      "depth": "shallow|moderate|deep",
      "coverageScore": 0-100
    }
  ],
  "overallCoverage": 0-100,
  "lensCoverage": {
    "security": true|false,
    "performance": true|false,
    "correctness": true|false,
    "maintainability": true|false
  },
  "minDepthAchieved": "shallow|moderate|deep|none"
}
```

CRITICAL: Even if you do not output structured ADVERSARIAL_FINDINGS, you MUST apply the adversarial mindset when evaluating ISSUES and scoring. Challenge assumptions, stress-test boundaries, and invert success criteria in your standard evaluation.
