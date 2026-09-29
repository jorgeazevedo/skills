EVALS := skills/validate-github-actions/evals

.PHONY: eval with-skill without-skill serve

eval: without-skill with-skill

with-skill without-skill:
	cd $(EVALS) && mise exec -- smevals run . -c $@

serve:
	cd $(EVALS) && mise exec -- smevals serve .
