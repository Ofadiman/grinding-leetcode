package main

import "fmt"

type SparseVector struct {
	nums []int
}

func Constructor(nums []int) SparseVector {
	return SparseVector{
		nums: nums,
	}
}

func (r *SparseVector) dotProduct(vec SparseVector) int {
	sum := 0

	for i := 0; i < len(r.nums); i++ {
		sum += r.nums[i] * vec.nums[i]
	}

	return sum
}

func main() {
	v1 := Constructor([]int{1, 0, 0, 2, 3})
	v2 := Constructor([]int{0, 3, 0, 4, 0})
	fmt.Println(v1.dotProduct(v2))
}
