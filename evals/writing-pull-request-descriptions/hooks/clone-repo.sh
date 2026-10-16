#!/usr/bin/env bash
# Keeps a local repo of guardian/cdk-playground#1138: waza can only check out tasks' commits (as git worktrees) from a local repo.
set -euo pipefail

repo=git@github.com:guardian/cdk-playground.git
head=f796cf539588cd742de83a06ed40c4378a80b490
base=08b0a41cbffe105c1257fbb3061f6afc3f027290
# Outside this repo, as worktrees' .git files point at it, so the agent can't stumble on the skill
clone=~/.cache/skill-evals/repos/cdk-playground-pr-1138
link="$(dirname "$0")/../.repos/cdk-playground-pr-1138"

# Fetch only the PR's head commit, so the merge commit and later history aren't reachable
git init --quiet "$clone"
git -C "$clone" fetch --quiet --no-tags "$repo" "$head"
# The PR's target, so the agent can compare with main
git -C "$clone" update-ref refs/heads/main "$base"

mkdir -p "$(dirname "$link")"
ln -sfn "$clone" "$link"
