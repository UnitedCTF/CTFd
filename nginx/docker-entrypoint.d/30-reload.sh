#!/bin/bash

{
    while :; do
        sleep 24h
        nginx -s reload
    done
} &