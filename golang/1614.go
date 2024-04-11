package main

import (
	"math"
)

func maxDepth(s string) int {
	max := 0
	current := 0
	for _, value := range s {
		if string(value) == "(" {
			current++
		}

		if string(value) == ")" {
			current--
		}

		max = int(math.Max(float64(max), float64(current)))
	}

	return max
}
