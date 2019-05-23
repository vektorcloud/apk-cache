FROM quay.io/vektorcloud/base:3.9
MAINTAINER VektorLab <docker@vektor.nyc>

RUN apk add --no-cache nginx wget && \
    mkdir -p /srv/www /srv/www_tmp/alpine && \
    cd /srv/www && \
    wget --force-directories \
         --no-host-directories \
         -qr --level=1 -R '*.html*,*.gif' \
         http://dl-cdn.alpinelinux.org/alpine/ && \
    chown -Rf nginx. /srv/www*

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD nginx
