VERSION=2-1-0
DATA=./dist/bubblellaneous_${VERSION}_data_pack
RESOURCE=./dist/bubblellaneous_${VERSION}_resource_pack
GENERATED=/tmp/bubblellaneous-generated

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
	go run ./main.go $(realpath ${GENERATED})
	cp -ir ${GENERATED}/data/* ${DATA}/data/.
	cp -ir ${GENERATED}/assets ${RESOURCE}/assets
	cp pack.mcmeta pack.png ${DATA}/.
	cp pack.mcmeta pack.png ${RESOURCE}/.
	rm -rf ${GENERATED}

format:
	prettier ${DATA}/**/*.json ${RESOURCE}/**/*.json --use-tabs --write
