VERSION=2-1-0
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
	cp pack.mcmeta pack.png ${DATA}/.
	cp pack.mcmeta pack.png ${RESOURCE}/.
	rm -rf ${GENERATED}
	find $(realpath ${RESOURCE}/assets/) -type d -name 'template' -exec rm -r {} +
	find $(realpath ./dist/) -type d -empty -delete

format:
	@for file in $(shell find ./dist -name '*.json'); do \
        jq --tab . $$file > /tmp/code.json; \
		mv /tmp/code.json $$file; \
		echo -ne "\r"$$file"---------"; \
    done
	echo -ne "\rDone!";
