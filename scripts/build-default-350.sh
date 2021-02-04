# !/bin/bash

# A basic script to build all custom onfigs in the project for release

set -e

version=1.072
release=ArrowType-RecMonoCode-Default-350-v$version

export FONT_RESULT_DIRECTORY=fonts-default-350
export FONT_CONFIG_DIRECTORY=default-350-configs

rm -rf ./${FONT_RESULT_DIRECTORY}

configs=$(ls ./${FONT_CONFIG_DIRECTORY})

for config in $configs; do
    python scripts/instantiate-code-fonts.py ./${FONT_CONFIG_DIRECTORY}/$config
done

cp -r ./${FONT_RESULT_DIRECTORY} ./$release

zip $release.zip -r $release -x .DS_*

rm -rf $release
