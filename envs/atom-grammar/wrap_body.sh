#!/usr/bin/env bash

set -euo pipefail

scriptpath="$( cd "$(dirname "$0")" ; pwd -P )"

cat "${scriptpath}/header.cson"

cat <<EOF
patterns: [
EOF

cat "${scriptpath}/other.cson" | \
  indented.sh

printf "\n"

cat - | \
  indented.sh

cat <<EOF
]
EOF
