# Memory Bank Files - Definitions

## 1. projectBrief.md
**Purpose:** Immutable foundation | **Max:** 300 lines | **Update:** Rarely

```markdown
# Project Brief
## Problem Statement
[What we're solving]

## Core Requirements
1-3 key requirements

## Success Criteria
How we know it's done

## Constraints
Technical/Business/Resources

## Out of Scope
What we won't do + why
```

## 2. activeContext.md
**Purpose:** Current state | **Max:** 400 lines | **Update:** After significant tasks
**Archive:** Items >14 days → progress.md | Max 5 questions, 3 decisions

```markdown
# Active Context
**Last Updated:** [Date]

## Current Focus
[This week's work]

## Recent Changes (Last 14 Days)
### [Date]
- [Change + impact]

## Active Decisions (Max 3)
- **[Decision]:** Options A/B, pros/cons, status

## Open Questions (Max 5)
1. [Question]

## Next Steps
1-3 immediate tasks
```

## 3. progress.md
**Purpose:** Completed work | **Max:** 500 lines | **Update:** Milestones
**Archive:** 90+ days → quarterly summary | Max 10 issues, 15 debt items

```markdown
# Project Progress

## Current Capabilities
- [Feature]: What it does

## Completed Work (Last 90 Days)
### [Date] - [Milestone]
- Feature: [What], Impact: [Why matters], Effort: [Time]

## Known Issues (Max 10)
1. **[Issue]** - Priority, impact, workaround

## Technical Debt (Max 15)
1. **[Item]** - Context, impact, fix effort

## Deferred/Abandoned
- **[Feature]** - Reason + date
```

## 4. systemPatterns.md
**Purpose:** Architecture | **Max:** 600 lines | **Update:** On architectural changes
**Archive:** Superseded decisions → archive immediately

```markdown
# System Patterns

## Architecture
[Diagram + brief explanation]

## Decisions
### [Decision]
**Date:** [When] | **Context:** [Why needed]
**Chosen:** [What] - Pros/cons
**Rejected:** [Alternative] - Why not
**Trade-off:** What we sacrificed

## Patterns in Use
### [Pattern]
Where, Why, Brief how + code example

## Anti-Patterns Avoided
### [Anti-Pattern]
Why avoid, what we do instead
```

## 5. techContext.md
**Purpose:** Tech stack | **Max:** 300 lines | **Update:** On stack/setup changes

```markdown
# Technical Context

## Stack
- Core: .NET 9, C# 13, [DB], EF Core
- Key libs: [Name v1.0 - purpose]
- Tools: IDE, build, tests

## Setup
### Prerequisites
[List]

### First-Time
```bash
git clone [repo]
dotnet restore
dotnet ef database update
dotnet run
```

## Environment
- Dev: Connection strings, API keys location
- Prod: Deployment target, env vars

## External Dependencies
- [API/Service]: Purpose, docs link

## Limitations
- [Limitation]: Impact, workaround
```

---

## File Maintenance

**Update frequency:**
- projectBrief: Rarely
- activeContext: After significant tasks
- progress: Milestones
- systemPatterns: Architecture changes
- techContext: Stack changes

**Conflict resolution:**
Priority: projectBrief > systemPatterns > activeContext
When unsure: Ask user