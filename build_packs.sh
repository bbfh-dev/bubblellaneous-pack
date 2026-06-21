#!/bin/bash

vintage build --delete-unused-libs --force-stringify $*
cp -r ./overlays/* ./build/data_pack/.
