#!/usr/bin/env bash

set -euo pipefail

cat <<EOF
\lstdefinelanguage{emerald}
{
  sensitive = false,
  morecomment = [l]{\\%},
  morestring = [b]",
  morestring = [b]',
  %
EOF

cat - | \
  sed "s/^$/% /" | \
  indented.sh

cat <<EOF
}
EOF
