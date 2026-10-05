EVALS := evals/validate-github-actions

.PHONY: eval with-skill without-skill serve

eval: without-skill with-skill

with-skill without-skill:
	cd $(EVALS) && mise exec -- smevals run . -c $@

serve:
	cd $(EVALS) && mise exec -- smevals serve .
