#!/bin/bash

# Replace with Starseed's templates
if [ ! -z $STARSEED ]; then
    printf "————————————————————————————————————————————————————————\n"
    for file in ./patches/starseed/templates/custom_items/*.json; do
        if [ -f $file ]; then
            base=$(basename $file)
            cp ./templates/custom_items/definitions/$base ./templates_custom_items_definitions_$base.bak
            cp $file ./templates/custom_items/definitions/$base
            printf "==> Replaced %q\n" $base
        fi
    done
    for file in ./patches/starseed/templates/custom_blocks/*.json; do
        if [ -f $file ]; then
            base=$(basename $file)
            cp ./templates/custom_blocks/definitions/$base ./templates_custom_blocks_definitions_$base.bak
            cp $file ./templates/custom_blocks/definitions/$base
            printf "==> Replaced %q\n" $base
        fi
    done
    printf "————————————————————————————————————————————————————————\n"
fi

vintage build --delete-unused-libs --force-stringify $*

# Revert
if [ ! -z $STARSEED ]; then
    printf "————————————————————————————————————————————————————————\n"
    for file in ./patches/starseed/templates/custom_items/*.json; do
        if [ -f $file ]; then
            base=$(basename $file)
            mv ./templates_custom_items_definitions_$base.bak ./templates/custom_items/definitions/$base
            printf "==> Reverted %q\n" $base
        fi
    done
    for file in ./patches/starseed/templates/custom_blocks/*.json; do
        if [ -f $file ]; then
            base=$(basename $file)
            mv ./templates_custom_blocks_definitions_$base.bak ./templates/custom_blocks/definitions/$base
            printf "==> Reverted %q\n" $base
        fi
    done
    printf "————————————————————————————————————————————————————————\n"
fi
