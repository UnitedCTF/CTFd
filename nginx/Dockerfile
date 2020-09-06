FROM nginx:1.19

RUN openssl dhparam -out /etc/nginx/dhparam.pem 2048
RUN sed -i "s/worker_processes  1/worker_processes auto/" /etc/nginx/nginx.conf