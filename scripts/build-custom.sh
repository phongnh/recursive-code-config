# !/bin/bash

# A basic script to build all custom onfigs in the project for release

set -e

version=1.072
release=ArrowType-RecMonoCode-Custom-v$version

rm -rf ./fonts

configs=$(ls ./custom-configs)

for config in $configs; do
    python scripts/instantiate-code-fonts.py ./custom-configs/$config
done

cp -r ./fonts ./$release

zip $release.zip -r $release -x .DS_*

rm -rf $release
