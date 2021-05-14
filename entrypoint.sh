#!/usr/bin/env bash
set -euo pipefail
shopt -s extglob
shopt -u nullglob

parameter_name=$1
parameter_value=$2
committer_name=$3
committer_email=$4
repository=$5
glob=$6
push=${7:-1}

tmp=$(mktemp -d)
git config --global user.name "$committer_name"
git config --global user.email "$committer_email"
git clone --single-branch --depth 1 \
  "https://x-access-token:$GITHUB_TOKEN@github.com/$repository.git" "$tmp"

cd "$tmp"

for stack in $glob; do
  echo "=> $parameter_name=$parameter_value in $stack"
  set-stack-parameter "$stack" "$parameter_name" "$parameter_value"
  git add "$stack"
done

git commit --message "Automated update of $parameter_name"
git show

if ((push)); then
  git push -u origin HEAD
else
  echo "Refusing to push (-D given)"
fi
