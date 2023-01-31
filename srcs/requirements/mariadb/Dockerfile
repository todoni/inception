FROM alpine:3.16

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