package main

func numIdenticalPairs(nums []int) int {
	counter := 0
	elements := make(map[int]int)

	for _, number := range nums {
		if elements[number] == 0 {
			elements[number] = 1
		} else {
			elements[number] = elements[number] + 1
		}

		counter += elements[number] - 1
	}

	return counter
}
