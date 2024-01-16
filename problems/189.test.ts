import { test, expect } from 'vitest'

function rotate(nums: number[], k: number): void {
  for (let i = 0; i < k % nums.length; i++) {
    for (let j = 0; j < nums.length; j++) {
      const last = nums[nums.length - 1]
      nums[nums.length - 1] = nums[j]
      nums[j] = last
    }
  }
}

const testCases = [
  {
    nums: [],
    k: 3,
    result: [],
  },
  {
    nums: [1],
    k: 3,
    result: [1],
  },
  {
    nums: [1, 2, 3],
    k: 1,
    result: [3, 1, 2],
  },
  {
    nums: [1, 2, 3],
    k: 2,
    result: [2, 3, 1],
  },
  {
    nums: [1, 2, 3],
    k: 3,
    result: [1, 2, 3],
  },
  {
    nums: [1, 2, 3],
    k: 4,
    result: [3, 1, 2],
  },
]

testCases.forEach((c) => {
  test(`should return ${c.result} for ${c.nums}`, () => {
    rotate(c.nums, c.k)
    expect(c.nums).toStrictEqual(c.result)
  })
})
