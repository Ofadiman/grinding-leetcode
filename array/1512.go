package main

import "fmt"

func numIdenticalPairs1(nums []int) int {
	counter := 0
	for i := 0; i < len(nums); i++ {
		for j := 0; j < len(nums); j++ {
			if nums[i] == nums[j] && i < j {
				counter++
			}
		}
	}

	return counter
}

func numIdenticalPairs2(nums []int) int {
	counter := 0
	elements := make(map[int]int)

	for _, number := range nums {
		if elements[number] == 0 {
			elements[number] = 1
		} else {
			elements[number] = elements[number] + 1
		}

		counter += elements[number] - 1
	}

	return counter
}

func main() {
	fmt.Println(numIdenticalPairs2([]int{1, 2, 3, 1, 1, 3}))
}
