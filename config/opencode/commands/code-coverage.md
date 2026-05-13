---
description: Analyze test coverage gaps and suggest improvements
agent: plan
subtask: true
---

# Test Coverage Analysis

## Current Coverage Report

!`npm test -- --coverage --coverageReporters=text 2>&1 | tail -50`

## Analyze Gaps

Based on the coverage report, identify:

1. **Uncovered Lines** - What code paths aren't tested?
2. **Uncovered Branches** - What conditionals need tests?
3. **Missing Edge Cases** - What boundary conditions aren't covered?

## Priority Areas (from code review):

Focus on these critical areas:

- Transaction rollback scenarios
- Negative amount validation (financial)
- Concurrent operation handling
- Error propagation paths

## Recommendations

For each gap, provide:

1. File and line numbers
2. What test case is missing
3. Example test code
