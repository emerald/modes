#!/usr/bin/env bash

set -euo pipefail

script="$1"

cat <<EOF
morekeywords={
EOF

printf "Generated using ${script}\n" | \
  comments-indented.sh

cat - | \
  sed -e "s/$/,/g" | \
  paste -d " " - - | \
  paste -d " " - - | \
  perl -0pe "s/[, ]+$//" | \
  indented.sh

cat <<EOF
},
EOF
