package main

import "fmt"

func arithmeticTriplets(nums []int, diff int) int {
	table := make(map[int]int)
	count := 0

	for index, number := range nums {
		table[number] = index
	}

	for key := range table {
		if _, ok := table[key+diff]; ok {
			if _, ok := table[key+2*diff]; ok {
				count++
			}
		}

	}

	return count
}

func main() {
	fmt.Println(arithmeticTriplets([]int{0, 1, 4, 6, 7, 10}, 3))
}
