#!/usr/bin/env bash

set -euo pipefail

header() {
  printf "This file was generated automatically using make:\n\n"
  git-identity.sh . | indented.sh
  printf "\n"
  date -u --iso-8601=minutes | \
    prefix.sh "Generation date-time (ISO 8601): " | \
    indented.sh
}

header | comments.sh

printf "\n"

perl -pe "chomp if eof" LICENSE | \
  comments.sh
