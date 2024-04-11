package main

func numberOfEmployeesWhoMetTarget(hours []int, target int) int {
	answer := 0

	for _, value := range hours {
		if value >= target {
			answer++
		}
	}

	return answer
}
