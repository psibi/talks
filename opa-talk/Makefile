.DEFAULT_GOAL = help

## Build slides
build:
	pandoc -t revealjs -s -o opa.html slides.md -V revealjs-url=./reveal.js-3.9.2 --variable theme="simple"

## Download reveal.js
download-revealjs:
	wget -O revealjs.tar.gz https://github.com/hakimel/reveal.js/archive/3.9.2.tar.gz

## Setup revealjs
setup-revealjs:
	tar -xzf revealjs.tar.gz

## Render slides
run:
	make build
	python -m SimpleHTTPServer 4000

## Show help screen.
help:
	@echo "Please use \`make <target>' where <target> is one of\n"
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "%-30s %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
