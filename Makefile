.PHONY: release
release:
	@git push --all
	@git push --tags
