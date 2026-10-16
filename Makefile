# Pick an eval with e.g. `make eval EVAL=evals/writing-pull-request-descriptions`
EVAL ?= evals/validate-github-actions
RESULTS := $(CURDIR)/$(EVAL)/results
# Empty Copilot home so personal skills and instructions don't leak into runs
COPILOT_HOME := $(CURDIR)/.copilot-home
WAZA_RUN := rm -rf $(COPILOT_HOME) && mkdir -p $(COPILOT_HOME) && cd $(EVAL) && \
	COPILOT_HOME=$(COPILOT_HOME) COPILOT_GITHUB_TOKEN="$$(gh auth token)" \
	mise exec -- waza run eval.yaml -v --output-dir $(RESULTS)

.PHONY: eval with-skill without-skill serve viz

# Runs each task with the skill, then again without it (--baseline)
eval:
	$(WAZA_RUN) --baseline

with-skill:
	$(WAZA_RUN)

without-skill:
	$(WAZA_RUN) --no-skills

serve:
	mise exec -- waza serve --results-dir $(RESULTS)

# waza's dashboard doesn't show the --baseline comparison, so each eval's viz.html does; index.html links to them
viz:
	@echo "Eval reports: http://localhost:3100/"
	mise exec -- npx --yes http-server@14.1.1 -a 127.0.0.1 -p 3100 -c-1 --silent
