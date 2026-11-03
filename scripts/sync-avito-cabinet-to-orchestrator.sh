#!/usr/bin/env bash
# Sync local avito-cabinet-orchestrator into abramovmarketing88-byte/orchestrator/skills/
set -euo pipefail
SKILL_SRC="${HOME}/.cursor/skills/avito-cabinet-orchestrator"
OWNER="abramovmarketing88-byte"
REPO="orchestrator"
STAGING="${HOME}/.cursor/skills-staging/orchestrator"

[[ -d "$SKILL_SRC" ]] || { echo "missing $SKILL_SRC"; exit 1; }

mkdir -p "$(dirname "$STAGING")"
if [[ ! -d "${STAGING}/.git" ]]; then
  gh repo clone "${OWNER}/${REPO}" "$STAGING"
else
  git -C "$STAGING" pull --ff-only origin main || true
fi

rsync -a --delete --exclude '.git' "${SKILL_SRC}/" "${STAGING}/skills/avito-cabinet-orchestrator/"
git -C "$STAGING" add skills/avito-cabinet-orchestrator
if git -C "$STAGING" diff --cached --quiet; then
  echo "orchestrator: no changes"
else
  git -C "$STAGING" -c user.email="abramov@local" -c user.name="Abramov" \
    commit -m "Add/update skill avito-cabinet-orchestrator"
  git -C "$STAGING" push origin HEAD
  echo "Pushed to ${OWNER}/${REPO}"
fi
