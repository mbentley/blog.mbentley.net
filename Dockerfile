# build
FROM mbentley/hugo:latest AS build
LABEL maintainer="Matt Bentley <mbentley@mbentley.net>"

COPY / /data/

RUN hugo -v &&\
  chown -R 33:33 /data/public &&\
  find . -type f -exec chmod 644 {} \; &&\
  find . -type d -exec chmod 755 {} \;

# final image
FROM mbentley/nginx:latest
LABEL maintainer="Matt Bentley <mbentley@mbentley.net>"

COPY --from=build /data/public /var/www
