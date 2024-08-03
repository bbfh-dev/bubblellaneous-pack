package util

func Product[T any](arr1, arr2 []T) [][2]T {
	var result [][2]T
	for _, a := range arr1 {
		for _, b := range arr2 {
			result = append(result, [2]T{a, b})
		}
	}

	return result
}

func Merge[V any](map1 map[string]V, map2 map[string]V) map[string]V {
	for key, value := range map2 {
		map1[key] = value
	}

	return map1
}
