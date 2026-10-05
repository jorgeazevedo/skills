#!/usr/bin/env bash
# Keeps a local repo of the task's commit: waza can only check out tasks' commits (as git worktrees) from a local repo.
set -euo pipefail

repo=git@github.com:guardian/cdk-playground.git
commit=a591ec1863d047e6ef6bacc58f10f4c58b7e255c
# Outside this repo, as worktrees' .git files point at it, so the agent can't stumble on the skill
clone=~/.cache/skill-evals/repos/cdk-playground
link="$(dirname "$0")/../.repos/cdk-playground"

# Fetch only the pinned commit so no later history or tags are reachable
git init --quiet "$clone"
git -C "$clone" fetch --quiet --no-tags "$repo" "$commit"

mkdir -p "$(dirname "$link")"
ln -sfn "$clone" "$link"
