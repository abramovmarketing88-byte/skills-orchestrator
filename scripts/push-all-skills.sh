#!/usr/bin/env bash
# Create GitHub repos if missing and push all own skills.
# Requires: gh auth login (valid token) OR working SSH to github.com
set -euo pipefail

SKILLS_ROOT="${HOME}/.cursor/skills"
OWNER="abramovmarketing88-byte"

declare -A REPO_MAP=(
  [abramov-telegram-posts]=abramov-telegram-posts
  [telegram-post-review]=telegram-post-review
  [avito-factory]=avito-factory
  [avito-photos]=avito-photos
  [avito-search-audit]=avito-search-audit
  [avito-api]=avito-api-skill
  [avito-budget-review]=avito-budget-review
  [tidy-folder]=tidy-folder
  [yadisk-mcp]=yadisk-mcp
  [skill-auditor]=skill-auditor
  [skills-orchestrator]=skills-orchestrator
  [linear-orchestrator]=linear-orchestrator
)

# Monorepo members: sync into a staging checkout of cursor-skills
MONOREPO_SKILLS=(ai-seller-master landing-audit landing-pipeline ui-design-review selling-landing)
STAGING="${HOME}/.cursor/skills-staging/cursor-skills"

need_auth() {
  if ! gh auth status -h github.com >/dev/null 2>&1; then
    echo "ERROR: GitHub auth invalid. Run:"
    echo "  gh auth login -h github.com -p https -w"
    echo "Or add SSH key to GitHub:"
    echo "  cat ~/.ssh/id_ed25519.pub"
    exit 1
  fi
}

push_one() {
  local name="$1"
  local repo="$2"
  local dir="${SKILLS_ROOT}/${name}"
  [[ -d "${dir}/.git" ]] || { echo "no git in $name — run init-local-gits.sh first"; return 1; }

  if ! gh repo view "${OWNER}/${repo}" >/dev/null 2>&1; then
    echo "CREATE ${OWNER}/${repo}"
    gh repo create "${OWNER}/${repo}" --private --source "$dir" --remote origin --push || {
      # remote may already exist
      gh repo create "${OWNER}/${repo}" --private
      git -C "$dir" remote set-url origin "https://github.com/${OWNER}/${repo}.git"
      git -C "$dir" push -u origin main
    }
  else
    echo "PUSH ${OWNER}/${repo}"
    git -C "$dir" remote set-url origin "https://github.com/${OWNER}/${repo}.git"
    git -C "$dir" push -u origin main
  fi
}

sync_monorepo() {
  mkdir -p "$(dirname "$STAGING")"
  if [[ ! -d "${STAGING}/.git" ]]; then
    if gh repo view "${OWNER}/cursor-skills" >/dev/null 2>&1; then
      gh repo clone "${OWNER}/cursor-skills" "$STAGING"
    else
      mkdir -p "$STAGING"
      git -C "$STAGING" init -b main
      git -C "$STAGING" remote add origin "https://github.com/${OWNER}/cursor-skills.git"
      gh repo create "${OWNER}/cursor-skills" --private || true
    fi
  fi
  for name in "${MONOREPO_SKILLS[@]}"; do
    rsync -a --delete --exclude '.git' "${SKILLS_ROOT}/${name}/" "${STAGING}/${name}/"
  done
  git -C "$STAGING" add -A
  if git -C "$STAGING" diff --cached --quiet && git -C "$STAGING" rev-parse HEAD >/dev/null 2>&1; then
    echo "monorepo clean"
  else
    git -C "$STAGING" -c user.email="abramov@local" -c user.name="Abramov" commit -m "Sync monorepo skills from local Cursor"
  fi
  git -C "$STAGING" push -u origin main
}

need_auth
for name in "${!REPO_MAP[@]}"; do
  push_one "$name" "${REPO_MAP[$name]}"
done
sync_monorepo
echo "All pushed."
