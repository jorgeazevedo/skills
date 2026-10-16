# Context

A [waza](https://github.com/microsoft/waza) project of agent skills for GitHub Copilot: skills in `skills/<name>/SKILL.md`, evals in `evals/<name>/`. Both evals run the agent on fixed commits of guardian/cdk-playground: `validate-github-actions` asks it to validate ci.yaml, and `writing-pull-request-descriptions` asks it to describe PR #1138 in PR.md. Tools are pinned through mise `.tool-versions`.

# Bash commands
- `make eval`: run the eval with and without the skill (`waza run --baseline`), results in `evals/<name>/results/`. Defaults to `validate-github-actions`; pick another with `EVAL=evals/<name>`
- `make with-skill` / `make without-skill`: run one config
- Runs are graded as they finish (validate-github-actions: pass = a bash call ran actionlint and zizmor on ci.yaml; writing-pull-request-descriptions: pass = a markdown file was written without looking up the real PR on GitHub)
- `make serve`: serve the waza dashboard of the results
- `make viz`: serve http://localhost:3100/, which lists the evals and links to each eval's `evals/<name>/viz.html` report of its `--baseline` results

# Workflow
- Run `gh auth login` before running evals.
- After you edit a `SKILL.md`, run `make eval` and check the skill still improves on the baseline.
