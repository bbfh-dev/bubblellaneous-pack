package code

import (
	"strings"
)

type Section struct {
	function  string
	condition string
	lines     []string
}

func (section *Section) Append(str string) {
	section.lines = append(section.lines, str)
}

func (section *Section) Function() string {
	return section.function
}

func (section *Section) Matches() bool {
	fragments := strings.Split(section.condition, "==")
	if len(fragments) < 2 {
		return true
	}

	return fragments[0] == fragments[1]
}

func (section *Section) Body() []string {
	return section.lines
}
