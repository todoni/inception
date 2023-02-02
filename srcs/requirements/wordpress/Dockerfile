FROM alpine:3.16

LABEL maintainer="Sojeong Han <42.4.sohan@gmail.com>" \
    php-version="8.0.27" \
    wordpress-version="latest" \
    alpine-version="3.16.0"

RUN apk update --no-cache \
    && apk add php8 php8-fpm php8-mysqli php8-phar php8-iconv mysql-client curl --no-cache \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin \
    && ln -sf /usr/local/bin/wp-cli.phar /usr/local/bin/wp-cli

ADD run.sh /scripts/run.sh

WORKDIR /var/www/html/wordpress

RUN chmod +x /scripts/run.sh

EXPOSE 9000

VOLUME ["/var/www/html/wordpress"]

ENTRYPOINT ["/scripts/run.sh"]