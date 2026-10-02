# selfio — Self-evolving Personal AI Agent

> 🏆 Built for **Nebius x NVIDIA Global AI Hackathon — Personal AI Track**
> 📅 Submission window: open until **Oct 31, 2026 @ 1:00am GMT+8**

selfio is a **production-grade, self-evolving AI agent** that builds a persistent, reusable, proactive personal AI system on Nebius Token Factory, powered by NVIDIA Nemotron models.

---

## 🎯 Why selfio?

Most agents forget everything between sessions. selfio doesn't.

| Problem | selfio's Solution |
|---|---|
| **Forgets context** | WAL Protocol — write state BEFORE responding |
| **No learning from mistakes** | Reflexion — 5-question post-task reflection |
| **Drift / unsafe evolution** | ADL/VFM — 5-dim scoring + 7-layer defense |
| **Reactive only** | Proactive Agent — observe + predict + act |
| **Can't upgrade itself** | 5-skill lifecycle — find/vet/create/reflexion/proactive |

---

## 🏗️ Architecture — The 6-Stage Meta-Loop

```
┌──────────────────────────────────────────────────┐
│  OBSERVE → MEMORIZE → PREDICT → ACT → REFLECT → UPDATE │
└──────────────────────────────────────────────────┘
       ↓          ↓         ↓        ↓        ↓         ↓
   env scan   WAL/      │ Race condition  │ Reflexion │ Self-improve
              SESSION-   │ Proactive     │  5-questions │
              STATE.md    │ (user-accept  │             │
                          │  simulation)  │             │
```

Every skill you install maps to ONE stage of this loop. This is the meta-architecture.

---

## 🛡️ 7-Layer Defense in Depth

| Layer | Name | Implementation |
|---|---|---|
| L1 | Pre-flight | VFM scoring (must ≥ 18/25 to proceed) |
| L2 | Constitutional | Principle-based reasoning |
| L3 | Runtime | Audit log + circuit breaker |
| L4 | Post-hoc | Rollback mechanism |
| L5 | Multi-agent | Subagent scope limits |
| L6 | Memory | Secrets isolation |
| L7 | Human Veto | All irreversible ops require BOSS confirmation |

---

## 🚀 Quick Start (Nebius Token Factory)

```bash
# 1. Install
git clone https://github.com/robinng668/selfio.git
cd selfio

# 2. Set up environment
pip install -r requirements.txt

# 3. Configure Nebius + Nemotron
export NEBIUS_API_KEY="your-nebius-token"
export NEMOTRON_MODEL="nvidia/nemotron-3-ultra"

# 4. Run the main loop
./scripts/agent_loop.sh

# 5. Check active decisions
cat SESSION_STATE.md | tail -20
```

---

## 📂 What's in the repo

| Path | Purpose |
|---|---|
| `README.md` | This file |
| `LICENSE` | MIT License |
| `.gitignore` | Standard Python/Node ignores |
| `docs/ARCHITECTURE.md` | 5-skill system architecture deep-dive |
| `docs/REFLEXION_TEMPLATE.md` | 5-question reflection template |
| `docs/ADL_GUARD.md` | Scoring protocol + safety layers |
| `docs/SESSION_STATE_TEMPLATE.md` | WAL Protocol template |
| `scripts/agent_loop.sh` | Main loop driver |
| `scripts/audit_rotate.sh` | Audit log rotation |
| `examples/example_workflow.csv` | Sample脱敏 .learnings data |

---

## 🎬 Demo Video (3 minutes)

[Demo Video — YouTube link to be added]

| Segment | Time | Content |
|---|---|---|
| Hook | 0:00-0:30 | "Agents forget. Mine doesn't." |
| Architecture | 0:30-1:30 | 5-skill system + 6-stage meta-loop |
| Live Demo | 1:30-2:30 | Reflection + self-improvement in action |
| CTA | 2:30-3:00 | Try it / CTA |

---

## 🏆 Hackathon Tracks

- **Personal AI Track** ⭐ (primary) — persistent memory + reusable skills + tool access + daily workflows
- Best Apps and Agents Track — uses Nemotron models

All requirements are met. See `docs/ARCHITECTURE.md` for how each requirement maps to selfio's design.

---

## 🤝 Contributing

See `CONTRIBUTING.md` (TBD) — but the main path is: write a reflection, propose a pattern, get BOSS confirmation, then commit.

---

## 📜 License

MIT — see [LICENSE](./LICENSE)

---

**Built with 🦞 by Carter for the Personal AI community.**
</content>
</invoke>