#!/usr/bin/env bash

set -euo pipefail

READINESS_MARKER_LOCATION="${READINESS_MARKER_LOCATION:-/nfs/.ready}"

echo "Will await the presence of [$READINESS_MARKER_LOCATION] before starting"

while ! [ -f "$READINESS_MARKER_LOCATION" ]; do
  echo "Readiness marker [$READINESS_MARKER_LOCATION] not present yet... Sleeping 5 seconds..."
  sleep 5
done

echo "Exports are ready! Booting server!"

/usr/local/bin/entrypoint.sh
