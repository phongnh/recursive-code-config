#!/usr/bin/env bash

# A basic script to build all premade onfigs in the project for release

set -e

export FONT_RESULT_DIRECTORY=fonts-premade
export FONT_CONFIG_DIRECTORY=premade-configs

fontPath=$1

[ -z "$fontPath" ] && fontPath=$(find font-data -name "Recursive*.ttf" -print | tail -1)

version=$(basename $fontPath ".ttf" | cut -d "_" -f3)
release=ArrowType-RecMonoCode-v$version



rm -rf ./${FONT_RESULT_DIRECTORY}

configs=$(ls ./${FONT_CONFIG_DIRECTORY})

for config in $configs; do
    python scripts/instantiate-code-fonts.py ./${FONT_CONFIG_DIRECTORY}/$config
done

cp -r ./${FONT_RESULT_DIRECTORY} ./$release

zip $release.zip -r $release -x .DS_*

rm -rf $release
