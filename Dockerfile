# build
FROM mbentley/hugo:latest as build
MAINTAINER Matt Bentley <mbentley@mbentley.net>

COPY / /data/

RUN hugo -v &&\
  chown -R 33:33 /data/public &&\
  find . -type f -exec chmod 644 {} \; &&\
  find . -type d -exec chmod 755 {} \;

# final image
FROM mbentley/nginx:latest
MAINTAINER Matt Bentley <mbentley@mbentley.net>

COPY --from=build /data/public /var/www
