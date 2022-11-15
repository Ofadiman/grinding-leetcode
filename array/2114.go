package main

import (
	"fmt"
	"math"
	"strings"
)

func mostWordsFound1(sentences []string) int {
	max := 0

	for i := 0; i < len(sentences); i++ {
		max = int(math.Max(float64(max), float64(len(strings.Split(sentences[i], " ")))))
	}

	return max
}

func main() {
	fmt.Println(mostWordsFound1([]string{"alice and bob love leetcode", "i think so too", "this is great thanks very much"}))
}
