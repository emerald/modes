#!/usr/bin/env bash

set -euo pipefail

echo "This file was generated automatically using make:" | \
  comments.sh

git-identity.sh . | \
  indented-comments.sh

date -u --iso-8601=minutes | \
  prefix.sh "Generation date-time (ISO 8601): " | \
  indented-comments.sh
