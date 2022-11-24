package main

import (
	"fmt"
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

func main() {
	fmt.Println(maxDepth("(1+(2*3)+((8)/4))+1"))
}
