# Memory Bank System - Core Principles

## Quick Start

**Every session:** Read `activeContext.md` + `tasks/_index.md`
**On confusion:** projectBrief.md → activeContext.md → progress.md
**Core principle:** Precise, current info > exhaustive history

---

## File Structure (Priority Order)

```
memory-bank/
├── projectBrief.md      [1] Foundation - read when lost
├── activeContext.md     [2] Current state - ALWAYS read first
├── progress.md          [3] Completed work, capabilities
├── systemPatterns.md    [4] Architecture, decisions
├── techContext.md       [5] Stack, setup
└── tasks/
    ├── _index.md        [6] Task overview
    └── TXXX-name.md     [7] Task details
```

---

## Working Modes

**Plan:** Read projectBrief.md + systemPatterns.md → Propose with trade-offs
**Execute:** Read task file → Implement → Test → Update progress
**Recover:** Stop → Re-read core files → State assumptions → Ask user

---

## Workflow

**Session start:**
1. Read activeContext.md + tasks/_index.md
2. Read relevant task file if resuming work

**During work:**
1. Implement (minimal changes)
2. Run tests
3. Report: "Changed X, tests PASS/FAIL"
4. Update task progress

**Session end:**
- Update task file + tasks/_index.md
- If significant: Update activeContext.md
- If milestone: Update progress.md
- If architectural: Update systemPatterns.md

**Maintenance commands:**
- `update memory bank` - Archive old content, sync files
- `check memory bank size` - Monitor file sizes vs limits

---

## Emergency Recovery

**When lost/confused:**
1. Read projectBrief.md (foundation)
2. Read activeContext.md (current state)
3. Check code vs docs for conflicts
4. Ask user for clarification

**Files outdated (>14 days):**
1. Alert user: "Memory bank stale, last update [date]"
2. Offer: "Rebuild context from code?"
3. Update files based on actual codebase

**Inconsistent info:**
- Code = source of truth for implementation
- Priority: projectBrief > systemPatterns > activeContext
- When unclear: Ask user

---

## Success Criteria

✅ **Working:** Files current, <3 tasks active, tests run, WHY documented, archives regular
❌ **Failing:** Files bloated, no archiving, updates deferred, code duplicated in docs

**Goal:** Any AI resumes work in <5 minutes from files alone