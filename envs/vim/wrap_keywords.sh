#!/usr/bin/env bash

set -euo pipefail

script="$1"

printf "Generated using ${script}\n" | \
  comments.sh

cat - | \
  paste -d " " - - | \
  paste -d " " - - | \
  prefix.sh "syn keyword Keyword "
