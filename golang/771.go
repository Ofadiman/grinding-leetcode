package main

import (
	"fmt"
	"strings"
)

func numJewelsInStones(jewels string, stones string) int {
	counter := 0
	for _, letter := range stones {
		if strings.Contains(jewels, string(letter)) {
			counter++
		}
	}

	return counter
}

func main() {
	fmt.Println(numJewelsInStones("aA", "aAAbbbb"))
}
