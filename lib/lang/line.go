package lang

// CATEGORY	NAME	EN_US	EN_GB	RU_RU	IT_IT	JA_JP	CS_CZ	TOK
type Line struct {
	Category string
	Name     string
	EN_US    string
	EN_GB    string
	RU_RU    string
	IT_IT    string
	JA_JP    string
	CS_CZ    string
	TOK      string
}

func NewLine(line []string) *Line {
	return &Line{
		Category: line[0],
		Name:     line[1],
		EN_US:    line[2],
		EN_GB:    line[3],
		RU_RU:    line[4],
		IT_IT:    line[5],
		JA_JP:    line[6],
		CS_CZ:    line[7],
		TOK:      line[8],
	}
}
