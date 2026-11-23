# Makefile - same targets locally and in Jenkins (copy into each terraform-google-* repo)
SHELL      := /bin/bash
IT_TIMEOUT ?= 90m

.PHONY: static unit integration clean-reports

static:
	terraform fmt -check -recursive
	tflint --init && tflint --recursive
	for d in examples/*/; do (cd $$d && terraform init -backend=false -input=false >/dev/null && terraform validate) || exit 1; done

unit: clean-reports
	cd test && gotestsum --format testname --junitfile ../reports/unit.xml -- \
	    -tags unit -timeout 15m -parallel 8 ./unit/...

integration: clean-reports
	cd test && gotestsum --format standard-verbose --junitfile ../reports/integration.xml -- \
	    -tags integration -timeout $(IT_TIMEOUT) -parallel 4 ./integration/... 2>&1 | tee ../reports/integration.log; \
	exit $${PIPESTATUS[0]}

clean-reports:
	mkdir -p reports