REVIEWDOG_ARG ?= -diff="git diff master"

LINT_TOOLS=\
	github.com/reviewdog/reviewdog/cmd/reviewdog \
	golang.org/x/lint/golint

.PHONY: all
all: reviewdog

.PHONY: bootstrap-lint-tools
bootstrap-lint-tools:
	@for tool in $(LINT_TOOLS) ; do \
		echo "Installing/Updating $$tool" ; \
		go get -u $$tool; \
	done

.PHONY: reviewdog
reviewdog:
	reviewdog $(REVIEWDOG_ARG)

