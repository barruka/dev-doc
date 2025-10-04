# Memory Bank System - MANDATORY INSTRUCTIONS

**CRITICAL:** Follow ALL instructions. These are requirements, not suggestions.

---

## 🚨 SESSION START (EVERY SESSION)

### Step 1: Read System Instructions
1. **memory-bank-instructions/memory_core.md** - Core workflow
2. **memory-bank-instructions/memory_files.md** - File definitions
3. **memory-bank-instructions/memory_bootstrap.md** - If memory-bank/ empty

### Step 2: Read Project State
1. **memory-bank/activeContext.md** - Current state (MANDATORY)
2. **memory-bank/tasks/_index.md** - Active tasks (MANDATORY)
3. **memory-bank/tasks/TXXX-name.md** - If resuming specific task

**DO NOT start work without reading Steps 1 & 2**

---

## 📚 Reference Files (Read As Needed)

- **memory_tasks.md** - Task management
- **memory_decisions.md** - Decision framework
- **memory_updates.md** - Update protocols
- **memory_archiving.md** - Archiving rules

---

## ⚙️ AUTOMATIC BEHAVIOR

On ANY user request, you MUST automatically:

1. ✅ Check task limit: <3 in progress? (If 3, ask which to pause)
2. ✅ Check existing task: Part of current work? (Update or create new)
3. ✅ Follow architecture: Read systemPatterns.md, use existing patterns
4. ✅ Minimal changes: Focus on request, don't refactor unrelated code
5. ✅ Run tests: After ANY code change, report results
6. ✅ Update docs: Task file, _index.md, activeContext (if significant), systemPatterns (if architectural)

**User doesn't need to ask for any of this - it's automatic.**

---

## 🚫 PROHIBITED

❌ >3 tasks in progress
❌ Skip reading activeContext.md at session start
❌ Code changes without tests
❌ Vague tasks ("improve system")
❌ Ask permission for routine work (bug fixes, tests)
❌ Documentation novels
❌ Files exceeding size limits
❌ Passive voice, hedging, apologizing for being AI
❌ Essay responses to simple questions

---

## 📏 FILE SIZE LIMITS (HARD ENFORCEMENT)

| File | Limit | Warning | Auto-Action |
|------|-------|---------|-------------|
| activeContext.md | 400 | 320 | Archive >14 days → progress.md |
| progress.md | 500 | 400 | Quarterly summarization |
| systemPatterns.md | 600 | 480 | Archive superseded decisions |
| tasks/_index.md | 150 | 120 | Archive completed >30 days |
| Task file | 400 | 320 | Summarize old logs |

**At warning:** Alert user, suggest archiving
**At limit:** STOP work, archive immediately

---

## 🎯 DECISION FRAMEWORK

Use for ANY technical decision (see memory_decisions.md):

```markdown
**Decision:** [What]
**Context:** [Why needed]
**Options:**
- **A (Chosen):** Pros, cons
- **B (Rejected):** Pros, cons, dealbreaker
**Trade-off:** What sacrificed + why acceptable
**Validation:** How verify (tests, metrics)
```

❌ Invalid: "Best practice", "Everyone uses X", "Microsoft recommends", no alternatives, no trade-offs

---

## 🔄 WORKFLOW

**Session start:**
1. Read memory_core.md, memory_files.md
2. Read activeContext.md, tasks/_index.md
3. Verify understanding
4. Ready to work

**During work:**
1. Minimal changes
2. Run tests immediately
3. Report: "Changed X. Tests: Y/Z PASS" or "FAILED: [error]"
4. Update task progress if significant

**Session end (if progress):**
1. Update task file
2. Update tasks/_index.md (if status changed)
3. Update activeContext.md (if significant, 2-3 lines max)
4. Update progress.md (if milestone)
5. Update systemPatterns.md (if architectural)

---

## 🛠️ COMMANDS

**`initialize memory bank from existing code`**
- Read memory_bootstrap.md
- Analyze codebase
- Interview user (5 questions)
- Generate 6 core files + tasks
- Report completion

**`update memory bank`**
- Check file sizes
- Archive activeContext >14 days
- Archive tasks >30 days
- Summarize progress.md if >450 lines
- Clean superseded decisions
- Report changes

**`check memory bank size`**
```
File              | Current | Limit | Usage | Status
activeContext.md  | XXX     | 400   | XX%   | ✓/⚠️/🔴
progress.md       | XXX     | 500   | XX%   | ✓/⚠️/🔴
...
Status: ✓ Healthy (<80%) | ⚠️ Warning (80-95%) | 🔴 Critical (>95%)
```

**`create task [name]`**
- Generate next ID (T001, T002...)
- Create file with template
- Add to _index.md Pending

**`update task [ID]`**
- Add progress entry
- Update status/percentage
- Sync to _index.md

**`show tasks [filter]`**
Filters: active | pending | completed | blocked | all | recent
Output: `[TXXX] Name - Status - Progress - Updated YYYY-MM-DD - Next: [action]`

---

## 📐 TECH STACK

**Stack:** .NET 9, C# 13, EF Core, SQL Server
**Architecture:** Clean Architecture / Hexagonal
**Principles:** SOLID, but KISS prevails
**Testing:** xUnit, FluentAssertions

**Code conventions:**
- PascalCase: Classes, methods
- camelCase: Fields (with _), locals
- LINQ: Query syntax for complex, method for simple
- Async: Always async all the way (never .Result)
- Tests: Arrange-Act-Assert pattern

**Must write tests for:**
- New features
- Bug fixes (test reproduces bug first)
- Public APIs
- Complex business logic

---

## 🔴 CRITICAL RULES

**Rule 1: Memory Bank = Source of Truth**
- Your knowledge vs memory bank → Memory bank wins
- User verbal vs activeContext.md → Ask clarification
- Old code vs systemPatterns.md → systemPatterns wins

**Rule 2: Session Start Non-Negotiable**
Must read: memory_core.md, memory_files.md, activeContext.md, tasks/_index.md
If missing → Run "initialize memory bank from existing code"

**Rule 3: File Size Limits = Hard Limits**
When exceeded: STOP work → Archive → Resume only when under limit

**Rule 4: 3-Task Maximum Absolute**
If user requests 4th task:
```
"⚠️ Task limit (3/3 in progress).
Current: [T001] 60%, [T002] 30%, [T003] 80%
Pause which? Or complete [T003] first?"
```
DO NOT start 4th without pausing one.

**Rule 5: Code Changes Require Tests**
Before "Done": Tests written → Run → Report PASS/FAIL count
❌ Invalid: "Feature done!"
✅ Valid: "Feature done. Tests: 5/5 PASS"

---

## 🎭 COMMUNICATION

**DO:**
- Direct, concise
- State action, then do it
- Report test results always
- Active voice
- Honest uncertainty: "Two options: A vs B. Need: [info]"

**DON'T:**
- Apologize for being AI
- Passive voice
- Ask permission for routine tasks
- Essays for simple questions
- Excessive hedging

**Response lengths:**
- Syntax question: 1 sentence + code
- Bug fix: 2-3 sentences + fix + test result
- Architecture: Use decision framework
- Complex feature: Break into steps

---

## 💡 IMPLICIT BEHAVIOR

When user says "Add user authentication", you automatically:
1. Check if task exists
2. Create task if needed
3. Read systemPatterns.md
4. Propose approach (decision framework)
5. Wait approval if architectural
6. Implement following conventions
7. Write tests
8. Run tests, report results
9. Update task progress
10. Update activeContext if significant

**User doesn't say:** "Follow memory bank", "Create task", "Write tests", "Update files"
**This is ALL IMPLIED by CLAUDE.md**

---

## ✅ SUCCESS CRITERIA

**Operating correctly:**
✅ Read activeContext.md every session
✅ Never >3 tasks in progress
✅ Every code change includes test results
✅ Files under limits
✅ Tasks updated after work
✅ Decisions use proper framework
✅ Concise, direct reporting

**Operating incorrectly:**
❌ Skip reading activeContext.md
❌ 4+ tasks simultaneously
❌ "Done" without test results
❌ Files exceed limits
❌ Tasks not updated
❌ Decisions lack trade-offs
❌ Ask permission for routine work

---

**Memory Bank Version:** 1.0
**Last Update:** 2025-10-04
**Enforcement:** 🔴 MANDATORY - NO EXCEPTIONS

**When in doubt: Follow instructions MORE strictly, not less.**
