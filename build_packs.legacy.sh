#!/usr/bin/bash
# This script is to create overlays that will be applied to legacy versions (26.2 and earlier).

printf "————————————————————————————————————————————————————————\n"
printf "==> Backing up files\n"
rm -rf templates.bak
cp -r templates templates.bak
printf "==> Applying legacy patch\n"
cp './patches/legacy/templates/custom_blocks/data/bubblellaneous/loot_table/block/%[id].json' './templates/custom_blocks/data/bubblellaneous/loot_table/block/%[id].json'
cp './patches/legacy/templates/custom_items/data/bubblellaneous/loot_table/item/%[id].json' './templates/custom_items/data/bubblellaneous/loot_table/item/%[id].json'
printf "————————————————————————————————————————————————————————\n"

vintage build --delete-unused-libs --force-stringify

printf "————————————————————————————————————————————————————————\n"
printf "==> Restoring files\n"
rm -rf ./templates
mv ./templates.bak ./templates
printf "==> Creating overlay\n"
rm -rf ./overlays/1.21.11__26.2/
mkdir -p ./overlays/1.21.11__26.2/data/bubblellaneous/loot_table/block
mkdir -p ./overlays/1.21.11__26.2/data/bubblellaneous/loot_table/item
cp -r ./build/data_pack/data/bubblellaneous/loot_table/block/* ./overlays/1.21.11__26.2/data/bubblellaneous/loot_table/block/.
cp -r ./build/data_pack/data/bubblellaneous/loot_table/item/* ./overlays/1.21.11__26.2/data/bubblellaneous/loot_table/item/.
printf "————————————————————————————————————————————————————————\n"
