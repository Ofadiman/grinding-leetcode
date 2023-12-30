package main

import "fmt"

func numberOfEmployeesWhoMetTarget(hours []int, target int) int {
	answer := 0

	for _, value := range hours {
		if value >= target {
			answer++
		}
	}

	return answer
}

func main() {
	fmt.Println(numberOfEmployeesWhoMetTarget([]int{0, 1, 2, 3, 4}, 2))
}
