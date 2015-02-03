.PHONY: default build

default: build

build: node_modules

dist: node_modules index.html
	mkdir -p dist && ./node_modules/.bin/vulcanize index.html -o dist/index.html

node_modules: package.json
	npm install
	touch $@

clean:
	rm -rf node_modules dist

env=dev
deploy: dist
	./node_modules/.bin/lfcdn -e $(env)

