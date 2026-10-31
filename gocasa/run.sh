#!/bin/sh
# Maps the add-on options to GoCasa's env vars and creates its secrets on first start.
set -eu
d=${DATA_DIR:-/data}
opts=$d/options.json
secrets=$d/secrets.env

if [ ! -s "$secrets" ]; then
  umask 077
  printf 'APP_ENCRYPTION_KEY=%s\nSESSION_SECRET=%s\n' \
    "$(head -c 32 /dev/urandom | base64)" "$(head -c 32 /dev/urandom | base64)" > "$secrets.tmp"
  mv "$secrets.tmp" "$secrets"
  echo "Generated $secrets. It is in HA backups of this add-on; keep those safe."
fi
set -a
. "$secrets"
set +a

opt() { jq -r --arg k "$1" '.[$k] // empty' "$opts"; }
BASE_URL=$(opt base_url)
export BASE_URL
for k in google_client_id google_client_secret google_redirect_uri; do
  v=$(opt "$k")
  if [ -n "$v" ]; then export "$(echo "$k" | tr a-z A-Z)=$v"; fi
done
# TZ comes from HA itself (the Supervisor sets it for every add-on).

exec /gocasa
