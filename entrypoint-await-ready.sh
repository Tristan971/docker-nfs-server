#!/usr/bin/env bash

EXPORTS_ROOT="/etc/exports"
EXPORTS_READY_MARKER_FILE=".exports-ready"

EXPORTS_READY_MARKER="$EXPORTS_ROOT/$EXPORTS_READY_MARKER_FILE"

echo "Will await the presence of [$EXPORTS_READY_MARKER] before starting"

while ! [ -f "$EXPORTS_READY_MARKER" ]; do
  echo "Exports not ready yet... Sleeping 5 seconds..."
  sleep 5
done

echo "Exports are ready! Booting server!"

/usr/local/bin/entrypoint.sh
