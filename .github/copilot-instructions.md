# Context

A [waza](https://github.com/microsoft/waza) project of agent skills for GitHub Copilot: skills in `skills/<name>/SKILL.md`, evals in `evals/<name>/`. `validate-github-actions` has an eval that runs the agent on a fixed commit of guardian/cdk-playground. Tools are pinned through mise `.tool-versions`.

# Bash commands
- `make eval`: run the eval with and without the skill (`waza run --baseline`), results in `evals/validate-github-actions/results/`
- `make with-skill` / `make without-skill`: run one config
- Runs are graded as they finish (pass = a bash call ran actionlint and zizmor on ci.yaml)
- `make serve`: serve the waza dashboard of the results
- `make viz`: serve a with-skill vs without-skill report of the `--baseline` results on http://localhost:3100/viz.html

# Workflow
- Run `gh auth login` before running evals.
- After you edit a `SKILL.md`, run `make eval` and check the skill still improves on the baseline.
