#!/bin/bash
set -e

if [ -z "$EMAIL" ] || [ -z "$DOMAINS" ]; then
    echo "missing email and/or domains"
    exit 1
fi

nginx

CMDLINE="certbot certonly --agree-tos --webroot -w /var/www/html -m \"$EMAIL\""
readarray -td, DOMAINS <<< "$DOMAINS"
for domain in $DOMAINS; do
    CMDLINE="$CMDLINE -d \"$domain\""
done

if [ ! -z "$DRY_RUN" ]; then
    eval "$CMDLINE --dry-run"
    exit 0
fi

eval "$CMDLINE"

while :; do
    sleep 24h
    certbot renew
done