package main

func runningSum(nums []int) []int {
	currentSum := 0
	runningSumSlice := make([]int, len(nums))
	for i := 0; i < len(nums); i++ {
		currentSum += nums[i]
		runningSumSlice[i] = currentSum
	}

	return runningSumSlice
}
