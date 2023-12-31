package main

func numSpecial(mat [][]int) int {
	rows := make([]int, len(mat))
	columns := make([]int, len(mat[0]))

	for i, row := range mat {
		for j, value := range row {
			rows[i] += value
			columns[j] += value
		}
	}

	output := 0
	for i, row := range mat {
		for j, value := range row {
			if value == 0 {
				continue
			}

			if rows[i] == 1 && columns[j] == 1 {
				output++
			}
		}
	}

	return output
}
