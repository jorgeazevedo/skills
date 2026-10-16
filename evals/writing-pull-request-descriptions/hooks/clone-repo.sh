#!/usr/bin/env bash
# Keeps a local repo of each task's guardian/cdk-playground PR: waza can only check out tasks' commits (as git worktrees) from a local repo.
set -euo pipefail

repo=git@github.com:guardian/cdk-playground.git

# Usage: fetch_pr <number> <head commit> <base commit>
fetch_pr() {
  # Outside this repo, as worktrees' .git files point at it, so the agent can't stumble on the skill
  local clone=~/.cache/skill-evals/repos/cdk-playground-pr-$1
  local link="$(dirname "$0")/../.repos/cdk-playground-pr-$1"

  # Fetch only the PR's head commit, so the merge commit and later history aren't reachable
  git init --quiet "$clone"
  git -C "$clone" fetch --quiet --no-tags "$repo" "$2"
  # The PR's target, so the agent can compare with main
  git -C "$clone" update-ref refs/heads/main "$3"

  mkdir -p "$(dirname "$link")"
  ln -sfn "$clone" "$link"
}

fetch_pr 1138 f796cf539588cd742de83a06ed40c4378a80b490 08b0a41cbffe105c1257fbb3061f6afc3f027290
fetch_pr 1089 dba70f2065d5cbe6a42a4bbfccf391ce2c4857f9 e89bcdfc9f670ca0c840619111292396471b58fc
