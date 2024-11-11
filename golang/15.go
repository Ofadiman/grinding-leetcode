package main

import (
	"sort"
)

func threeSum(nums []int) [][]int {
	var res [][]int
	sort.Ints(nums)

	for i := 0; i < len(nums); i++ {
		if i > 0 && nums[i] == nums[i-1] {
			continue
		}

		j, k := i+1, len(nums)-1

		for j < k {
			total := nums[i] + nums[j] + nums[k]

			if total > 0 {
				k--
			} else if total < 0 {
				j++
			} else {
				res = append(res, []int{nums[i], nums[j], nums[k]})
				j++

				for j < k && nums[j] == nums[j-1] {
					j++
				}
			}
		}
	}
	return res
}
