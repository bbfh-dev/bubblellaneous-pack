#!/bin/bash

vintage build --delete-unused-libs --force-stringify $*

# This is a workaround, due to vintage (the build tool) not supporting overlays yet.
cp -r ./overlays/* ./build/data_pack/.
jq --tab 'del(.overlays)' ./build/resource_pack/pack.mcmeta >/tmp/pack.mcmeta
mv /tmp/pack.mcmeta ./build/resource_pack/pack.mcmeta
