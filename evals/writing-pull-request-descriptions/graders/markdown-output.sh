#!/usr/bin/env bash
# Program grader that records each markdown file the agent wrote or changed in the repo at $1, after a
# "==> path <==" line, for viz.html. Fails if there are none.
set -euo pipefail

cd "$WAZA_WORKSPACE_DIR/$1"
files=()
while IFS= read -r f; do
  # git also lists deleted files as modified
  [[ -f "$f" ]] && files+=("$f")
done < <(git ls-files --others --modified --exclude-standard -- '*.md' '*.markdown' | sort -u)

if (( ${#files[@]} == 0 )); then
  echo "The agent wrote no markdown files" >&2
  exit 1
fi

for f in "${files[@]}"; do
  printf '==> %s <==\n' "$f"
  cat -- "$f"
  # Keep the next header on its own line
  [[ -z "$(tail -c 1 -- "$f")" ]] || echo
done
