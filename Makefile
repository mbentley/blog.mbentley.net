all: build

build: clean
	hugo --logLevel info

clean:
	rm -rfv public/*

server:
	hugo server --logLevel info || true

image:
	docker build --pull --progress plain -t mbentley/blog.mbentley.net:latest .

run: image
	docker run -it --rm -p 80:80 mbentley/blog.mbentley.net:latest

.PHONY: all build clean image run server
