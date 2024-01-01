package main

import (
	"fmt"
	"strings"
)

func findLatestStep(arr []int, m int) int {
	str := strings.Repeat("0", len(arr))

	answer := -1
	for index, value := range arr {
		runes := []rune(str)

		if len(runes) < value {
			continue
		}

		runes[value-1] = rune("1"[0])

		str = string(runes)

		groups := strings.Split(str, "0")

		for _, group := range groups {
			if len(group) == m {
				answer = index
			}
		}
	}

	if answer == -1 {
		return -1
	}

	return answer + 1
}

func main() {
	fmt.Println(findLatestStep([]int{3, 5, 1, 2, 4}, 1))
}
