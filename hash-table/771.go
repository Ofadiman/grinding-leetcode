package main

import (
	"fmt"
	"strings"
)

func numJewelsInStones1(jewels string, stones string) int {
	table := make(map[int32]int)

	for _, letter := range stones {
		if table[letter] == 0 {
			table[letter] = 1
		} else {
			table[letter] += 1
		}
	}

	counter := 0
	for _, letter := range jewels {
		counter += table[letter]
	}

	return counter
}

func numJewelsInStones2(jewels string, stones string) int {
	counter := 0
	for _, letter := range stones {
		if strings.Contains(jewels, string(letter)) {
			counter++
		}
	}

	return counter
}

func main() {
	fmt.Println(numJewelsInStones2("aA", "aAAbbbb"))
}
