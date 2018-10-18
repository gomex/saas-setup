.PHONY: deploy install serve

GITBOOK := $(shell command -v ./node_modules/.bin/gitbook 2> /dev/null)

deploy: install
	sh ./scripts/publish_gitbook.sh

install:
	docker run --rm -v "$PWD:/gitbook" -p 4000:4000 billryan/gitbook gitbook install

serve:
	docker run --rm -v "$PWD:/gitbook" -p 4000:4000 billryan/gitbook gitbook serve