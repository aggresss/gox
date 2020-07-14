all: test gofmt-check govet-check

test:
	go test -race ./...

gofmt-check:
	find . -name "*.go" | egrep -v "\/vendor\/"  |  xargs gofmt -s -l -e

govet-check:
	go list ./... | egrep -v "\/vendor\/" | xargs go vet -composites=false
