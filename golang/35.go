package main

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
