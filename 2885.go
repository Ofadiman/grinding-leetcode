package main

func unequalTriplets(nums []int) int {
	count := 0

	for i, n := range nums {
		for j := i + 1; j < len(nums); j++ {
			if n != nums[j] {
				for k := j + 1; k < len(nums); k++ {
					if nums[k] != n && nums[k] != nums[j] {
						count++
					}
				}
			}
		}
	}

	return count
}
