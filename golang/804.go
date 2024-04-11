package main

import (
	"strings"
)

func uniqueMorseRepresentations(words []string) int {
	morseCodes := map[string]string{
		"a": ".-",
		"b": "-...",
		"c": "-.-.",
		"d": "-..",
		"e": ".",
		"f": "..-.",
		"g": "--.",
		"h": "....",
		"i": "..",
		"j": ".---",
		"k": "-.-",
		"l": ".-..",
		"m": "--",
		"n": "-.",
		"o": "---",
		"p": ".--.",
		"q": "--.-",
		"r": ".-.",
		"s": "...",
		"t": "-",
		"u": "..-",
		"v": "...-",
		"w": ".--",
		"x": "-..-",
		"y": "-.--",
		"z": "--..",
	}

	table := map[string]int32{}
	for _, word := range words {
		var slice []string
		for _, character := range word {
			slice = append(slice, morseCodes[string(character)])
		}

		morseWord := strings.Join(slice, "")

		if _, ok := table[morseWord]; ok {
			table[morseWord]++
		} else {
			table[morseWord] = 0
		}
	}

	return len(table)
}
