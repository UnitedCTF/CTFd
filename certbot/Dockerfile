FROM ubuntu:20.04

RUN apt update
RUN apt install -y nginx certbot

RUN echo "<!-- ¯\\_(ツ)_/¯ --!>" > /var/www/html/index.nginx-debian.html
RUN echo "server {\n    listen 80;\n    server_name _;\n\n    location /.well-known/acme-challenge/ {\n        root /var/www/html;\n    }\n\n    location / {\n        return 301 https://\$host\$request_uri;\n    }\n  }" > /etc/nginx/sites-available/default

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]