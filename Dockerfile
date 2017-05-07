FROM nginx:alpine
MAINTAINER Zac Duncan-Lee <zac@thesinkingship.com.au>
RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && \
    apk upgrade

RUN apk add php5-fpm php5-curl php5-dom php5-openssl php5-xml php5-json && \
    rm -rf /var/cache/apk/* && \
    mkdir /app

VOLUME /app

COPY ./default.conf /etc/nginx/conf.d/
COPY ./code /app

CMD nginx && php-fpm -F