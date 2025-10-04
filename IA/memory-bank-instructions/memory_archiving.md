# Archiving Strategy

## The Problem

Without archiving, files grow indefinitely → System breaks.

---

## File Limits & Rules

| File | Hard Limit | Warning (80%) | Action |
|------|-----------|---------------|--------|
| activeContext.md | 400 | 320 | Archive >14 days to progress.md |
| progress.md | 500 | 400 | Quarterly summarization |
| systemPatterns.md | 600 | 480 | Archive superseded decisions |
| tasks/_index.md | 150 | 120 | Archive completed >30 days |
| Task file | 400 | 320 | Summarize old logs |

**At warning:** Alert user, suggest archiving
**At limit:** STOP work, archive immediately

---

## Archiving Rules by File

### activeContext.md
**Time-based (every 14 days):**
- Items >14 days → Move significant to progress.md, delete trivial
- Items >30 days → Summarize before moving

**Limits:**
- Max 5 open questions (resolve or defer oldest)
- Max 3 active decisions (resolve or defer oldest)

**Example:**
```
BEFORE (380 lines):
### 2025-08-15 (49 days old)
- Implemented caching with Redis
- Added connection pooling
[15 more detail lines]

AFTER:
[Moved to progress.md]
### 2025-08-15 - Caching Layer
- Feature: Redis caching, Impact: 60% load reduction
```

### progress.md
**Progressive summarization:**
- 0-90 days: Full detail
- 90-180 days: Medium detail (quarterly rollup)
- 180+ days: High-level summary
- 1+ year: Archive to separate file

**Limits:**
- Max 10 known issues (close/archive old)
- Max 15 technical debt items (quarterly review)

**Example:**
```
BEFORE (485 lines):
### 2025-10-03 - JWT Auth
[50 lines of detailed info]

### 2025-09-28 - User Schema
[40 lines of detailed info]

[30+ more detailed entries]

AFTER (320 lines):
### Recent (Last 90 Days)
#### 2025-10-03 - JWT Auth
- Feature: Complete auth, Impact: Secure API, Effort: 2 weeks

### Q3 2025 Summary
Auth & User Mgmt: JWT, profiles, roles. Total: 6 weeks.

### Q2 2025
See: archive/progress-2025-Q2.md
```

### tasks/_index.md
**30-day rolling window:**
- Completed >30 days → Move to archive/_index.md
- Keep max 10 in Completed section
- Abandoned → Archive immediately

### systemPatterns.md
**Immediate archiving:**
- Superseded decisions → archive/architectural-decisions.md
- Keep only CURRENT system patterns

**Consolidation:**
- Merge similar patterns
- Remove redundancy

**Example:**
```
BEFORE (565 lines):
### Data Access - Current (2025-09-01)
[30 lines]

### Data Access - Previous (2025-08-15)
[40 lines] SUPERSEDED

AFTER (380 lines):
### Data Access
**Current:** Direct DbContext (2025-09-01)
**Previous:** Repository pattern (see archive)
[20 lines essentials only]
```

### Task Files
**Progress log summarization:**
- Last 30 days: Full detail
- 31-60 days: Condense to key milestones
- 60+ days: High-level summary only

---

## Archiving Triggers

**Time-based (automatic):**
- Daily: Check activeContext >14 days
- Weekly: Check tasks >30 days
- Monthly: Quarterly summarization if needed

**Size-based (automatic):**
```
When approaching warning:
Alert: "activeContext.md at 85% (340/400)"
Trigger: Auto-archive oldest items
Report: "Archived 8 items, 365→245 lines"
```

---

## Archive Commands

**Check sizes:**
```
Command: "check memory bank size"

Output:
File              | Current | Limit | Usage | Status
activeContext.md  | 245     | 400   | 61%   | ✓
progress.md       | 465     | 500   | 93%   | ⚠
tasks/_index.md   | 65      | 150   | 43%   | ✓

⚠ progress.md needs quarterly summarization
```

**Force archive:**
```
Command: "archive old content"

Process:
1. Scan all files for archivable content
2. Apply rules
3. Move to archive/
4. Report changes
```

---

## Archive Directory Structure

```
memory-bank/
├── activeContext.md
├── progress.md
├── systemPatterns.md
├── tasks/
│   ├── _index.md
│   ├── T001-current.md
│   └── archive/
│       ├── _index.md
│       ├── _index-2025-Q3.md
│       └── T001-old.md
└── archive/
    ├── progress-2025-Q2.md
    ├── architectural-decisions.md
    └── technical-debt-log.md
```

---

## Prevention Best Practices

**Write concisely:**
❌ Bad (20 lines): "On October 3rd, we decided after careful consideration..."
✅ Good (5 lines): "### 2025-10-03 - Auth | Decision: JWT (stateless) | Rejected: Sessions"

**Summarize, don't chronicle:**
❌ Bad: "10:00 Started work, 10:15 Created file, 10:30 Added class..."
✅ Good: "Completed: User model, password hashing, JWT generation"

**Delete ephemeral:**
Don't archive: "Started task", "Fixed typo", "Took break", minor refactors

**Reference, don't duplicate:**
❌ Bad: Copy same decision to 3 files
✅ Good: Full in systemPatterns.md, reference elsewhere

---

## Emergency: File Too Large

If beyond recovery:
```
1. Snapshot: cp activeContext.md activeContext-backup-YYYY-MM-DD.md
2. Aggressive triage: Keep last 7 days only, rest → archive/delete
3. Archive historical: archive/activeContext-2025-Q3.md
4. Document: "Reset on [date], history in archive/"
```

---

## Key Principles

1. **Archive early, often** - 14 days for active, 30 for tasks
2. **Progressive summarization** - Recent detailed, old summarized
3. **Hard limits enforced** - Not suggestions
4. **Delete ephemeral** - Not everything deserves archiving
5. **Quarterly reviews mandatory** - Consolidate old content

**Result:** activeContext readable <2 min, files never exceed limits, system works indefinitely
