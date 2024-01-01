package main

import (
	"fmt"
	"strings"
)

func restoreString(s string, indices []int) string {
	reordered := make([]string, len(indices))

	for i := 0; i < len(indices); i++ {
		reordered[indices[i]] = string(s[i])
	}

	return strings.Join(reordered, "")
}

func main() {
	fmt.Println(restoreString("codeleet", []int{4, 5, 6, 7, 0, 2, 1, 3}))
}
