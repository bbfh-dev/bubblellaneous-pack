package util

import (
	"fmt"
	"strings"
)

func RealPath(category string, path string) string {
	parts := strings.SplitN(path, ":", 2)
	return strings.Join([]string{parts[0], category, parts[1]}, "/")
}

func GamePath(path string) string {
	parts := strings.Split(path, "/")
	return fmt.Sprintf("%s:%s", parts[0], strings.Join(parts[2:], "/"))
}

func NoNamespace(path string) string {
	parts := strings.Split(path, ":")
	if len(parts) == 1 {
		return parts[0]
	}
	return parts[1]
}
