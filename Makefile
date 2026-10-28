static:
	terraform fmt -check -recursive
	cd examples/basic && terraform init -backend=false && terraform validate

unit:
	cd test && go test -tags unit -v -timeout 15m ./unit/...

integration:
	cd test && go test -tags integration -v -timeout 45m ./integration/...

.PHONY: static unit integration
