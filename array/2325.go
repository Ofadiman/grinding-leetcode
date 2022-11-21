package main

import (
	"bytes"
	"fmt"
)

func decodeMessage(key string, message string) string {
	table := map[rune]byte{' ': ' '}
	for _, c := range key {
		if _, ok := table[c]; !ok {
			table[c] = byte(len(table) - 1 + 'a')
		}
	}

	var buffer bytes.Buffer
	for _, c := range message {
		buffer.WriteByte(table[c])
	}

	return buffer.String()
}

func main() {
	fmt.Println(decodeMessage("the quick brown fox jumps over the lazy dog", "vkbs bs t suepuv"))
}
