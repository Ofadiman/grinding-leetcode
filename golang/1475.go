package main

func finalPrices(prices []int) []int {
	slice := make([]int, len(prices))
	var stack []int

	for i := len(prices) - 1; i >= 0; i-- {
		for len(stack) > 0 && prices[i] < stack[len(stack)-1] {
			stack = stack[:len(stack)-1]
		}

		if len(stack) == 0 {
			stack = append(stack, prices[i])
			slice[i] = prices[i]
		} else {
			slice[i] = prices[i] - stack[len(stack)-1]
			stack = append(stack, prices[i])
		}
	}
	return slice
}
