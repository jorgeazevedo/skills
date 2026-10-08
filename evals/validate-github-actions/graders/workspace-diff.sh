#!/usr/bin/env bash
# Program grader that records the agent's changes to the repo at $1 as a unified diff; viz.html shows it.
set -euo pipefail

cd "$WAZA_WORKSPACE_DIR/$1"
# So new files show up in the diff
git add --intent-to-add --all
git --no-pager diff --no-color --no-ext-diff
