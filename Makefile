.PHONY: test
test:
	docker build --tag restyled/gitops-deploy-action .
	cram --shell bash integration
