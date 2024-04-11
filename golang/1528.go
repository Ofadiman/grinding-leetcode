package main

import (
	"strings"
)

func restoreString(s string, indices []int) string {
	reordered := make([]string, len(indices))

	for i := 0; i < len(indices); i++ {
		reordered[indices[i]] = string(s[i])
	}

	return strings.Join(reordered, "")
}
