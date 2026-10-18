printf "————————————————————————————————————————————————————————\n"
printf "==> Backing up files\n"
rm -f pack.mcmeta.bak
rm -rf templates.bak
mv pack.mcmeta pack.mcmeta.bak
cp -r templates templates.bak
printf "==> Applying legacy patch\n"
cp ./patches/legacy/pack.mcmeta ./pack.mcmeta
cp './patches/legacy/templates/custom_blocks/data/bubblellaneous/loot_table/block/%[id].json' './templates/custom_blocks/data/bubblellaneous/loot_table/block/%[id].json'
cp './patches/legacy/templates/custom_items/data/bubblellaneous/loot_table/item/%[id].json' './templates/custom_items/data/bubblellaneous/loot_table/item/%[id].json'
printf "————————————————————————————————————————————————————————\n"

vintage build --delete-unused-libs --force-stringify $*

printf "————————————————————————————————————————————————————————\n"
printf "==> Restoring files\n"
mv ./pack.mcmeta.bak ./pack.mcmeta
rm -rf ./templates
mv ./templates.bak ./templates
printf "————————————————————————————————————————————————————————\n"
