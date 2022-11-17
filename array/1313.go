package main

import "fmt"

func decompressRLElist1(nums []int) []int {
	var result []int

	for i := 0; i < len(nums); i += 2 {
		frequency := nums[i]
		value := nums[i+1]
		for j := 0; j < frequency; j++ {
			result = append(result, value)
		}
	}

	return result
}

func main() {
	fmt.Println(decompressRLElist1([]int{1, 2, 3, 4}))
}
