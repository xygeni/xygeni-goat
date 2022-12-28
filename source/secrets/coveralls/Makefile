TOOLS_BIN=$(shell pwd)/.tools
COVERALLS_REPO_TOKEN=wms25r3w3mu4z4e8n3fzatebfuq47kake
# A comment

# This is the first line of a comment \
and this is still part of the comment \
as is this, since I keep ending each line \
with a backslash character

install:
	go mod download
	rm -rf $(TOOLS_BIN)
	mkdir -p $(TOOLS_BIN)
	GO111MODULE=off GOBIN=$(TOOLS_BIN) go get golang.org/x/tools/cmd/cover
	GO111MODULE=off GOBIN=$(TOOLS_BIN) go get github.com/mattn/goveralls
	curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(TOOLS_BIN) v1.38.0

lint:
	$(TOOLS_BIN)/golangci-lint -v run ./...

generate:
	go generate -v ./...

build:
	go build -race -v ./...

tests:
	@if [ "$(COVERALLS_TOKEN)" = "dev" ]; then \
		go test -race -v ./... ;\
  	else \
		go test -race -v -covermode=atomic -coverprofile=coverage.out ./... ;\
		$(TOOLS_BIN)/goveralls -coverprofile=coverage.out -repotoken wms25r3w3mu4z4e8n3fzatebfuq47kake ;\
	fi

pre-commite: generate lint tests

ci: install build lint tests