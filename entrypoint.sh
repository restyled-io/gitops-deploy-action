#!/usr/bin/env bash
set -euo pipefail
shopt -s extglob
shopt -s globstar

parameter_name=$1
parameter_value=$2
committer_name=$3
committer_email=$4
repository=$5
glob=$6
push=$7

tmp=$(mktemp -d)
git config --global user.name "$committer_name"
git config --global user.email "$committer_email"

if ((push)); then
  git clone --single-branch --depth 1 \
    "https://x-access-token:$GITHUB_TOKEN@github.com/$repository.git" "$tmp"
else
  # No need for token when testing without push
  git clone --single-branch --depth 1 "https://github.com/$repository.git" "$tmp"
fi

cd "$tmp"

# shellcheck disable=2086
set-stack-parameter --name "$parameter_name" --value "$parameter_value" $glob

# shellcheck disable=2086
if ! git commit --message "Automated update of $parameter_name" $glob; then
  echo "No Parameters were updated"
  exit 1
fi

git show

if ((push)); then
  git push -u origin HEAD
else
  echo "Refusing to push (-D given)"
fi
