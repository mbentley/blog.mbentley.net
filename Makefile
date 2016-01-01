all: build

build: clean
	@hugo -v

clean:
	@rm -rfv public/*

server:
	@hugo server --bind 0.0.0.0 || true

.PHONY: all build clean server
