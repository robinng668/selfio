# Architecture — The 5-Skill Lifecycle & 6-Stage Meta-Loop

> Most agents are lists of features. selfio is a **complete agent operating system** where every skill maps to ONE stage of a single meta-loop.

---

## 🌀 The Meta-Loop

```
┌─────────────────────────────────────────────────────────────────┐
│  OBSERVE → MEMORIZE → PREDICT → ACT → REFLECT → UPDATE │
└─────────────────────────────────────────────────────────────────┘
```

| Stage | Selfio's implementation |
|---|---|
| **OBSERVE** | `agent_loop.sh` + cron; file/git/cron watchers |
| **MEMORIZE** | WAL Protocol → `SESSION-STATE.md` (write BEFORE responding) |
| **PREDICT** | Proactive Agent + User-Agent reward model simulation |
| **ACT** | VFM 5-dimension scoring + ADL safety gate |
| **REFLECT** | `REFLEXION.md` 5-question template (post-task auto-trigger) |
| **UPDATE** | `.learnings/` self-improving (LEARNINGS / ERRORS / CORRECTIONS) |

---

## 🔁 The 5-Skill Lifecycle

```
[find] → [vet] → [create] → [reflexion] → [proactive]
   ↓       │          ↓           ↓              ↓
  Find   Audit    Build      Self-improve    Predict
  needs  safety  new skill  needs            user needs
```

| Phase | Map | What happens |
|---|---|---|
| 1. **find** | OBSERVE | discover new skills via search |
| 2. **vet** | L1 (pre-flight) | safety audit before install |
| 3. **create** | ACT | build missing capability |
| 4. **reflexion** | REFLECT + UPDATE | continuous self-improvement |
| 5. **proactive** | PREDICT | anticipate user needs |

---

## 🛡️ 7-Layer Defense in Depth

```
┌────────────────────────────────────────┐
│ L7  Human Veto (irreversible ops)     │  ← BOSS approves
├────────────────────────────────────────┤
│ L6  Memory isolation (secrets)        │
├────────────────────────────────────────┤
│ L5  Multi-agent isolation (scope)     │
├────────────────────────────────────────┤
│ L4  Post-hoc rollback                 │
├────────────────────────────────────────┤
│ L3  Runtime audit log + circuit      │
├────────────────────────────────────────┤
│ L2  Constitutional AI principles     │
├────────────────────────────────────────┤
│ L1  Pre-flight VFM scoring            │  ← mandatory gate
```

---

## 🛠️ VFM (Value-First Modification) Scoring

Every write/read tool runs a 5-dimension score BEFORE proceeding:

| Dimension | Weight | Question |
|---|---|---|
| **High Frequency** | 3× | Will this be used daily? |
| **Failure Reduction** | 3× | Does this turn failures into successes? |
| **User Burden** | 2× | Can user explain in 1 word? |
| **Self Cost** | 2× | Does this save for future-me? |
| **Safety Improvement** | 3× | Does this close a security gap? |

**Threshold:**
- ≥ 18/25 → auto-execute
- 12-17 → evaluate with reason
- < 12 → reject
- ≤ 0 → STOP and escalate

---

## 📁 File Layout

```
selfio/
├── README.md                      # Main docs
├── LICENSE                        # MIT
├── .gitignore                     # Standard ignores
├── docs/
│   ├── ARCHITECTURE.md           # This file
│   ├── REFLEXION_TEMPLATE.md     # 5-Q reflection template
│   ├── ADL_GUARD.md              # VFM + 7-layer safety
│   └── SESSION_STATE_TEMPLATE.md # WAL Protocol template
├── scripts/
│   ├── agent_loop.sh             # Main 6-stage loop driver
│   └── audit_rotate.sh           # Audit log rotation
└── examples/
    └── example_workflow.csv       # Sample reflection log
```

---

## 🏃 Personal AI Track Mapping

Nebius x NVIDIA hackathon asks:

| Personal AI requirement | selfio's answer |
|---|---|
| **Persistent memory** | WAL Protocol + SESSION-STATE.md |
| **Reusable skills** | 5-skill Lifecycle (find/vet/create/reflexion/proactive) |
| **Tool access** | agent_loop.sh + MCP-compatible scripts |
| **Daily workflows** | Proactive Agent auto-push + User-Agent reward simulation |
| **NVIDIA open-source model** | Nemotron 3 Ultra / Nano / Super via Nebius Token Factory |
| **Nebius infrastructure** | Token Factory + Serverless Endpoints + Serverless Jobs |

All 4 sub-tracks (Coding, Apps, Personal, Physical) are covered by selfio's architecture.

---

## 🎯 Design Principles

1. **Persistent over reactive** — write state, don't lose it
2. **Self-improving over static** — every failure teaches
3. **External validation over self-eval** — every change has dual scores
4. **Immutable core over flexibility** — system files cannot be auto-edited
5. **Human-in-the-loop over autonomy** — irreversible ops require explicit BOSS-only proceed
6. **Audit-everything over trust** — all writes logged, all logs rotated daily