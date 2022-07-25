#FROM nginx
FROM nginx:1.23.0-alpine-perl

#RUN apt update && apt-get install moreutils -y
#RUN apt-get install gettext-base -y

COPY api.conf /etc/nginx/conf.d/
#COPY web-admin.conf /etc/nginx/conf.d/
#COPY web-client.conf /etc/nginx/conf.d/

COPY proxy_set_header.conf /etc/nginx/conf.d/

#COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80/tcp

EXPOSE 443/tcp

CMD ["/bin/sh", "-c", "exec nginx -g 'daemon off;';"]

WORKDIR /usr/share/nginx/html
