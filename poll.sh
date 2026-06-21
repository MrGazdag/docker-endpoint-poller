#!/bin/sh

URL="${URL:-https://httpbin.org/uuid}"
INTERVAL="${INTERVAL:-5}"
CURL_OPTIONS="${CURL_OPTIONS:-s}"

while true; do
  echo "Requesting: $URL"
  curl $CURL_OPTIONS "$URL" --show-error
  echo
  sleep "$INTERVAL"
done