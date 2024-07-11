package code

import (
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"
)

type Template struct {
	Name       string
	Sections   []Section
	formatting map[string]string
}

func NewTemplate(name string) *Template {
	template := &Template{
		Name:       name,
		Sections:   []Section{},
		formatting: map[string]string{},
	}

	return template.Load()
}

func (template *Template) Load() *Template {
	path, _ := filepath.Abs(fmt.Sprintf("./bubblellaneous/code/%s.template", template.Name))
	data, err := os.ReadFile(path)
	if err != nil {
		log.Panicf("Template %q could not be loaded: %v", template.Name, err)
	}

	lines := strings.Split(string(data), "\n")
	var beginSection bool
	var currentSection Section

	for _, line := range lines {
		if strings.HasPrefix(line, "#=> ") {
			if beginSection {
				template.Sections = append(template.Sections, currentSection)
			}

			line = strings.ReplaceAll(line[4:], " ", "")
			fragments := strings.Split(line, ";")

			if len(fragments) == 1 {
				currentSection = Section{
					function:  fragments[0],
					condition: "",
					lines:     []string{},
				}
			} else {
				currentSection = Section{
					function:  fragments[0],
					condition: fragments[1],
					lines:     []string{},
				}
			}

			beginSection = true
			continue
		}

		currentSection.Append(line)
	}

	template.Sections = append(template.Sections, currentSection)

	return template
}

func (template *Template) Replace(key string, target string) *Template {
	template.formatting[fmt.Sprintf("[%s]", key)] = target

	return template
}

func (template *Template) format(str string) string {
	for key, formatting := range template.formatting {
		str = strings.ReplaceAll(str, key, formatting)
	}

	return str
}

func (template *Template) Format() *Template {
	for i, section := range template.Sections {
		section.function = template.format(section.function)
		section.condition = template.format(section.condition)

		for j, line := range section.lines {
			line = template.format(line)
			section.lines[j] = line
		}

		template.Sections[i] = section
	}

	return template
}
