# SESSION-STATE Template — WAL Protocol

> The agent's "RAM". Critical decisions, corrections, and specific values get written here BEFORE the agent responds.

---

## Protocol: Write-Ahead Log

**Rule**: Any critical decision / correction / specific value → write here BEFORE responding.

If you respond first and crash before saving, context is lost.

---

## When to Write (Trigger Checklist)

| Trigger | Action |
|---|---|
| ✏️ BOSS correction ("not X", "actually", "no") | write immediately |
| 📍 BOSS provides proper noun (project / product / code) | write immediately |
| 🎨 BOSS preference (style / tool / method) | write immediately |
| 📋 BOSS decision ("use X", "go with Y", "use Z") | write immediately |
| 📝 Draft change (proposal / config edit) | write immediately |
| 🔢 Specific value (number / ID / price / URL / account) | write immediately |

---

## Template

```markdown
# SESSION-STATE.md — Active Working Memory (WAL)

## Current State

```yaml
last_updated: YYYY-MM-DD HH:MM TZ
active_task: <what we're doing>
current_session: <identifier>
pending_decisions: []  # BOSS hasn't decided
risk_level: low
```

## Current Task Progress

| # | Task | Status |
|---|---|---|
| 1 | ... | ✅ |
| 2 | ... | ⏳ |

## Important Decisions

### YYYY-MM-DD HH:MM — <decision topic>
- BOSS said: ...
- I decided: ...
- Trade-off: ...

## Active Decisions (append-only time line)

<!-- Every write tool appends a line: ts | action | context | score -->

### YYYY-MM-DD HH:MM · <action>
- VFM score: HF=__ FR=__ UB=__ SC=__ SI=__ = **__** / 25
- Context: ...
- BOSS-VFM: <reference to confirmation row if any>

## Change History

| Date | Change |
|---|---|
| YYYY-MM-DD | Initial creation |
```

---

## Self-Trigger Rules

- **Start of conversation**: read `last_updated`, check "Current Task Progress"
- **Before each write tool**: read ADL_GUARD.md, run VFM 5-dim scoring
- **After each write tool**: APPEND a line to "Active Decisions"
- **End of task**: update `last_updated`
- **Cross-session recovery**: read context from this file, **do not guess**
- **BOSS correction**: APPEND first, then respond

---

## Cross-Session Recovery

If a new session starts without context:

1. Read `last_updated` → know when you last worked
2. Read "Active Decisions" → know what was last done
3. Read "Important Decisions" → know why
4. **Do NOT ask "what were we doing?"** — the file has it

---

## Example Entry

### 2026-10-02 11:13 · Install proactive-agent-lite

- VFM score: HF=3 FR=2 UB=2 SC=2 SI=2 = **11/25** (edge value)
- Context: required for proactive agent track
- BOSS-VFM: 2026-10-02 11:12 BOSS actual confirmation · 参赛
- Irreversible check: package install → ✅ in whitelist → BOSS confirmed
- commit: pending