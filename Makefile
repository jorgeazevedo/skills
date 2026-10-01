EVAL := evals/validate-github-actions
# Empty Copilot home so personal skills and instructions don't leak into runs
COPILOT_HOME := $(CURDIR)/.copilot-home

.PHONY: eval serve viz

# Runs each task with the skill, then again without it (--baseline)
eval:
	rm -rf $(COPILOT_HOME) && mkdir -p $(COPILOT_HOME)
	cd $(EVAL) && COPILOT_HOME=$(COPILOT_HOME) COPILOT_GITHUB_TOKEN="$$(gh auth token)" \
		mise exec -- waza run eval.yaml --baseline -v --output-dir $(CURDIR)/results

serve:
	mise exec -- waza serve --results-dir results

# waza's dashboard doesn't show the --baseline comparison, so this does
viz:
	mise exec -- node viz/serve.mjs
