# REFLEXION Template — 5-Question Post-Task Reflection

> Every task that fails, partially succeeds, or is high-risk MUST append an entry here.

---

## When to Trigger

| Trigger | Example |
|---|---|
| ❌ Task failed | API error / command fail / data missing |
| ⚠️ Partial success | Output incomplete or deviates |
| 🎯 High-risk task | write ops / financial decision / production change |
| 📚 First time doing X | new tool / new scenario |
| ⏰ Time gap | daily / weekly review |

---

## 5-Question Template (mandatory)

```markdown
### [YYYY-MM-DD HH:MM] [Task name]

**What happened**: <objective facts>
**Root cause**: <why it happened>
**Alternative**: <what we could have done instead (optional)>
**Prevention SOP**: <how to avoid next time>
**Promote**: [Yes / No] / write L1 / L2 / L3
```

---

## Promoted Levels

| Level | Where to write | When |
|---|---|---|
| L1 — Self note | this file (REFLEXION.md) | always (raw thoughts) |
| L2 — Pattern | `.learnings/LEARNINGS.md` | reusable pattern identified |
| L3 — Base rule | `.learnings/CORRECTIONS.md` (after BOSS approves) | permanent rule change |

---

## Example Entry

### 2026-10-01 — Create vs Use

**What happened**: Created 4 MD files + agent_loop.sh. Thought "finished". BOSS pointed out: "你说真的做到了吗，不要只是实现了但没用在实处。"

**Root cause**: I conflated "file created" with "behavior changed". Files are static rules; without external verifier, self-improve is theatre.

**Alternative**: Should have bundled creation with activation — same commit creates the file AND wires it into the hard rules.

**Prevention SOP**:
1. Any "create new rule" change must wire it into AGENTS.md hard rules simultaneously
2. "Done" = file exists + agent demonstrably runs the workflow
3. After creation, must run the SOP once to prove it works (B.O.T. test)

**Promote**: Yes → wrote CORRECTIONS.md + AGENTS.md hard-rule section

---

## Auto-Trigger Conditions

- **Task fail** → append category=failure
- **BOSS correction** → append category=correction
- **Daily 22:00** → append category=daily
- **agent_loop.sh run** → append category=meta-loop
- **Add skill / modify AGENTS.md** → append category=architecture
- **Template 5-Q mandatory** — no skipping

---

## Append Location

Time-reversed order, latest at top. Keep within file or split at 1000 entries.