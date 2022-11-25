package main

import (
	"fmt"
	"strings"
)

func removeOuterParentheses(s string) string {
	depth := 0
	var slice []string

	for _, character := range s {
		if string(character) == "(" {
			depth++
		}

		if depth > 1 {
			slice = append(slice, string(character))
		}

		if string(character) == ")" {
			depth--
		}
	}

	return strings.Join(slice, "")
}

func main() {
	fmt.Println(removeOuterParentheses("(()())(())"))
}
