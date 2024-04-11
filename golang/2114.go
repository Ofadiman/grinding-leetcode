package main

import (
	"math"
	"strings"
)

func mostWordsFound(sentences []string) int {
	max := 0

	for i := 0; i < len(sentences); i++ {
		max = int(math.Max(float64(max), float64(len(strings.Split(sentences[i], " ")))))
	}

	return max
}
