FROM alpine:latest
MAINTAINER Bradley Cicenas <bradley.cicenas@gmail.com>

RUN apk add --update nginx wget && \
    mkdir -p /srv/www /srv/www_tmp && \
    cd /srv/www && \
    wget --force-directories -r --level=1 -R '*.html*,*.gif' \
         --quiet http://dl-4.alpinelinux.org/alpine/ && \
    mv dl-4.alpinelinux.org/* . && \
    chown -Rf nginx. /srv/www*

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD nginx
