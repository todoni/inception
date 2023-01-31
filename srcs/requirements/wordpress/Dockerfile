FROM alpine:3.16

RUN apk update --no-cache \
    && apk add php8 php8-fpm php8-mysqli php8-phar curl \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin \
    && ln -sf /usr/local/bin/wp-cli.phar /usr/local/bin/wp-cli

ADD run.sh /scripts/run.sh

RUN chmod +x /scripts/run.sh

EXPOSE 9000

CMD ["/scripts/run.sh"]