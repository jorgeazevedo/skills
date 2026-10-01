# Context

A [waza](https://github.com/microsoft/waza) project of agent skills for GitHub Copilot: skills in `skills/<name>/SKILL.md`, evals in `evals/<name>/`. `validate-github-actions` has an eval that checks the agent runs `actionlint` and `zizmor`. Tools are pinned through mise `.tool-versions`.

# Bash commands
- `make eval`: run the eval with the skill, then without it (`waza run --baseline`), results in `results/`
- `make serve`: serve the waza dashboard of the results
- `make viz`: serve a with-skill vs without-skill report of the `--baseline` results on http://localhost:3100

# Workflow
- Run `gh auth login` before running evals.
- After you edit a `SKILL.md`, run `make eval` and check the skill still improves on the baseline.
