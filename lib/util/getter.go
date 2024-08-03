package util

func GetOrDefault[T any](value *T, dft T) T {
	if value == nil {
		return dft
	}

	return *value
}
