FROM alpine:3.16

LABEL maintainer="Sojeong Han <42.4.sohan@gmail.com>" \
    nginx-version="1.22.1" \
    alpine-version="3.16.0"

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

COPY ./error.html /usr/share/nginx/html/error.html

EXPOSE 443

STOPSIGNAL SIGQUIT

VOLUME ["/var/www/html/wordpress"]

CMD ["nginx", "-g", "daemon off;"]
