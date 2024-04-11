package main

func decode(encoded []int, first int) []int {
	result := make([]int, len(encoded)+1)
	result[0] = first

	for i, number := range encoded {
		first ^= number
		result[i+1] = first
	}

	return result
}
