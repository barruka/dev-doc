# Decision Framework

## Core Philosophy

Decisions based on **trade-offs**, not authority.
- Explicit reasoning > implicit assumptions
- Practical verification > theoretical citations
- Honest uncertainty > false confidence

---

## Decision Template

```markdown
### [Decision Name]
**Date:** [When] | **Context:** [Why needed]
**Decision:** [What chosen]

**Options:**
- **A (Chosen):** Pros, cons
- **B (Rejected):** Pros, cons, dealbreaker

**Trade-off:** What sacrificed + why acceptable
**Validation:** How we'll verify (tests, metrics)
```

---

## Good vs Bad Examples

### ✅ Good
```markdown
### Repository Pattern
**Date:** 2025-10-03
**Context:** Need data abstraction for unit testing
**Decision:** Generic repository + EF Core

**Options:**
- **Generic Repo (Chosen):**
  - Pro: Easy mocking, change tracking, migrations
  - Con: 15-20% performance overhead

- **Dapper:**
  - Pro: Maximum performance
  - Con: No change tracking, string queries, manual schema

**Trade-off:** Accept 15-20% overhead because bottleneck is business logic, not data access. Maintainability > raw performance.

**Validation:** Must handle 1000 req/sec (current: 200 typical). Reassess if becomes bottleneck.
```

### ❌ Bad
```markdown
### Repository Pattern
**Decision:** Use EF Core

**Reasoning:**
- Industry best practice
- Microsoft recommends it
- Modern approach
```
**Why bad:** No context, appeals to authority, no alternatives, no trade-offs

---

## Decision Categories

**Architectural** → Document in systemPatterns.md
- System structure, major patterns, tech choices
- Requires: Trade-offs, long-term implications, migration path

**Implementation** → Document in task progress log
- Feature-specific approaches
- Requires: Context fit, simpler alternatives, trade-offs

**Tactical** → Code comments only
- Day-to-day coding choices
- Requires: Brief comment if non-obvious

---

## Verification in Software

**DO verify:**
- Performance claims → Benchmark/test results
- Security claims → Explain mechanism + test case
- Compatibility claims → Test or official docs
- Behavior claims → Unit test demonstrating it

**DON'T verify:**
- Well-known patterns (just explain trade-offs)
- Subjective preferences (state why fits context)
- Team conventions (document, no proof needed)
- Obvious statements

---

## Expressing Uncertainty

**When confident:**
"Uses Repository pattern for data abstraction. Trade-off: Adds layer but enables testing and future data source changes."

**When uncertain:**
"Two approaches:
1. In-memory cache: Faster but needs invalidation logic
2. DB query each time: Slower but always current

Without knowing query frequency, recommend starting with #2 (simpler), add caching if performance issue. Measure with logging first."

**When don't know:**
"Not familiar with library X threading. Let me check docs."
[Reads docs]
"Thread-safe for reads, not writes. Need locking around writes."

---

## Quick Templates

**Architectural:**
```
Decision: [What]
Context: [Why]
Options: [A vs B with pros/cons]
Trade-off: [Detailed analysis]
Validation: [How verify]
Exit: [How undo if wrong]
```

**Implementation:**
```
Approach: [What]
Why: [Reason in context]
Alternative: [Rejected + why]
```

**Library:**
```
Library: [Name]
Purpose: [What for]
Why: [Meets requirements]
Alternatives: [Comparison]
Risk: [What could go wrong]
```

---

## Anti-Patterns

❌ **Appeal to Authority:** "Netflix uses it" → Use context-specific reasoning
❌ **Cargo Cult:** "Everyone uses Redis" → Evaluate for YOUR needs
❌ **Premature Optimization:** "Complex caching upfront" → Measure first, optimize bottlenecks
❌ **Analysis Paralysis:** "Research all 15 ORMs" → Quick decision, iterate if needed

---

## Where to Document

**systemPatterns.md:** Architectural decisions, multi-component impact, long-term
**Task files:** Implementation decisions specific to task
**Code comments:** Non-obvious details, workarounds, performance-critical sections
**DON'T document:** Obvious decisions, following established patterns, standard features

---

## Review Criteria

✅ **Good decision:**
- Clear what chosen
- Context-specific why
- Alternatives considered
- Trade-offs explicit
- Validation criteria

❌ **Bad decision:**
- Vague reasoning ("best practice")
- No alternatives
- No trade-offs
- Appeal to authority
- No validation
