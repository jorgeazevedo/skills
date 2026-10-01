#!/usr/bin/env bash
# Keeps a local clone of the task repo: waza can only check out tasks' commits (as git worktrees) from a local repo.
set -euo pipefail

repo=git@github.com:guardian/cdk-playground.git
dest="$(dirname "$0")/../.repos/cdk-playground"

if [[ -d "$dest" ]]; then
  git -C "$dest" fetch --quiet
else
  git clone --quiet "$repo" "$dest"
fi
