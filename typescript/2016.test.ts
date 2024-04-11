import { expect, test } from 'vitest'

function maximumDifference(nums: number[]): number {
  if (nums.length === 0) {
    return -1
  }

  let diff = -1
  let left = nums[0]
  if (!left) {
    return -1
  }

  for (let i = 1; i < nums.length; i++) {
    const current = nums[i]
    if (!current) {
      continue
    }

    left = Math.min(left, current)
    if (left < current) {
      diff = Math.max(diff, current - left)
    }
  }

  return diff
}

test('should return -1 if array is empty', () => {
  expect(maximumDifference([])).toEqual(-1)
})

test('should return -1 if array is sorted in descending order', () => {
  expect(maximumDifference([3, 2, 1])).toEqual(-1)
})

test('should return difference between first and last item if array is sorted in ascending order', () => {
  expect(maximumDifference([1, 2, 3])).toEqual(2)
})

test('should return biggest difference between consecutive numbers', () => {
  expect(maximumDifference([87, 68, 91, 86, 58, 63, 43, 98, 6, 40])).toEqual(55)
})
