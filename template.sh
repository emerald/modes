#!/usr/bin/env bash

set -euo pipefail

printf "This file was generated automatically using make:\n\n" | \
  comments.sh

git-identity.sh . | \
  indented-comments.sh

date -u --iso-8601=minutes | \
  prefix.sh "Generation date-time (ISO 8601): " | \
  indented-comments.sh

printf "\n"

perl -pe "chomp if eof" LICENSE | \
  comments.sh
