package main

import "fmt"

func checkIfPangram(sentence string) bool {
	table := make(map[int32]int32)

	for _, character := range "aeioubcdfghjklmnpqrstvxz" {
		table[character] = 0
	}

	for _, character := range sentence {
		table[character]++
	}

	for _, count := range table {
		if count == 0 {
			return false
		}
	}

	return true
}

func main() {
	fmt.Println(checkIfPangram("thequickbrownfoxjumpsoverthelazydog"))
}
