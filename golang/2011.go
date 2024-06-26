package main

func finalValueAfterOperations(operations []string) int {
	result := 0

	for i := 0; i < len(operations); i++ {
		switch operations[i] {
		case "--X":
			result -= 1
		case "X--":
			result -= 1
			break
		case "++X":
			result += 1
		case "X++":
			result += 1
			break
		}
	}

	return result
}
