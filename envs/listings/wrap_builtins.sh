#!/usr/bin/env bash

set -euo pipefail

script="$1"

cat <<EOF
moreemph={
EOF

printf "Generated using ${script}\n" | \
  comments.sh | indented.sh

cat - | \
  sed -e "s/$/,/g" | \
  paste -d " " - - | \
  perl -0pe "s/[, ]+$//" | \
  indented.sh

cat <<EOF
},
EOF
