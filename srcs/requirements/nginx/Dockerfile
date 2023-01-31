FROM alpine:3.16

MAINTAINER sohan <sohan@student.42seoul.kr>

WORKDIR /etc/ssl/private

RUN set -x \
	&& addgroup -g 101 -S nginx \
    && adduser -S -D -H -u 101 -h /var/cache/nginx -s /sbin/nologin -G nginx -g nginx nginx \
	&& apk update --no-cache \
	&& apk add --no-cache nginx openssl\
	&& openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 \
    	-subj "/C=KR/ST=Denial/L=Seoul/O=Dis/CN=sohan.42.fr" \
    	-keyout rootca.key -out rootca.crt

COPY ./my.conf /etc/nginx/http.d/my.conf

EXPOSE 443

STOPSIGNAL SIGQUIT

ENTRYPOINT ["nginx", "-g", "daemon off;"]
