package main

import "fmt"

func shuffle1(numbers []int, partitionSize int) []int {
	shuffled := make([]int, 0)

	for i := 0; i < partitionSize; i++ {
		shuffled = append(shuffled, numbers[i], numbers[i+partitionSize])
	}

	return shuffled
}

func main() {
	fmt.Println(shuffle1([]int{2, 5, 1, 3, 4, 7}, 3))
}
