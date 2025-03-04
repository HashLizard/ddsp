#!/bin/bash

# Usage:
# sh third_party/py/ddsp/update_pip.sh
set -ex

orig_dir=$(pwd)
tmp_dir=$(mktemp -d -t ddsp-XXXX)
git clone https://github.com/magenta/ddsp.git $tmp_dir
cd $tmp_dir

python3 setup.py sdist
python3 setup.py bdist_wheel --universal
twine upload dist/*

cd $orig_dir
rm -rf $tmp_dir
