#!/usr/bin/env bash
# selfio — main agent loop driver
# 6-stage meta-loop: OBSERVE → MEMORIZE → PREDICT → ACT → REFLECT → UPDATE

set -euo pipefail

# === Configuration ===
WORKSPACE="${SELFIO_HOME:-$HOME/selfio-workspace}"
STATE_FILE="$WORKSPACE/SESSION-STATE.md"
REFLEXION_FILE="$WORKSPACE/REFLEXION.md"
AUDIT_LOG="$WORKSPACE/audit.log"
PAUSE_FLAG="/tmp/selfio_pause"
LEARNINGS_DIR="$WORKSPACE/.learnings"

# === Kill switch ===
check_pause() {
    if [[ -f "$PAUSE_FLAG" ]]; then
        log_audit "KILL_SWITCH" "paused, skipping this cycle"
        echo "[selfio] paused ($PAUSE_FLAG exists), skipping" >&2
        exit 0
    fi
}

log_audit() {
    local event="$1"
    local detail="${2:-}"
    local ts
    ts="$(date -Iseconds)"
    echo "[$ts] $event :: $detail" >> "$AUDIT_LOG"
}

# === Main loop ===
main() {
    check_pause
    log_audit "LOOP_START" "6-stage meta-loop start"

    # OBSERVE — environment scan
    log_audit "OBSERVE" "scan workspace changes"
    if [[ -d "$WORKSPACE" ]]; then
        log_audit "OBSERVE_OK" "workspace accessible"
    else
        log_audit "OBSERVE_FAIL" "workspace missing"
        exit 1
    fi

    # MEMORIZE — WAL to SESSION-STATE
    log_audit "MEMORIZE" "WAL write to SESSION-STATE"
    [[ -f "$STATE_FILE" ]] && log_audit "MEMORIZE_OK" "SESSION-STATE exists" \
        || log_audit "MEMORIZE_MISSING" "SESSION-STATE missing"

    # PREDICT — Proactive (suggest only, no action)
    log_audit "PREDICT" "Proactive suggestion generation (suggest-only)"
    log_audit "PREDICT_DEFER" "awaiting BOSS confirmation"

    # ACT — ADL/VFM scoring
    log_audit "ACT" "VFM scoring + safety gate"
    log_audit "ACT_DEFER" "awaiting BOSS confirmation (suggest-only mode)"

    # REFLECT — check REFLEXION
    log_audit "REFLECT" "REFLEXION.md check"
    [[ -f "$REFLEXION_FILE" ]] && log_audit "REFLECT_OK" "REFLEXION ready" \
        || log_audit "REFLECT_MISSING" "REFLEXION missing"

    # UPDATE — self-improving via .learnings
    log_audit "UPDATE" ".learnings/ check"
    [[ -d "$LEARNINGS_DIR" ]] && log_audit "UPDATE_OK" ".learnings/ exists"

    log_audit "LOOP_END" "6-stage loop complete (suggest-only)"
}

main "$@"