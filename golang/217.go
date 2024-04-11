package main

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
