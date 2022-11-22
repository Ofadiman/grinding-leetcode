package main

import (
	"fmt"
	"sort"
)

func smallerNumbersThanCurrent(nums []int) []int {
	sortedNums := make([]int, len(nums))
	copy(sortedNums, nums)
	sort.Ints(sortedNums)
	counts := make([]int, len(nums))
	for i, num := range nums {
		counts[i] = sort.Search(len(sortedNums), func(j int) bool {
			return num <= sortedNums[j]
		})
	}
	return counts
}

func main() {
	fmt.Println(smallerNumbersThanCurrent([]int{8, 1, 2, 2, 3}))
}
