package main

import "fmt"

func buildArray(nums []int) []int {
	result := make([]int, len(nums))
	for i := 0; i < len(nums); i++ {
		result[i] = nums[nums[i]]
	}

	return result
}

func main() {
	fmt.Println(buildArray([]int{0, 2, 1, 5, 3, 4}))
}
