package main

import (
	"fmt"
	"math"
)

func maxSubArray(nums []int) int {
	final := nums[0]
	max := nums[0]

	for i := 1; i < len(nums); i++ {
		max = int(math.Max(float64(max+nums[i]), float64(nums[i])))
		final = int(math.Max(float64(max), float64(final)))
	}

	return final
}

func main() {
	fmt.Println(maxSubArray([]int{-2, 1, -3, 4, -1, 2, 1, -5, 4}))
}
