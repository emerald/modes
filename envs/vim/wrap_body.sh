#!/usr/bin/env bash

set -euo pipefail

scriptpath="$( cd "$(dirname "$0")" ; pwd -P )"

cat "${scriptpath}/other.vim"

printf "\n"

cat -
