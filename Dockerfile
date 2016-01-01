FROM alpine:latest

RUN apk add --update nginx && rm -rf /var/cache/apk/* /usr/share/nginx/html/* /etc/nginx/*.default

COPY public /usr/share/nginx/html/

RUN ln -sf /dev/stdout /var/log/nginx/access.log &&\
  ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["/usr/sbin/nginx","-g","daemon off;"]
