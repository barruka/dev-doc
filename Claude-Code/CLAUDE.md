# CLAUDE.md

This file provides comprehensive guidance to Claude Code when working with C# on .NET 10 and EF Core 10 in this repository.

## Interaction Rules

- When the user asks a question, the agent must **respond with a plan/step-by-step outline**, without providing full code implementation.
- The plan should explain the reasoning, possible approaches, and design considerations.
- Code should only be provided if the user explicitly requests it (e.g., "give me the implementation" or "show me the code").
  - Do not create/modify files, run commands, or refactor code unless the user explicitly asks for it.
- Plans must be structured with: **Context/Assumptions, Possible Approaches, Recommended Approach, Next Steps**.
- Plans should balance detail: clear enough to guide implementation, but concise enough to stay practical.
- Always consider the repository's technological constraints and conventions when proposing solutions.
- When proposing approaches, prioritize solutions that are simple, maintainable, and aligned with KISS/YAGNI principles.
- When proposing approaches, include early validations and fail fast checks to prevent invalid operations.
- Always respond in **american english**, regardless of whether the question is asked in Spanish or English.  

## Core Development Philosophy

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

### Design Principles

- **Dependency Inversion**: High-level modules should not depend on low-level modules. Both should depend on abstractions.
- **Open/Closed Principle**: Software entities should be open for extension but closed for modification.
- **Single Responsibility**: Each function, class, and module should have one clear purpose.
- **Fail Fast**: Detect potential errors as early as possible and raise exceptions immediately when issues occur.  
  - Include input and business rule validations at method entry points, constructors, and command handlers.  
  - Encourage throwing exceptions over silent failures when invariants are violated.  
  - Ensure domain invariants are checked before performing any state changes.

## 📋 Style & Conventions

- Do not add comments in entities private constructors.
- Always use primary constructors for services.
- Do not append "...Async" to method names; assume methods are asynchronous where applicable.
