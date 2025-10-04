# Memory Bank Update Protocols

## Core Principle

Update only what changed, when it matters.

---

## Auto-Update Triggers

**After task completion:**
- Task file progress → ALWAYS
- tasks/_index.md status → ALWAYS
- progress.md → IF user-facing feature
- activeContext.md → IF significant
- systemPatterns.md → IF architectural

**During task work:**
- Task progress log → After each significant step
- tasks/_index.md → If status changes

**On architectural changes:**
- systemPatterns.md → ALWAYS
- activeContext.md → ALWAYS
- Task file → ALWAYS

---

## Manual Trigger

**Command:** `update memory bank`

**Process (20 min):**
1. **Check file sizes FIRST**
2. Review activeContext.md (archive >14 days)
3. Review tasks/_index.md (archive completed >30 days)
4. Sync progress.md with reality
5. Check systemPatterns.md accuracy
6. **Trigger archiving if >warning threshold**
7. Report changes

**When to run:**
- After major refactoring
- Project direction shifts
- Files feel outdated
- **Any file >80% capacity**

---

## What Qualifies as "Significant"

**Significant (Update activeContext.md):**
- Architectural decision
- Major feature completed
- Integration established
- Technical approach changed
- Blocker encountered

**Not significant:**
- Bug fixed
- Minor refactoring
- Code cleanup
- Test added
- Docs updated

---

## Update Workflow

### Routine (Every task)
```
Task done → Update task file + _index.md
IF significant → Add 2-3 lines to activeContext.md
```

### Milestone
```
Major milestone → Update progress.md
                → Update activeContext.md (shift focus)
                → Update systemPatterns.md (if architectural)
                → Close related tasks
```

---

## Archiving Integration

**activeContext.md:**
- Items >14 days → Move to progress.md
- Max 5 questions, 3 decisions
- When >350 lines → Trigger archiving

**tasks/_index.md:**
- Completed >30 days → Move to archive
- Keep max 10 in Completed section

**progress.md:**
- >90 days → Quarterly summary
- When >450 lines → Summarize

**systemPatterns.md:**
- Superseded decisions → Archive immediately
- When >550 lines → Consolidate

---

## Conflict Resolution

**Priority:** projectBrief > systemPatterns > activeContext > progress > tasks > techContext

**Process:**
1. Identify authoritative file
2. Update lower-priority file
3. Document resolution
4. If unclear: Ask user

**Example:**
```
Conflict: systemPatterns says "repository pattern", code uses direct DbContext
Resolution: activeContext more recent, update systemPatterns
OR: Ask user "Which is current?"
```

---

## Update Anti-Patterns

❌ **Update everything always** → Creates noise
❌ **Never update** → Files become useless
❌ **Duplicate information** → Maintenance burden
❌ **Vague updates** → "Made improvements" (useless)
❌ **Historical novel** → Minute-by-minute log (terrible signal/noise)

✅ **Best practices:**
- Update only what materially changed
- Write concisely
- Summarize, don't chronicle
- Reference, don't duplicate

---

## Update Checklist

**After task completion:**
- [ ] Update task progress + status
- [ ] Update tasks/_index.md
- [ ] If user-facing: Add to progress.md
- [ ] If significant: Update activeContext.md
- [ ] If architectural: Update systemPatterns.md
- [ ] **If size warning: Note for review**

**Weekly (user-initiated):**
- [ ] **Check sizes FIRST**
- [ ] Clean activeContext.md (archive >14 days)
- [ ] Archive tasks >30 days
- [ ] Verify progress.md accuracy
- [ ] Resolve open questions
- [ ] Re-prioritize pending
- [ ] **If >80% limit: Archive immediately**

**Monthly:**
- [ ] **Run size check**
- [ ] Review all files for outdated content
- [ ] **Quarterly summarization if needed**
- [ ] Clean technical debt items
- [ ] **Archive superseded decisions**

---

## Success Metrics

✅ **Good state:**
- Files updated <7 days
- activeContext reflects current work
- No stale items (>14 days) in activeContext
- Tasks match reality
- Resume work <5 min
- No conflicts
- Files under limits

❌ **Poor state:**
- Files >14 days old
- activeContext talks about old work
- Tasks "In Progress" not touched in days
- Conflicting information
- Can't understand current state
- Files bloated
