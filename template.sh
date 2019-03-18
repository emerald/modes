#!/usr/bin/env bash

set -euo pipefail

cat LICENSE | comments.sh

printf "\n"

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

keywords_and_types() {
  printf "Keywords and built-in types, as found in:\n\n"
  git-identity.sh "$EMERALD_PATH" | indented.sh
}

body() {
  keywords_and_types | comments.sh
  printf "\n"
  keywords_script="bin/getkeywords.sh"
  builtins_script="bin/getbuiltins.sh"
  "$EMERALD_PATH/${keywords_script}" | \
    wrap_keywords.sh "${keywords_script}"
  printf "\n"
  "$EMERALD_PATH/${builtins_script}" | \
    wrap_builtins.sh "${builtins_script}"
}

body | wrap_body.sh
