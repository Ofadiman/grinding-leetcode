package main

import (
	"sort"
)

func minProductSum(nums1 []int, nums2 []int) int {
	table := make(map[int][]int)
	for i := 1; i <= 100; i++ {
		table[i] = []int{}
	}

	for i, number := range nums2 {
		table[number] = append(table[number], i)
	}

	var order []int
	for i := 1; i <= 100; i++ {
		order = append(order, table[i]...)
	}

	sort.Ints(nums1)

	sum := 0
	for i := 0; i < len(nums1); i++ {
		sum += nums1[i] * nums2[order[len(nums1)-1-i]]
	}
	return sum
}
