FROM nginx:1.19

RUN openssl dhparam -out /etc/ssl/dhparam.pem 2048
RUN openssl req -newkey rsa:4096 \
    -x509 \
    -sha256 \
    -days 3650 \
    -nodes \
    -out /etc/ssl/fullchain.pem \
    -keyout /etc/ssl/privkey.pem \
    -subj "/C=CA/ST=QC/L=Montreal/O=UnitedCTF/OU=CTFd/CN=ctfd.unitedctf.ca"

RUN sed -i "s/worker_processes  1/worker_processes $(nproc)/" /etc/nginx/nginx.conf

COPY ./conf.d /etc/nginx/conf.d