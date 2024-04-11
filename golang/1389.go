package main

func createTargetArray(nums []int, index []int) []int {
	result := make([]int, len(nums))

	for idx, i := range index {
		for j := len(result) - 1; j > i; j-- {
			result[j] = result[j-1]
		}

		result[i] = nums[idx]
	}

	return result
}
