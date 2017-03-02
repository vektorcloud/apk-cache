FROM quay.io/vektorcloud/base:3.5
MAINTAINER VektorLab <docker@vektor.nyc>

RUN apk add --no-cache nginx wget && \
    mkdir -p /srv/www /srv/www_tmp && \
    cd /srv/www && \
    wget --force-directories \
         --no-host-directories \
         -qr --level=1 -R '*.html*,*.gif' \
         http://dl-4.alpinelinux.org/alpine/ && \
    chown -Rf nginx. /srv/www*

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD nginx
