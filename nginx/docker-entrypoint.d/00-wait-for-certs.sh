#!/bin/bash

echo -n "Waiting for certs "
while [ ! -f "/etc/letsencrypt/live/$HOST/fullchain.pem" ]; do
    echo -n "."
    sleep 1
done
echo " Done!"