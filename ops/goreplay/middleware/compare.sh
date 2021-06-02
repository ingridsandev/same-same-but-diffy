#!/bin/sh

function log {
    >&2 echo "[DEBUG][ECHO] $1"
}

while read line; do
    log "HELLO FROM MIDDLEWARE"
done;