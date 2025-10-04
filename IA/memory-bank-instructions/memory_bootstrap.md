# Bootstrapping Memory Bank

## Setup (One-Time)

**Step 1: Create instruction files folder**
```bash
mkdir memory-bank-instructions
# Copy all .md instruction files here
```

**Step 2: Create memory bank folder**
```bash
mkdir -p memory-bank/tasks/archive memory-bank/archive
```

**Step 3: Create instructions reference**
Create `.cursorrules` (or `.clinerules`, `.windsurfrules`) in project root:

```markdown
# Memory Bank System

System docs: `memory-bank-instructions/`
Project memory: `memory-bank/`

## Init Command
If memory-bank/ empty: `initialize memory bank from existing code`

## Core Files (AI reads each session)
1. memory_core.md - Workflow
2. memory_files.md - File definitions
3. memory_bootstrap.md - This file
```

---

## Initialization Process

**Command:** `initialize memory bank from existing code`

### Phase 1: Analysis (AI-driven, 5 min)
1. Read instruction files
2. Analyze project structure
3. Detect tech stack
4. Identify patterns
5. Review git history (if available)

### Phase 2: Interview (5-10 min)

**Q1: Project purpose?** (1-2 sentences)
❌ Bad: "System for managing stuff..."
✅ Good: "User management API for internal apps - centralizes auth and profiles"

**Q2: Current status?**
Options: a) Just started b) Foundation done c) MVP done d) Production e) Maintenance

**Q3: Working on RIGHT NOW?**
❌ Bad: "Various improvements"
✅ Good: "Adding user profile editing - avatar upload + bio update"

**Q4: Top 3 technical decisions?**
❌ Bad: "Using .NET because it's good"
✅ Good: "1) JWT auth (stateless, scales) 2) Clean Architecture (testable) 3) EF Core (abstracts data)"

**Q5: Immediate next task?**
After current work, what's next?

### Phase 3: Generate Files (5 min)
AI creates all core files based on analysis + answers

### Phase 4: Review (2-5 min)
User reviews generated files, corrects misunderstandings

---

## Scenarios

**Small project (<1000 lines):**
Minimal interview, concise files

**Large project (>10k lines):**
Focus on entry points + core logic, expand incrementally

**No git history:**
Rely on code analysis + detailed user answers

**Existing docs:**
Extract from README/docs, fewer interview questions

---

## Verification

After init:
- [ ] All 6 core files exist
- [ ] projectBrief.md has clear problem statement
- [ ] activeContext.md reflects current work
- [ ] progress.md lists actual capabilities
- [ ] systemPatterns.md documents architecture
- [ ] techContext.md has stack + setup
- [ ] tasks/_index.md has current/pending tasks
- [ ] Can start work in <5 min from these files
