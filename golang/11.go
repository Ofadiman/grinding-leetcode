package main

import "math"

func maxArea(height []int) int {
	max := 0

	left := 0
	right := len(height) - 1

	for {
		if left == right {
			break
		}

		h1 := height[left]
		h2 := height[right]

		area := int(math.Min(float64(h1), float64(h2)) * float64((right - left)))

		if area > max {
			max = area
		}

		if h1 > h2 {
			right--
		} else {
			left++
		}
	}

	return max
}
