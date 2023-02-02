FROM alpine:3.16

LABEL maintainer="Sojeong Han <42.4.sohan@gmail.com>" \
    mairadb-version="10.6.10" \
    alpine-version="3.16.0"

RUN set -x \
	&& apk update --no-cache \
    && apk add mysql mysql-client --no-cache

ADD run.sh /scripts/run.sh
RUN mkdir /docker-entrypoint-initdb.d && \
    mkdir /scripts/pre-exec.d && \
    mkdir /scripts/pre-init.d && \
    chmod -R 755 /scripts

EXPOSE 3306

VOLUME ["/var/lib/mysql"]

ENTRYPOINT [ "/scripts/run.sh" ]