#!/usr/bin/env bash
# Program grader that records the agent's changes to the repo at $1 as a unified diff; viz.html shows it.
set -euo pipefail

cd "$WAZA_WORKSPACE_DIR/$1"
# Mark new files on a copy of the index, so markdown-output.sh still sees them as untracked
index=$(mktemp)
trap 'rm -f "$index"' EXIT
cp "$(git rev-parse --git-path index)" "$index"
GIT_INDEX_FILE=$index git add --intent-to-add --all
GIT_INDEX_FILE=$index git --no-pager diff --no-color --no-ext-diff
