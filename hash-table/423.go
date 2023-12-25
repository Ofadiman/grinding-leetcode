package main

import "fmt"

func originalDigits(s string) string {
	nums := make([]int, 10)

	for i := 0; i < len(s); i++ {
		char := s[i]

		if char == 'z' {
			nums[0]++
		}
		if char == 'o' {
			nums[1]++
		}
		if char == 'w' {
			nums[2]++
		}
		if char == 'r' {
			nums[3]++
		}
		if char == 'u' {
			nums[4]++
		}
		if char == 'f' {
			nums[5]++
		}
		if char == 'x' {
			nums[6]++
		}
		if char == 's' {
			nums[7]++
		}
		if char == 'g' {
			nums[8]++
		}
		if char == 'i' {
			nums[9]++
		}
	}

	nums[1] -= nums[0] + nums[2] + nums[4]
	nums[3] -= nums[0] + nums[4]
	nums[5] -= nums[4]
	nums[7] -= nums[6]
	nums[9] -= nums[5] + nums[6] + nums[8]

	res := []byte{}

	for i := byte(0); i < 10; i++ {
		for ; nums[i] > 0; nums[i]-- {
			res = append(res, i+'0')
		}
	}

	return string(res)
}

func main() {
	fmt.Println(originalDigits("zerozero"))
}
