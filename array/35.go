package main

import (
	"fmt"
)

func searchInsert(nums []int, target int) int {
	left := 0
	right := len(nums) - 1
	for left <= right {
		center := left + (right-left)/2
		value := nums[center]
		switch {
		case value < target:
			left = center + 1
		case value > target:
			right = center - 1
		default:
			return center
		}
	}
	return left
}

func main() {
	fmt.Println(searchInsert([]int{1, 3, 5, 6, 7}, 5))
}
