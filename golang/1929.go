package main

func getConcatenation(nums []int) []int {
	slice := make([]int, len(nums)*2)

	for i := 0; i < 2; i++ {
		for j := 0; j < len(nums); j++ {
			slice[i*len(nums)+j] = nums[j]
		}
	}

	return slice
}
