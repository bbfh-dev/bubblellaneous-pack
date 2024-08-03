#!/usr/bin/bash


for file in $(find ./dist -name '*.json'); do
    jq --tab . $file > /tmp/code.json;
    mv /tmp/code.json $file;
    echo -ne "\r"$file
done;
echo "\n"
