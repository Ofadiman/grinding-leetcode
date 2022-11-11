package main

import "fmt"

func runningSum(nums []int) []int {
	currentSum := 0
	runningSumSlice := make([]int, len(nums))
	for i := 0; i < len(nums); i++ {
		currentSum += nums[i]
		runningSumSlice[i] = currentSum
	}

	return runningSumSlice
}

func main() {
	fmt.Println(runningSum([]int{1, 2, 3, 4}))
}
