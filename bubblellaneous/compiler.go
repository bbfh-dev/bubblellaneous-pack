package bubblellaneous

import (
	"github.com/bbfh-dev/bubblellaneous-pack/bubblellaneous/code"
	"github.com/bbfh-dev/bubblellaneous-pack/bubblellaneous/unit"
	"github.com/bbfh-dev/bubblellaneous-pack/lib"
)

func Compile(tree *lib.Tree, unit unit.Unit, customModelData int) int {
	template := code.NewTemplate("mcfunction").
		Replace("name", unit.Id()).
		Replace("type", unit.Type()).
		Replace("recipe", "{}").
		Format()

	for _, section := range template.Sections {
		if !section.Matches() {
			continue
		}

		tree.MkFunction(section.Function(), section.Body())
	}

	return unit.ModelCount()
}
