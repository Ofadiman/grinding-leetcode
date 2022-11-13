package main

import "fmt"

func getConcatenation1(nums []int) []int {
	slice := make([]int, len(nums)*2)

	for i := 0; i < 2; i++ {
		for j := 0; j < len(nums); j++ {
			slice[i*len(nums)+j] = nums[j]
		}
	}

	return slice
}

func main() {
	fmt.Println(getConcatenation1([]int{1, 2, 3, 4}))
}
