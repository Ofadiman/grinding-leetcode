package main

type SparseVector struct {
	nums []int
}

func Constructor1570(nums []int) SparseVector {
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
