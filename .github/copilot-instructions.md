# Context

Agent skills for GitHub Copilot (`skills/<name>/SKILL.md`). `validate-github-actions` has evals that use smevals and the Copilot CLI, with tools pinned through mise `.tool-versions`.

# Bash commands
- `make eval`: run the evals without the skill, then with it
- `make with-skill` / `make without-skill`: run one config
- `make serve`: serve the HTML report of the runs at http://127.0.0.1:7001

# Workflow
- Run `gh auth login` before running evals.
- After you edit a `SKILL.md`, run `make eval` and compare the transcripts in `skills/validate-github-actions/evals/runs/`. There is no grader yet.
