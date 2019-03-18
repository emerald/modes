#!/usr/bin/env bash

set -euo pipefail

if [ $# -lt 1 ]; then
  printf "Usage: $0 <Path to local Git repository>" 1>&2
fi

cd "$1"

git remote get-url origin | \
  tr ":" "/" | \
  sed "s/^git@/https:\\/\\//" | \
  sed "s/\\.git$//" | \
  sed "s/^/Git URL: /"

n_tags=$(git tag -l | wc -l)

if [[ $n_tags -eq 0 ]]; then
  printf "Git tag: (none)\n"
else
  desc="$(git describe --tags --abbrev=40)"
  if [[ "${desc}" != *"-"* ]]; then
    printf "Git tag: ${desc} (ahead by 0 commits)\n"
  else
    IFS=- read tag n_commits commit <<< "${desc}"
    printf "Git tag: ${tag} (ahead by ${n_commits} commit"
    if [[ "${n_commits}" -gt 1 ]]; then
      printf "s"
    fi
    printf ")\n"
  fi
fi

commit="$(git rev-parse HEAD)"
printf "Git commit: ${commit}\n"
