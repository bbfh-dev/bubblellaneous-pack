VERSION=2-1-1
DATA=./dist/bubblellaneous_${VERSION}_data_pack
RESOURCE=./dist/bubblellaneous_${VERSION}_resource_pack
GENERATED=/tmp/bubblellaneous-generated
LANG=./minecraft/lang.tsv

setup:
	# --- Setup directories
	rm -rf ./dist/*
	mkdir ${DATA}
	mkdir ${RESOURCE}
	mkdir -p ${GENERATED}/data
	mkdir -p ${GENERATED}/assets

merge:
	# --- Merge base data/resource pack
	cp -r ./minecraft/data ${DATA}/data
	cp -r ./minecraft/assets ${RESOURCE}/assets


build: setup merge
	# --- Compile Bubblellaneous
	go run ./main.go $(realpath ${GENERATED}) $(realpath ${RESOURCE}/assets) $(realpath ${LANG})
	cp -r ${GENERATED}/data/* ${DATA}/data/.
	cp -r ${GENERATED}/assets/* ${RESOURCE}/assets/.
	cp pack-data.mcmeta ${DATA}/pack.mcmeta
	cp pack.png ${DATA}/.
	cp pack-assets.mcmeta ${RESOURCE}/pack.mcmeta
	cp pack.png ${RESOURCE}/.
	# --- Clean up
	rm -rf ${GENERATED}
	# find $(realpath ${RESOURCE}/assets/) -type d -name 'template' -exec rm -r {} +
	find $(realpath ./dist/) -type d -empty -delete
	# --- Apply datapack prefix
	find ./dist/ -type f -exec sed -i 's/local\./bbln\./g' {} +

format:
	./format.sh # outsourced to bash
