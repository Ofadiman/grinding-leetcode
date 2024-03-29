package main

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
