#!/usr/bin/env bash
set -euo pipefail

DEFAULT_SOURCE_DIR="${SF_RETRIEVE_SOURCE_DIR:-force-app/main/default}"

has_explicit_metadata_flag=false
for arg in "$@"; do
  case "$arg" in
    --manifest|--source-dir|--metadata|--package-name|--target-metadata-dir)
      has_explicit_metadata_flag=true
      ;;
  esac
done

if [ "$has_explicit_metadata_flag" = true ]; then
  sf project retrieve start "$@"
else
  sf project retrieve start --source-dir "$DEFAULT_SOURCE_DIR" "$@"
fi
