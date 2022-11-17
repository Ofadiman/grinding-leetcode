package main

import "fmt"

func createTargetArray1(nums []int, index []int) []int {
	result := make([]int, len(nums))

	for idx, i := range index {
		for j := len(result) - 1; j > i; j-- {
			result[j] = result[j-1]
		}

		result[i] = nums[idx]
	}

	return result
}

func main() {
	fmt.Println(createTargetArray1([]int{0, 1, 2, 3, 4}, []int{0, 1, 2, 2, 1}))
}
