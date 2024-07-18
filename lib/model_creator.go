package lib

import (
	"fmt"
	"os"
	"path/filepath"
)

type modelCreator struct {
	tree *Tree
	from string
	to   string
	dir  bool
	data string
}

func (creator *modelCreator) From(dir bool, path ...string) *modelCreator {
	creator.dir = dir
	creator.from = filepath.Join(path...)
	return creator
}

func (creator *modelCreator) To(path ...string) *modelCreator {
	creator.to = filepath.Join(path...)
	return creator
}

func (creator *modelCreator) Save() {
	_, err := os.Stat(fmt.Sprintf("%s.json", creator.from))
	if os.IsNotExist(err) {
		panic(err)
	}

	var body string
	if creator.dir {

	} else {
		from := fmt.Sprintf("%s.json", creator.from)
		data, err := os.ReadFile(from)
		if err != nil {
			panic(err)
		}
		body = string(data)
	}

	creator.tree.SetModel(creator.from, creator.to, creator.dir, body)
}
