package main

import "testing"

func repeatedCharacter(s string) byte {
	m := make(map[rune]bool)

	for _, character := range s {
		_, exists := m[character]
		if exists {
			return byte(character)
		} else {
			m[character] = true
		}
	}

	return " "[0]
}

func TestRepeatedCharacter(t *testing.T) {
	got := repeatedCharacter("abcdd")
	want := "d"

	if string(got) != want {
		t.Errorf("Add(1, 2) = %v; want %v", got, want)
	}
}
