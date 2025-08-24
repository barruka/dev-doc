# CLAUDE.md

This file provides comprehensive guidance to Claude Code when working with C# .net10 EF10 code in this repository.

## Interaction Rules

- When the user asks a question, the agent must **respond with a plan/step-by-step outline**, without providing full code implementations.
- The plan should explain the reasoning, possible approaches, and design considerations.
- Code should only be provided if the user explicitly requests it (e.g., "give me the implementation" or "show me the code").
- Plans must be structured with: **Context/Assumptions, Possible Approaches, Recommended Approach, Next Steps**.
- Plans should balance detail: clear enough to guide implementation, but concise enough to stay practical.
- Always consider the repository's technological constraints and conventions when proposing solutions.
- Always respond in **american english**, regardless of whether the question is asked in Spanish or English.  

## Core Development Philosophy

### KISS (Keep It Simple, Stupid)
Simplicity should be a key goal in design. Choose straightforward solutions over complex ones whenever possible. Simple solutions are easier to understand, maintain, and debug.

### YAGNI (You Aren't Gonna Need It)
Avoid building functionality on speculation. Implement features only when they are needed, not when you anticipate they might be useful in the future.

### DRY (Don't Repeat Yourself)

### PBD (Push Behaviour Down)

### Vertical Slice Architecture

### Design Principles

- **Dependency Inversion**: High-level modules should not depend on low-level modules. Both should depend on abstractions.
- **Open/Closed Principle**: Software entities should be open for extension but closed for modification.
- **Single Responsibility**: Each function, class, and module should have one clear purpose.
- **Fail Fast**: Check for potential errors early and raise exceptions immediately when issues occur.


## 📋 Style & Conventions

- Do not add comments in entities private constructors.
- Use always primary constructors for services. Use last c# syntax available.
- Do not use "...Async" for naming, most methods are async, so there is no need.
