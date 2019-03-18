#!/usr/bin/env bash

set -euo pipefail

script="$1"

printf "Generated using ${script}\n" | \
  comments.sh

scope="entity.name.type"

prefix="{\n  match: '\\\\\\\\b(?i)("
suffix=")\\\\\\\\b'\n  name: '${scope}'\n}/"

cat - | \
  paste -d "|" - - | \
  perl -pe "s/(.*)/${prefix}\1${suffix}"
