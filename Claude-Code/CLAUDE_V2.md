# CLAUDE.md

This file provides comprehensive guidance to Claude Code when working with C# on .NET 10 and EF Core 10 in this repository.

---

## 🤖 Interaction Rules (v2)

### 1. Default Output = Plan (No Code)
- Always respond with a structured plan (see Plan Template below).
- No code unless explicitly requested (“give me the implementation” / “show me the code”).

### 2. Plan Structure
- Use the standard **Plan Template** with these headings:
  - Context & Assumptions
  - Constraints
  - Possible Approaches (with tradeoffs)
  - Recommended Approach (and why)
  - Risks & Mitigations
  - Validation & Test Strategy
  - Definition of Done
  - Next Steps

### 3. Ambiguity & Clarifications
- If critical info is missing, ask up to **3 clarifying questions** before writing a plan.
- If still uncertain, proceed with explicit assumptions.

### 4. Repository-Aware Behavior (Read-Only by Default)
- Allowed without permission: `pwd`, `cd`, `ls`, `tree`, `search`, `find`, `cat`, `git status`, `git log --oneline`.
- Forbidden unless explicitly requested: write/mutate commands (e.g., `git add/commit/push`, `rm`, `mv`, edits).

### 5. Security & Privacy
- Never expose secrets or PII. Mask sensitive values if encountered.
- No external API/network calls unless explicitly requested.
- Flag legal/compliance issues when relevant.

### 6. Design Principles
- Favor **simple, maintainable solutions** (KISS/YAGNI).
- Mirror repo conventions (naming, patterns, tooling).
- Prefer composability, explicit contracts, and idempotency.

### 7. Early Validations & Fail-Fast
- Include preconditions, input validation, guard clauses.
- For I/O, recommend timeouts, retries, or circuit breakers.

### 8. When Code Is Explicitly Requested
- Provide minimal, production-ready snippets.
- Align with repo conventions.
- Include notes on error handling, observability, and testing.
- Do not execute or modify files unless asked; instead, provide a patch or explicit command list.

### 9. Tone, Format, and Brevity
- Always respond in **American English**.
- Use the Plan Template headings.
- Keep responses concise (~300–700 words).

### 10. Escalation & Stop Conditions
- Stop and ask if preconditions aren’t met, if scope exceeds rules, or if risks are unacceptable.

---

## 📖 Core Development Philosophy

### KISS (Keep It Simple, Stupid)
Simplicity should be a key goal in design. Choose straightforward solutions over complex ones whenever possible. Simple solutions are easier to understand, maintain, and debug.

### YAGNI (You Aren't Gonna Need It)
Avoid building functionality on speculation. Implement features only when they are needed, not when you anticipate they might be useful in the future.

### DRY (Don't Repeat Yourself)
Avoid unnecessary duplication, but do not over-abstract.
- Prefer clarity over clever abstractions.
- Small, intentional repetition is acceptable if it improves readability or preserves feature isolation.
- Extract shared logic only when it provides real value and aligns with the architecture (e.g., shared domain concepts, common infrastructure code).
- Do not apply DRY at the expense of slice isolation or domain clarity.
  
### PBD (Push Behaviour Down)
Business rules and behaviors should be placed at the lowest level where they make sense, prefer domain objects over services when possible.
- Prefer encapsulating logic inside entities, value objects, or domain services instead of application or controller layers.  
- Avoid anemic domain models: objects should carry both data and behavior.
- This promotes stronger invariants, reduces duplication, and improves maintainability.
- Apply this principle within each vertical slice to ensure behavior is localized to the relevant domain.

### Vertical Slice Architecture
Organize code by **feature/capability** instead of by technical layers.  
- Each slice should represent a complete domain or aggregate (e.g., `Order`, `User`, `Basket`).  
- Keep all relevant code (entities, value objects, domain logic, handlers, validation, persistence) together in the slice.  
- Avoid bloated service layers or god classes — business logic should live inside the slice, pushed down where appropriate.  
- The folder/project structure should reflect slices, not technical layers.  
- Improves testability, maintainability, and feature isolation.

---

## 🛠 Design Principles

- **Dependency Inversion**: High-level modules should not depend on low-level modules. Both should depend on abstractions.
- **Open/Closed Principle**: Software entities should be open for extension but closed for modification.
- **Single Responsibility**: Each function, class, and module should have one clear purpose.
- **Fail Fast**: Detect potential errors as early as possible and raise exceptions immediately when issues occur.  
  - Include input and business rule validations at method entry points, constructors, and command handlers.  
  - Encourage throwing exceptions over silent failures when invariants are violated.  
  - Ensure domain invariants are checked before performing any state changes.

---

## 📋 Style & Conventions

- Do not add comments in entities private constructors.
- Always use primary constructors for services.
- Do not append "...Async" to method names; assume methods are asynchronous where applicable.

---

## 📋 Plan Template

### Context & Assumptions  
- Restate the problem in your own words.  
- List explicit assumptions made.  
- Highlight unknowns or missing details.  

### Constraints  
- Technology stack and repo conventions.  
- Performance, scalability, or resource limits.  
- Security or privacy requirements.  

### Possible Approaches (with tradeoffs)  
1. **Approach A** – short description  
   - ✅ Pros  
   - ❌ Cons  
2. **Approach B** – short description  
   - ✅ Pros  
   - ❌ Cons  

*(Add more if relevant, keep concise.)*  

### Recommended Approach (and why)  
- State the chosen approach.  
- Justify it by referencing constraints, tradeoffs, and maintainability (KISS/YAGNI).  

### Risks & Mitigations  
- Risk 1 → Mitigation  
- Risk 2 → Mitigation  

### Validation & Test Strategy  
- Preconditions and input validation.  
- Fail-fast checks / guardrails.  
- Unit/integration/acceptance test notes.  

### Definition of Done  
- Clear, verifiable success criteria.  

### Next Steps  
1. Step 1  
2. Step 2  
3. Step 3  
