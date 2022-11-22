package main

import "fmt"

func containsDuplicate(nums []int) bool {
	table := make(map[int]int)

	for _, number := range nums {
		if _, ok := table[number]; ok {
			return true
		} else {
			table[number] = 1
		}
	}

	return false
}

func main() {
	fmt.Println(containsDuplicate([]int{1, 1, 1, 3, 3, 4, 3, 2, 4, 2}))
}
