package main

func shuffle(numbers []int, partitionSize int) []int {
	shuffled := make([]int, 0)

	for i := 0; i < partitionSize; i++ {
		shuffled = append(shuffled, numbers[i], numbers[i+partitionSize])
	}

	return shuffled
}
