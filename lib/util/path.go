package util

import "strings"

func RealPath(category string, path string) string {
	parts := strings.SplitN(path, ":", 2)
	return strings.Join([]string{parts[0], category, parts[1]}, "/")
}
