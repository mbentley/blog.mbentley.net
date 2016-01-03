all: build

build: clean
	@docker run -it --rm -v $(shell pwd):/data mbentley/hugo -v

clean:
	@rm -rfv public/*

image: build
	@docker build -t mbentley/blog.mbentley.net:latest .

run:
	@docker run -it --rm -p 80:80 mbentley/blog.mbentley.net:latest

server:
	@docker run -it --rm -p 1313:1313 -v $(shell pwd):/data mbentley/hugo server --bind 0.0.0.0 || true

.PHONY: all build clean image run server
