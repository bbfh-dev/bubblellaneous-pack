printf "————————————————————————————————————————————————————————\n"
printf "==> Backing up files\n"
rm -f ./pack.mcmeta.bak
rm -f ./templates.bak
mv ./pack.mcmeta ./pack.mcmeta.bak
cp -r ./templates ./templates.bak
printf "==> Applying legacy patch\n"
cp ./patches/legacy/pack.mcmeta ./pack.mcmeta
cp -r ./patches/legacy/templates/* ./templates/.
printf "————————————————————————————————————————————————————————\n"

vintage build --delete-unused-libs --force-stringify $*

printf "————————————————————————————————————————————————————————\n"
printf "==> Restoring files\n"
mv ./pack.mcmeta.bak ./pack.mcmeta
mv ./templates.bak ./templates
printf "————————————————————————————————————————————————————————\n"
