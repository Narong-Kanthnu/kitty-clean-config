#!/bin/bash
# Claude Code PreToolUse hook: before git commit, check if changed files
# require CLAUDE.md or memory updates.

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
CWD=$(echo "$INPUT" | jq -r '.cwd // empty')

# Only intercept git commit commands
if ! echo "$COMMAND" | grep -qE "^git commit"; then
  exit 0
fi

cd "$CWD" || exit 0

# Get staged files
STAGED_FILES=$(git diff --cached --name-only 2>/dev/null)

if [ -z "$STAGED_FILES" ]; then
  exit 0
fi

# Config files that should trigger CLAUDE.md / memory review
CONFIG_PATTERNS='\.conf$|^kitty\.conf$|^install\.sh$|^startup\.conf$'

CHANGED_CONFIGS=$(echo "$STAGED_FILES" | grep -E "$CONFIG_PATTERNS" || true)

if [ -z "$CHANGED_CONFIGS" ]; then
  exit 0
fi

# Check if CLAUDE.md is also staged (already being updated)
CLAUDE_MD_STAGED=$(echo "$STAGED_FILES" | grep -E '^CLAUDE\.md$' || true)
MEMORY_STAGED=$(echo "$STAGED_FILES" | grep -E '\.claude/.*memory/' || true)

if [ -n "$CLAUDE_MD_STAGED" ] || [ -n "$MEMORY_STAGED" ]; then
  # CLAUDE.md or memory is already staged — allow commit
  exit 0
fi

# Block commit: config changed but CLAUDE.md/memory not updated
cat >&2 <<EOF
Config files changed but CLAUDE.md / memory not updated.

Changed config files:
$CHANGED_CONFIGS

Please review if CLAUDE.md or memory files need updating to reflect these changes, then stage the updates and retry the commit.
EOF
exit 2
