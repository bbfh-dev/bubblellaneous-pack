package lang

import (
	"encoding/csv"
	"fmt"
	"os"
)

func ReadFromFile(filepath string) (lines []*Line) {
	f, _ := os.Open(filepath)
	defer f.Close()

	r := csv.NewReader(f)
	r.Comma = '\t'

	records, err := r.ReadAll()
	if err != nil {
		panic(err)
	}
	records = records[1:] // reslice to omit header

	for _, record := range records {
		lines = append(lines, NewLine(record))
	}

	return lines
}

func GetLangFile(lines []*Line) map[string]map[string]string {
	langs := map[string]map[string]string{}
	keys := []string{"en_us", "en_gb", "ru_ru", "ja_jp", "cs_cz", "it_it", "tok"}

	for _, key := range keys {
		langs[key] = map[string]string{}
	}

	for _, line := range lines {
		if len(line.EN_US) > 0 {
			langs["en_us"][fmt.Sprintf("%s.bubblellaneous.%s", line.Category, line.Name)] = line.EN_US
		}
		if len(line.EN_GB) > 0 {
			langs["en_gb"][fmt.Sprintf("%s.bubblellaneous.%s", line.Category, line.Name)] = line.EN_GB
		}
		if len(line.RU_RU) > 0 {
			langs["ru_ru"][fmt.Sprintf("%s.bubblellaneous.%s", line.Category, line.Name)] = line.RU_RU
		}
		if len(line.JA_JP) > 0 {
			langs["ja_jp"][fmt.Sprintf("%s.bubblellaneous.%s", line.Category, line.Name)] = line.JA_JP
		}
		if len(line.CS_CZ) > 0 {
			langs["cs_cz"][fmt.Sprintf("%s.bubblellaneous.%s", line.Category, line.Name)] = line.CS_CZ
		}
		if len(line.IT_IT) > 0 {
			langs["it_it"][fmt.Sprintf("%s.bubblellaneous.%s", line.Category, line.Name)] = line.IT_IT
		}
		if len(line.TOK) > 0 {
			langs["tok"][fmt.Sprintf("%s.bubblellaneous.%s", line.Category, line.Name)] = line.TOK
		}
	}

	return langs
}
