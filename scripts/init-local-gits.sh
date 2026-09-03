#!/usr/bin/env bash
# Init local git + commit for all own Cursor skills (skip heygen plugin copies).
# Does NOT push — needs valid gh auth / SSH.
set -euo pipefail

SKILLS_ROOT="${HOME}/.cursor/skills"
OWNER="abramovmarketing88-byte"

# skill_dir -> github_repo_name
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

# Skills that live in monorepo cursor-skills (also get standalone mirror commits locally)
MONOREPO_SKILLS=(ai-seller-master landing-audit landing-pipeline ui-design-review selling-landing)

ensure_gitignore() {
  local dir="$1"
  local gi="${dir}/.gitignore"
  if [[ ! -f "$gi" ]]; then
    cat >"$gi" <<'EOF'
__pycache__/
*.pyc
.DS_Store
.env
.env.*
!.env*.example
*.local
EOF
  else
    grep -q '__pycache__' "$gi" || echo '__pycache__/' >>"$gi"
    grep -q '\.env' "$gi" || printf '%s\n' '.env' '.env.*' '!.env*.example' >>"$gi"
  fi
}

init_skill() {
  local name="$1"
  local repo="$2"
  local dir="${SKILLS_ROOT}/${name}"
  [[ -d "$dir" ]] || { echo "skip missing $name"; return; }
  ensure_gitignore "$dir"
  if [[ ! -d "${dir}/.git" ]]; then
    git -C "$dir" init -b main
  fi
  if ! git -C "$dir" remote get-url origin >/dev/null 2>&1; then
    git -C "$dir" remote add origin "https://github.com/${OWNER}/${repo}.git"
  fi
  git -C "$dir" add -A
  if git -C "$dir" diff --cached --quiet && git -C "$dir" rev-parse HEAD >/dev/null 2>&1; then
    echo "OK clean $name"
  else
    git -C "$dir" -c user.email="abramov@local" -c user.name="Abramov" commit -m "Sync skill ${name} from local Cursor skills" || true
    echo "COMMITTED $name -> ${OWNER}/${repo}"
  fi
}

for name in "${!REPO_MAP[@]}"; do
  init_skill "$name" "${REPO_MAP[$name]}"
done

# Monorepo members: local git history only; push goes via staging checkout in push-all-skills.sh
for name in "${MONOREPO_SKILLS[@]}"; do
  dir="${SKILLS_ROOT}/${name}"
  [[ -d "$dir" ]] || continue
  ensure_gitignore "$dir"
  [[ -d "${dir}/.git" ]] || git -C "$dir" init -b main
  git -C "$dir" add -A
  if git -C "$dir" diff --cached --quiet 2>/dev/null && git -C "$dir" rev-parse HEAD >/dev/null 2>&1; then
    echo "OK clean $name (monorepo member)"
  else
    git -C "$dir" -c user.email="abramov@local" -c user.name="Abramov" commit -m "Sync skill ${name} from local Cursor skills" || true
    echo "COMMITTED $name (monorepo member → cursor-skills)"
  fi
done

echo "Done. Push with: bash ${SKILLS_ROOT}/skills-orchestrator/scripts/push-all-skills.sh"
