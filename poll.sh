#!/bin/sh

URL="${URL:-https://httpbin.org/uuid}"
INTERVAL="${INTERVAL:-5}"

while true; do
  echo "Requesting: $URL"
  curl -s "$URL" --show-error
  echo
  sleep "$INTERVAL"
done