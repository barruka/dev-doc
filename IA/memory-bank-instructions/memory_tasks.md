# Task Management

## Task Structure

### tasks/_index.md
**Max 3 "In Progress" simultaneously**

```markdown
# Tasks Index
**Last Updated:** [Date]

## In Progress (Max 3)
- [T001] Feature X - 60% - Updated YYYY-MM-DD - Next: [action]

## Pending (Prioritized)
- [T003] Feature Z - Priority: High - Est: 2 days

## Completed (Last 30 Days)
- [T000] Setup - Completed YYYY-MM-DD

## Archived
See tasks/archive/_index.md
```

### tasks/TXXX-name.md
**Max 400 lines** | **Archive when:** Completed >30 days

```markdown
# [T001] Task Name

**Status:** Pending|In Progress|Blocked|Completed|Abandoned
**Priority:** High|Medium|Low
**Estimated:** [time]
**Started:** [date or N/A]
**Completed:** [date or N/A]

## Goal
[One sentence - what success looks like]

## Approach
- Strategy 1
- Strategy 2
- Strategy 3

## Blockers (if Status=Blocked)
- What's blocking + impact + workaround

## Progress Log (Newest first)

### YYYY-MM-DD
**Status:** In Progress - 60%
- Completed: [What done]
- In Progress: [What doing]
- Blocked: [If blocked]
- Decision: [If made]
- Next: [Next step]
```

---

## Commands

**create task [name]**
- Generate next ID (T001, T002...)
- Create file with template
- Add to _index.md Pending

**update task [ID]**
- Add progress entry
- Update status/percentage
- Sync to _index.md

**complete task [ID]**
- Add completion entry
- Move to Completed in _index.md
- Add capability to progress.md if user-facing
- Auto-archives after 30 days

**abandon task [ID] [reason]**
- Set status Abandoned
- Move to archive immediately
- Document in progress.md

---

## Workflow

**Starting task:**
1. Create or open task file
2. Set "In Progress"
3. Implement
4. Run tests
5. Update progress log

**During work:**
- Update after each significant step
- Document decisions/blockers
- Keep progress current

**Completing:**
1. Final tests pass
2. Complete task
3. Update _index.md
4. If significant: Update activeContext.md
5. If architectural: Update systemPatterns.md

---

## Priority Rules

**High:** Blockers, critical bugs, core features
**Medium:** Important features, non-critical bugs, enabling refactors
**Low:** Nice-to-have, docs, minimal-impact debt

**Rule:** Max 3 in progress. Address high priority before starting medium/low.

---

## Best Practices

✅ **DO:**
- Keep tasks 1-5 days max
- Update after significant steps
- Document decisions in progress log
- Set realistic estimates
- Mark blocked immediately

❌ **DON'T:**
- Create vague tasks ("improve system")
- Let tasks run >1 week without updates
- Skip progress logs
- Work on >3 tasks simultaneously
- Duplicate info from systemPatterns.md

---

## Archiving

**When:**
- Completed >30 days
- Abandoned immediately

**Process:**
1. Move file to tasks/archive/
2. Remove from main _index.md
3. Add to tasks/archive/_index.md with outcome

**Archive index:**
```markdown
# Archived Tasks

## Completed - 2025 Q3
- [T001] Auth - Completed YYYY-MM-DD - Outcome

## Abandoned
- [T010] Legacy - Abandoned YYYY-MM-DD - Reason
```

---

## Complex Tasks

If task >5 days estimate:
**Don't create subtasks** (overhead > value)
**Instead:** Split into multiple linked tasks

Original: [T001] Build User Management
Split:
- [T001] User Authentication
- [T002] User Profiles
- [T003] User Permissions

Link in context: "Part of user management. Related: [T002], [T003]"
