package main

import "fmt"

func createSlice(n int) []int {
	var slice []int
	for i := 1; i <= n; i++ {
		slice = append(slice, i)
	}
	return slice
}

func processQueries(queries []int, m int) []int {
	answer := []int{}
	permutation := createSlice(m)

	for _, v1 := range queries {
		index := -1

		for j, v2 := range permutation {
			if v1 == v2 {
				index = j
				break
			}
		}

		if index == -1 {
			continue
		} else {
			answer = append(answer, index)
			a := permutation[index : index+1]
			b := permutation[:index]
			c := permutation[index+1:]

			n := []int{}
			n = append(n, a...)
			n = append(n, b...)
			n = append(n, c...)
			permutation = n
		}
	}

	return answer
}

func main() {
	fmt.Println(processQueries([]int{3, 1, 2, 1}, 5))
}
