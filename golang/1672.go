package main

func maximumWealth(accounts [][]int) int {
	highestWealth := 0
	for i := 0; i < len(accounts); i++ {
		sum := 0
		for j := 0; j < len(accounts[i]); j++ {
			sum += accounts[i][j]
		}

		if highestWealth < sum {
			highestWealth = sum
		}
	}

	return highestWealth
}
