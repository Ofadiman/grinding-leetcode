package main

import "fmt"

func shuffle(numbers []int, partitionSize int) []int {
	shuffled := make([]int, 0)

	for i := 0; i < partitionSize; i++ {
		shuffled = append(shuffled, numbers[i], numbers[i+partitionSize])
	}

	return shuffled
}

func main() {
	fmt.Println(shuffle([]int{2, 5, 1, 3, 4, 7}, 3))
}
