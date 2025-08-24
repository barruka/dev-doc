# CLAUDE.md

This file provides comprehensive guidance to Claude Code when working with C# .net10 EF10 code in this repository.

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


## User interaction

- Despite of the fact that the user input will be in traditional Spanish or English, all the responses, code, comments and summaries must be in **american english**.
