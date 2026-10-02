#!/usr/bin/env bash
# selfio — audit log rotation
# Archives today's audit log to a date-stamped file and locks it 0444 (read-only)

WORKSPACE="${SELFIO_HOME:-$HOME/selfio-workspace}"
AUDIT_LOG="$WORKSPACE/audit.log"
TODAY="$(date +%Y-%m-%d)"
ARCHIVE="$WORKSPACE/audit-${TODAY}.log"

# Step 1: archive today's audit log + lock 0444
if [[ -f "$AUDIT_LOG" ]]; then
    if [[ ! -f "$ARCHIVE" ]]; then
        cp "$AUDIT_LOG" "$ARCHIVE"
        chmod 0444 "$ARCHIVE"  # archive locked read-only
        echo "[audit-rotate] archived $ARCHIVE → 0444"
    fi
    : > "$AUDIT_LOG"  # truncate current
fi

# Step 2: current audit log writable for next run
chmod 0644 "$AUDIT_LOG"

# Step 3: lock any other old archives
find "$WORKSPACE" -maxdepth 1 -name "audit-*.log" -not -name "audit-${TODAY}.log" -exec chmod 0444 {} \; 2>/dev/null || true

echo "[audit-rotate] done: current $AUDIT_LOG = 0644, archives = 0444"