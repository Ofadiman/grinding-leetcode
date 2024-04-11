package main

func checkPalindrome(s string) bool {
	left := 0
	right := len(s) - 1

	interations := len(s) / 2
	for i := 0; i < interations; i++ {
		if s[left] == s[right] {
			left++
			right--
			continue
		} else {
			return false
		}
	}
	return true
}

func shortestPalindrome(s string) string {
	if checkPalindrome(s) {
		return s
	}

	prefix := ""
	for j := len(s) - 1; j > 0; j-- {
		maybePalindrome := prefix + string(s[j]) + s

		isPalindrom := checkPalindrome(maybePalindrome)
		if isPalindrom {
			return maybePalindrome
		}

		prefix += string(s[j])
	}

	return s
}
