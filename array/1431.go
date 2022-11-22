package main

import (
	"fmt"
	"math"
)

func kidsWithCandies(candies []int, extraCandies int) []bool {
	highestCandyCount := 0
	for i := 0; i < len(candies); i++ {
		highestCandyCount = int(math.Max(float64(candies[i]), float64(highestCandyCount)))
	}

	result := make([]bool, len(candies))
	for i := 0; i < len(candies); i++ {
		if candies[i]+extraCandies >= highestCandyCount {
			result[i] = true
		} else {
			result[i] = false
		}
	}

	return result
}

func main() {
	fmt.Println(kidsWithCandies([]int{2, 3, 5, 1, 3}, 3))
}
