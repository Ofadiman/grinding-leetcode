import { expect, test } from 'vitest'

function sumCounts(nums: number[]): number {
  if (nums.length === 0) {
    return 0
  }

  let result = 0
  let counter = 1
  while (true) {
    if (counter > nums.length) {
      break
    }

    for (let i = 0; i <= nums.length - counter; i++) {
      const slice = nums.slice(i, counter + i)
      const set = new Set(slice)
      result += Math.pow(set.size, 2)
    }

    counter++
  }

  return result
}

test('should return correct value for empty array', () => {
  expect(sumCounts([])).toEqual(0)
})

test('should return correct value for array with the same numbers', () => {
  expect(sumCounts([1, 1])).toEqual(3)
  expect(sumCounts([1, 1, 1])).toEqual(6)
})

test('should return correct value for array with unique numbers', () => {
  expect(sumCounts([5, 2, 1])).toEqual(20)
})

test('should return correct value for array with some duplicated numbers', () => {
  expect(sumCounts([2, 2, 1])).toEqual(12)
})
