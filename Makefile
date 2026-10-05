EVALS := evals/validate-github-actions

.PHONY: eval with-skill without-skill grade serve

eval: without-skill with-skill grade

with-skill without-skill:
	cd $(EVALS) && mise exec -- smevals run . -c $@

# Separate from run -g so a failing baseline grade doesn't stop with-skill from running
grade:
	cd $(EVALS) && mise exec -- smevals grade .

serve:
	cd $(EVALS) && mise exec -- smevals serve .
