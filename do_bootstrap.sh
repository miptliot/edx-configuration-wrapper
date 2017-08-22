#!/bin/bash

set -e

git submodule init
git submodule update

virtualenv venv
venv/bin/pip install -r edx-configuration/requirements.txt

for i in venv/bin/ansible*; do
  ln -s $i
done
