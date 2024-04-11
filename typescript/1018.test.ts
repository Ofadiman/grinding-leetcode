import { expect, test } from 'vitest'

function prefixesDivBy5(nums: number[]): boolean[] {
  if (nums.length === 0) {
    return []
  }

  let current = 0
  const result: boolean[] = []
  for (let i = 0; i < nums.length; i++) {
    const n = nums[i]
    if (n === undefined) {
      continue
    }

    current = (current * 2 + n) % 5
    result.push(current === 0)
  }

  return result
}

test('should handle empty array', () => {
  expect(prefixesDivBy5([])).toEqual([])
})

test('should handle all zeros', () => {
  expect(prefixesDivBy5([0, 0, 0, 0, 0])).toEqual([true, true, true, true, true])
})

test('should handle all ones', () => {
  expect(prefixesDivBy5([1, 1, 1, 1, 1])).toEqual([false, false, false, true, false])
})

test('should handle arbitrary values', () => {
  expect(prefixesDivBy5([0, 1, 0, 1, 0])).toEqual([true, false, false, true, true])
})
