#!/bin/bash

function usage() {
  echo "Usage: $0 PATH_TO_MAIN_PLAYBOOKS" >&2
  exit 1
}

set -e

[[ -n "$1" ]] || usage

git submodule init
git submodule update

virtualenv venv
venv/bin/pip install -r edx-configuration/requirements.txt

for i in venv/bin/ansible*; do
  ln -s $i
done

for d in group_vars inventory lookup_plugins maps pw; do
  ln -s $1/$d
done
